class CurlImpersonate < Formula
  desc "Curl build that impersonates browser TLS/HTTP fingerprints"
  homepage "https://github.com/lexiforest/curl-impersonate"
  url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.1.1/curl-impersonate-v2.1.1.arm64-macos.tar.gz"
  version "2.1.1"
  sha256 "09247a144471f85540185a177c5b2ba630ee25d5e5acf283c13dbbf6da865cef"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.1.1/curl-impersonate-v2.1.1.x86_64-macos.tar.gz"
    sha256 "db2cd649164bd5639e9314c127f6ffcac2cb70a53d65987092488d9f616943ac"
  end

  depends_on "ca-certificates"

  def install
    bin.install Dir["*"]
  end

  test do
    system "#{bin}/curl-impersonate", "--version"
  end
end
