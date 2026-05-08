class CurlImpersonate < Formula
  desc "curl build that impersonates browser TLS/HTTP fingerprints"
  homepage "https://github.com/lexiforest/curl-impersonate"
  license "MIT"
  version "1.5.6"

  on_macos do
    on_arm do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v1.5.6/curl-impersonate-v1.5.6.arm64-macos.tar.gz"
      sha256 "8960639189747306262fd26cfdc3f5ece52c300257c448a2171252c1060f3f04"
    end
    on_intel do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v1.5.6/curl-impersonate-v1.5.6.x86_64-macos.tar.gz"
      sha256 "05589344cac1ef5aaee89397c2070e45f12eeeba4f0cfba79780a28c46d8a751"
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
