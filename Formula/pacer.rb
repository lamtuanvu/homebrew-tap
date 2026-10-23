class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.8.1/pacer-darwin-arm64"
      sha256 "1d53be2ed857e3ecc79d48eb59ded4e754d6e5c4739bcde13327012b54a8ccbb"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.8.1/pacer-darwin-x64"
      sha256 "eb9e68faa4bdb7f9963c87c5456e65149cb09b7e9b228f071d5684e2a625c427"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.8.1/pacer-linux-arm64"
      sha256 "b4d675dfe7143df30abf84a48897f585a4b756b23b1b05c3784fa6b6ee0741ef"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.8.1/pacer-linux-x64"
      sha256 "7f6e2772c4b584974436b3c7dd4f3144a98f6107f09bf45683cd3eba57a5709d"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
