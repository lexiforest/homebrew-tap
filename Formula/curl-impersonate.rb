class CurlImpersonate < Formula
  desc "Curl build that impersonates browser TLS/HTTP fingerprints"
  homepage "https://github.com/lexiforest/curl-impersonate"
  version "2.2.3"
  license "MIT"

  depends_on "ca-certificates"

  on_macos do
    on_arm do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.2.3/curl-impersonate-v2.2.3.arm64-macos.tar.gz"
      sha256 "2569f4139460fcb301484d37938de91b1c220efd15487ee22a9db554262062fe"
    end
    on_intel do
      url "https://github.com/lexiforest/curl-impersonate/releases/download/v2.2.3/curl-impersonate-v2.2.3.x86_64-macos.tar.gz"
      sha256 "4686806d59abea93866a917c3025a049ef3d7a3240de742ad66bd1a4d9890dc7"
    end
  end

  def install
    bin.install Dir["*"]
  end

  test do
    system "#{bin}/curl-impersonate", "--version"
  end
end
