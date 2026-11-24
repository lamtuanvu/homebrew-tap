class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.0/pacer-darwin-arm64"
      sha256 "14cec313ee700b7226f11c88e2ab7bf10100db8f0b30e2f917d664f2f99ca039"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.0/pacer-core-darwin-arm64"
        sha256 "ee1fa6d9130f69d4421a0b1f4a0fa4e879824d40ce8a4e9f4364281c2688751e"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.0/pacer-darwin-x64"
      sha256 "bd984dd100795b7c7ed7a261c8848dac738f0a68fd476c94d4a215e663dd18be"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.0/pacer-core-darwin-x64"
        sha256 "65997b4b36740cbd3f41fc45d3e3d68cdb6e012f2fc36e351d059f085d3f155d"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.0/pacer-linux-arm64"
      sha256 "67c633b9f34abbf850480d44255033ca2b8e4dd8649ced3953f7e19f6b94e9fc"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.0/pacer-core-linux-arm64"
        sha256 "14682d04774aa79f1ee71781017320207e4946013e654971d98435a889ca88b5"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.0/pacer-linux-x64"
      sha256 "97e4892e4b1f7aa4b0a5690bf9314c560927daeb8b3f3d29deb08240129c87d0"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.0/pacer-core-linux-x64"
        sha256 "2f6159986bd6e1710c272406de053d34b9af5cb5d76858911556a5aebf151176"
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
