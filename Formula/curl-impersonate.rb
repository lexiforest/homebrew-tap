class CurlImpersonate < Formula
  desc "Curl build that impersonates browser TLS/HTTP fingerprints"
  homepage "https://github.com/lexiforest/curl-impersonate"
  version "2.1.1"
  license "MIT"

  depends_on "ca-certificates"

  on_macos do
    on_arm do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.1.1/curl-impersonate-v2.1.1.arm64-macos.tar.gz"
      sha256 "09247a144471f85540185a177c5b2ba630ee25d5e5acf283c13dbbf6da865cef"
    end
    on_intel do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.1.1/curl-impersonate-v2.1.1.x86_64-macos.tar.gz"
      sha256 "db2cd649164bd5639e9314c127f6ffcac2cb70a53d65987092488d9f616943ac"
    end
  end

  def install
    bin.install Dir["*"]
  end

  test do
    system "#{bin}/curl-impersonate", "--version"
  end
end
