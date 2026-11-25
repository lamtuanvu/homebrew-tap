class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.4/pacer-darwin-arm64"
      sha256 "efe919a04f6374e0d32b6ed01abc7ab91c32e47fc43131e3a6e801e52118c8b8"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.4/pacer-core-darwin-arm64"
        sha256 "bb541d65c5d5a3d36fed028fd69911ccdb455314fce99399e46bea91d5c6579f"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.4/pacer-darwin-x64"
      sha256 "6d1d8abf245fe945cf4e7ed9c56af02931505ee6f863085f9b7ea23c7e84f856"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.4/pacer-core-darwin-x64"
        sha256 "c4c2cba4c672bd651a2556c3799426be253cf30a6cacf503e1adf7998516b5c5"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.4/pacer-linux-arm64"
      sha256 "8e11d5bce89c0fd6968513c3368b738625b0c3c0d8098eefe870be8948fd401b"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.4/pacer-core-linux-arm64"
        sha256 "c520385189651a125408d39914318aea991c1bfdb884df9a81f170e5f72273d9"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.4/pacer-linux-x64"
      sha256 "b44aa6196b7dab72aae3b1492575e994c84c2d556033d4c4654546fe53e18bae"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.4/pacer-core-linux-x64"
        sha256 "ca433eaa3a5f2dba62ab658c8d01b6de3ca26ea7438f0d4abcb05ba4c4b45f46"
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
