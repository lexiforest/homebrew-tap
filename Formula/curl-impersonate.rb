class CurlImpersonate < Formula
  desc "curl build that impersonates browser TLS/HTTP fingerprints"
  homepage "https://github.com/lexiforest/curl-impersonate"
  license "MIT"
  version "1.5.2"

  on_macos do
    on_arm do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v1.5.2/curl-impersonate-v1.5.2.arm64-macos.tar.gz"
      sha256 "f9a6841d1fe4fa84d062b63ddb36db2d61146243bb2ed46a77fd93b28bd97f7e"
    end
    on_intel do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v1.5.2/curl-impersonate-v1.5.2.x86_64-macos.tar.gz"
      sha256 "a89329c3de3b400bdc22713081ce0f062ddea976a1622853d0085ad72ca037d1"
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
