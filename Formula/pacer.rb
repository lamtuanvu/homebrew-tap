class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.17.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.10/pacer-darwin-arm64"
      sha256 "a3045d79ffcfa77702ecb64345bddabed9cf7e9d323bb3466a21762587df9ef0"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.10/pacer-core-darwin-arm64"
        sha256 "319d0ce2e8918d905c6e41daf9fc97079f6708c868a09f56ddcb630ce27bdb8a"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.10/pacer-darwin-x64"
      sha256 "ca58690f281502868ed7c82ed656fd53487a87f90099edd15bc2451bbdb2b774"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.10/pacer-core-darwin-x64"
        sha256 "124cd793d7c08b493a84a0d95a00a268e29961ab46f9a1ade122df062ac4ea79"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.10/pacer-linux-arm64"
      sha256 "c376e7b2838bc75c212925f1d89ed27ee17e9ec5c3fc701da1de91b64f227786"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.10/pacer-core-linux-arm64"
        sha256 "4ba5308602f9a89170b7b9fa7f460960a2bf15e75ee71b37cad3cca9beabb220"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.10/pacer-linux-x64"
      sha256 "351eac9701eaa3b2db3f1adec2058828343cf1c9e41e7c661fcf88d6dfc3237e"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.10/pacer-core-linux-x64"
        sha256 "300293571fe15c7a69560e0cd781b7ad593bbde196b29822b15d6140a2eede83"
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
