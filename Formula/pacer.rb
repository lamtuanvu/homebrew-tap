class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.4.0/pacer-darwin-arm64"
      sha256 "a75d4333bd22d9cace89695def918c009de920e0e4a2a5f21c6ea97b9599d014"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.4.0/pacer-darwin-x64"
      sha256 "bfdf8f00b98d38817f20c4ee106baeb202f945a55731df4627c4e8cc47f092dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.4.0/pacer-linux-arm64"
      sha256 "a42a4660eb9c3cc1c1b6050bfbc0693a935a6833b9c5caabd7fa69e341e3b8be"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.4.0/pacer-linux-x64"
      sha256 "71aa5ae05bcbfa8d988b2f7c80e2c84bc2b2b1ee7dcbbd464b7b2b17723f7c87"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
