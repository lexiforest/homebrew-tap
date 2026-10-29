"""Offline regression tests: python3 script/test-update-curl-impersonate.py."""

import re
import runpy
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
UPDATER = runpy.run_path(str(ROOT / "script/update-curl-impersonate"))


class UpdateFormulaTests(unittest.TestCase):
    def setUp(self):
        self.formula = (ROOT / "Formula/curl-impersonate.rb").read_text()
        self.release = {"tag_name": "v9.8.7", "assets": []}
        for index, platform in enumerate([
            "arm64-macos", "x86_64-macos", "aarch64-linux-gnu", "x86_64-linux-gnu",
        ], start=1):
            name = f"curl-impersonate-v9.8.7.{platform}.tar.gz"
            self.release["assets"].append({
                "name": name,
                "browser_download_url": f"https://example.com/{name}",
                "digest": f"sha256:{index:064x}",
            })

    def test_updates_each_os_and_architecture_without_crossing_blocks(self):
        updated, tag = UPDATER["update_formula"](self.formula, self.release)
        self.assertEqual(tag, "v9.8.7")
        self.assertIn('version "9.8.7"', updated)
        blocks = re.findall(r"^  on_(macos|linux) do\n(.*?)^  end$", updated, re.M | re.S)
        self.assertEqual(len(blocks), 2)
        for os_name, block in blocks:
            assets = self.release["assets"][:2] if os_name == "macos" else self.release["assets"][2:]
            for arch, asset in zip(["arm", "intel"], assets):
                self.assertIn(
                    f'    on_{arch} do\n      url "{asset["browser_download_url"]}"\n'
                    f'      sha256 "{asset["digest"][7:]}"', block,
                )
        self.assertEqual(UPDATER["update_formula"](updated, self.release)[0], updated)

    def test_missing_linux_asset_fails(self):
        self.release["assets"].pop()
        with self.assertRaisesRegex(SystemExit, "Missing release asset:.*x86_64-linux-gnu"):
            UPDATER["update_formula"](self.formula, self.release)

    def test_missing_linux_block_fails(self):
        formula = re.sub(r"^  on_linux do\n.*?^  end\n", "", self.formula, flags=re.M | re.S)
        with self.assertRaisesRegex(SystemExit, "Could not update on_linux block"):
            UPDATER["update_formula"](formula, self.release)


if __name__ == "__main__":
    unittest.main()
