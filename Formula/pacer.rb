class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.19.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.19.0/pacer-darwin-arm64"
      sha256 "27e0df2af6bc96a42244f10df055803307bccf860f542566513879a207b8196a"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.19.0/pacer-core-darwin-arm64"
        sha256 "29bbb92b492c420678a97802821b1fb69b5bd7df6417ecbe21354ff8686dd09b"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.19.0/pacer-darwin-x64"
      sha256 "51ed72202607b4738e7fdd603c5141bf69c00722c69340d0dfed9680e296dce6"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.19.0/pacer-core-darwin-x64"
        sha256 "99c801115ce611608d7f7cc01d38d585971ecc6071345edc37041056475321f0"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.19.0/pacer-linux-arm64"
      sha256 "92d26ffb9f25705cc91e6440c8a68c79c13f78aec90dd24843682bb3494e8ff1"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.19.0/pacer-core-linux-arm64"
        sha256 "7cd3ea741ee60f62c83706ec0082d200be8f405212a0920d7a13a4eb48e69d26"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.19.0/pacer-linux-x64"
      sha256 "c228e062cc1630f2509adfccd8a0a1c456f3183ab2441172f277fe7b3d2a6914"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.19.0/pacer-core-linux-x64"
        sha256 "d7349423bf1a3e84caaf41a6a8f557590531f0dd38678ef2a83b96c849bfb0b4"
      end
    end
  end

  def install
    # Formulae cannot declare a cask conflict; the desktop app owns `pacer` when installed (ADR 0021).
    if (HOMEBREW_PREFIX/"Caskroom/pacer").exist?
      odie "The pacer desktop app is installed with Homebrew and manages its own pacer command. Run: brew uninstall --cask pacer"
    end
    libexec.install Dir["pacer-*"].first => "pacer"
    resource("pacer-core").stage do
      libexec.install Dir["pacer-core-*"].first => "pacer-core"
    end
    bin.install_symlink libexec/"pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
