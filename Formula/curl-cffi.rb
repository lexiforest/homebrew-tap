class CurlCffi < Formula
  include Language::Python::Virtualenv

  desc "HTTP client CLI with browser impersonation support"
  homepage "https://github.com/lexiforest/curl_cffi"
  version "0.17.0"
  license "MIT"

  depends_on "certifi" => :no_linkage
  depends_on "cffi" => :no_linkage
  depends_on "python3"

  on_macos do
    on_arm do
      url "https://files.pythonhosted.org/packages/dc/ab/cd7e71bc96c36521193d3dcd38e1a08a9939538fc34b50ba81f30201f9b3/curl_cffi-0.17.0-cp310-abi3-macosx_11_0_arm64.whl"
      sha256 "88cb5e34eb23eb2106711b06df68027209c72be709df239c6029345551e0acfd"
    end
    on_intel do
      url "https://files.pythonhosted.org/packages/c6/f8/6e289cc68d943c4625732eb253bdeec92c5022c7d5ea9215c0581c526789/curl_cffi-0.17.0-cp310-abi3-macosx_10_9_x86_64.whl"
      sha256 "56d622930eac5cee4cc6ebe63eaba3ecca65a2c73aa6bdf099c2ffae55ee988c"
    end
  end

  on_linux do
    on_arm do
      url "https://files.pythonhosted.org/packages/e6/6f/063eb68f3353bde506f4ca01005b24a07f59103bc8640889ea1954af9302/curl_cffi-0.17.0-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.whl"
      sha256 "aa91d26234516ddb9eb97310d5fe1705aa6f677f101d57ffdb76d5f75439506e"
    end
    on_intel do
      url "https://files.pythonhosted.org/packages/e5/ef/7bb612007cf254ad6406e9563201baf87f57686308353b0fefde4b356212/curl_cffi-0.17.0-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
      sha256 "af0782d5e340b65fd76701630f0284a8f8243d77df5f2637efd09a4b009f4e24"
    end
  end

  pypi_packages package_name:     "",
                exclude_packages: %w[certifi cffi]

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393/rich-14.3.3.tar.gz"
    sha256 "b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources

    # Homebrew caches downloads with a hash prefix that pip rejects for wheels.
    wheel = buildpath/cached_download.basename.to_s.sub(/^[0-9a-f]{64}--/, "")
    cp cached_download, wheel
    venv.pip_install_and_link wheel, build_isolation: false
  end

  test do
    assert_match "curl-cffi", shell_output("#{bin}/curl-cffi --help")
  end
end
