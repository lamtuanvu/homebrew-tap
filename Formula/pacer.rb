class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.17/pacer-darwin-arm64"
      sha256 "92b6403e8605e37b28a13c14266c5e9cc36c8ed36919df7627549eb77efa7e0d"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.17/pacer-darwin-x64"
      sha256 "ceeb80ffa13eb8c2b2199a6755c91bfe84aecc028a5b234920c8a246addf4ae5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.17/pacer-linux-arm64"
      sha256 "9387860c3f69d0912ef6cc0c25af7b5495c9d46f596867c7bc1d1a01d8536e23"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.17/pacer-linux-x64"
      sha256 "0d149ef77908a39d776ab0498cfeadda358d09fadb491b1f5a157b6c5363a8c7"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
