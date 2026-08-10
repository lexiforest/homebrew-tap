class CurlImpersonate < Formula
  desc "Curl build that impersonates browser TLS/HTTP fingerprints"
  homepage "https://github.com/lexiforest/curl-impersonate"
  version "2.1.0"
  license "MIT"

  depends_on "ca-certificates"

  on_macos do
    on_arm do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.1.0/curl-impersonate-v2.1.0.arm64-macos.tar.gz"
      sha256 "eaba6c9f8246310dae2d7168f2264f458518a0894262230da7309b9cdb1c5260"
    end
    on_intel do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.1.0/curl-impersonate-v2.1.0.x86_64-macos.tar.gz"
      sha256 "8a945a35cb715dab02958ffb4a49ae2f6f9f146c8e366a3201942e30a4993384"
    end
  end

  def install
    bin.install Dir["*"]
  end

  test do
    system "#{bin}/curl-impersonate", "--version"
  end
end
