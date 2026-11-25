class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.5/pacer-darwin-arm64"
      sha256 "38a5591c7f3b902ed3c49169561bcd232d99eb698cc2c6bdea83c86ed1733194"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.5/pacer-core-darwin-arm64"
        sha256 "50e755270f391281cfdc4da9ef252d381557cf6e5d7f399f445015bc94b5980b"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.5/pacer-darwin-x64"
      sha256 "763ef78c9c9b7e491396fc4f8b465533d29d06c77ca16f0964687b47fcef8baf"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.5/pacer-core-darwin-x64"
        sha256 "fe58bfc25f3ced3740426614784a0349bf0e1eba8359bc3ee12636fbe534a56b"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.5/pacer-linux-arm64"
      sha256 "643a47b882599c23a9a857be39e39fcda49faed423a80b7f206fa89cb0602c5c"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.5/pacer-core-linux-arm64"
        sha256 "1ffcb394ea3f8121a47e6c07bba334b4baf542a9dcadfd26a7e2dc35aa65e4a1"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.5/pacer-linux-x64"
      sha256 "d7bc080b443857c7b3d7867ede8b7b7d7ccb151a5d3d31cda2d8e07b8a1a222e"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.5/pacer-core-linux-x64"
        sha256 "086c1fab98b8b1f02e1fa54ae66c90b089e3ec727fcdf69688125401d39a1e1b"
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
