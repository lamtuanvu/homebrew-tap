class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.5.0/pacer-darwin-arm64"
      sha256 "98cbf93c04b22f20ee13eb9b75ab9ac8e773a869bf88b0b8c302296847f85b31"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.5.0/pacer-darwin-x64"
      sha256 "804861a1c806f08d07427a4e6f6d47e1a99d3a56817cc5b8e7eb8f689274187b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.5.0/pacer-linux-arm64"
      sha256 "c62d552b6466ba90b68a97aaeb4c74ac71d17271ad272676ae93386f04da148e"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.5.0/pacer-linux-x64"
      sha256 "c830455b1fa5bf38043c86a30c365b29b941cc1cbc5e144f1cdae27ffa412d67"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
