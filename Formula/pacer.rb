class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.11.0/pacer-darwin-arm64"
      sha256 "90b39821ab700ab48e42df82526de93fc94e9c5c36a3b05bea4f43bcb6865898"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.11.0/pacer-darwin-x64"
      sha256 "30c27021a09ac4ec748a3c4c3d09ee257ae8f65a24e0f7bd610cbcabbafd9715"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.11.0/pacer-linux-arm64"
      sha256 "74f465bfa89e03d9d5d4860beec60fc39fc42af91b10971bbd911246ad44cfd0"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.11.0/pacer-linux-x64"
      sha256 "9d76da70f559b4b26a704d3a22a9bf49772b4a196eb87154abca968be29736e4"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
