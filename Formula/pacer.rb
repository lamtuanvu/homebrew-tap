class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.23"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.23/pacer-darwin-arm64"
      sha256 "50c52e1b7266470629db284e51074fe1685df3045058aead5bfc312960a413ee"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.23/pacer-darwin-x64"
      sha256 "a25b7233c876254c934f795a982e007ef9220c81b4ff49d026a10dc6d5e05cb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.23/pacer-linux-arm64"
      sha256 "1b92c429dd7c833e938f9b0484370a0680e49dc35e0cca43186e433d813bb706"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.23/pacer-linux-x64"
      sha256 "82e90b1ecf94093a757a32272a7b68ba2c7cc560ee99f44b5222181f0f1a1e85"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
