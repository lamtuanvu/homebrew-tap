class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.1/pacer-darwin-arm64"
      sha256 "2516b3b976983b1009797bcd4b09ea42096bfc9bf3b330baaa1f702587cb1508"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.1/pacer-core-darwin-arm64"
        sha256 "6d72be73de3e50f30fcde8b51bfbde41a8d66837f6b11e84a1af30e9fa833cf4"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.1/pacer-darwin-x64"
      sha256 "623ab42c99412a62440adec60d41607c9bf518d860078920663cd6dacea8bbb6"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.1/pacer-core-darwin-x64"
        sha256 "1de9d19295bef9c1774959b98657f7f58dcecee6d3c5666e0c7657ce005bee7a"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.1/pacer-linux-arm64"
      sha256 "1be60668234ccf1ef1eccac874c0c6a2515b4304549654a0efd5d0234a84086a"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.1/pacer-core-linux-arm64"
        sha256 "76a50389efb30daada1d200bc98549b8d00d7df3f73cd58ff2df9b5b28d77c67"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.1/pacer-linux-x64"
      sha256 "7eebf01eaae1610ef65db67951901f62369a27a7995e5f47c2cd3c2d5d21350f"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.1/pacer-core-linux-x64"
        sha256 "307a65aa61abfc64d0bbee334c653c8eeb415cad042ab7c893b972a5e1f515f5"
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
