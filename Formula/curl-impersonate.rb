class CurlImpersonate < Formula
  desc "curl build that impersonates browser TLS/HTTP fingerprints"
  homepage "https://github.com/lexiforest/curl-impersonate"
  license "MIT"
  version "2.0.0"

  on_macos do
    on_arm do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.0.0/curl-impersonate-v2.0.0.arm64-macos.tar.gz"
      sha256 "deda8cef7a7ec05f4a56e67d10e7faaf0bf2d200d3bef1043cdc0fded7f10d0e"
    end
    on_intel do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.0.0/curl-impersonate-v2.0.0.x86_64-macos.tar.gz"
      sha256 "4588e32ac5a3fde7f8a3922653e81e5232b94990cf8298c1f26102bb5b0f720b"
    end
  end

  depends_on "ca-certificates"

  def install
    bin.install Dir["*"]
  end

  test do
    system "#{bin}/curl-impersonate", "--version"
  end
end
