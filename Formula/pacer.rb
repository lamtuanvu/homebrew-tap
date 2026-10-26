class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.10.0/pacer-darwin-arm64"
      sha256 "4b54bf4c6ca6896702024a8e57f6bd20d3a30e020709c9a44717f48c028127ac"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.10.0/pacer-darwin-x64"
      sha256 "cf5e6295b3e10d2f4fe9f8afe0a5f3f5f9c9914475ee3e65010ccc349b2a870d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.10.0/pacer-linux-arm64"
      sha256 "1115a4a2319956d6d9d201a2961cbd75a2689c4462ddb5764e7b1aa265f77f93"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.10.0/pacer-linux-x64"
      sha256 "77f1cb0c63186a4d1cdcc1e62d1880df7bdefe9d05ba9c278a322ec474a41d5e"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
