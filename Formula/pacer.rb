class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.20.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.20.0/pacer-darwin-arm64"
      sha256 "5402af925a90c0cd6d05e03de33b9fe97624c5ef271e2018c5cc0d65fa62c5a2"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.20.0/pacer-core-darwin-arm64"
        sha256 "3e22e110478152f6bbcc2733aff9f50adc55a0f2367e158982bd37cdb4de11ac"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.20.0/pacer-darwin-x64"
      sha256 "4fe8c89a7fc0d268f531e97497f9fdcc9a30d1d24dd1c3fffbad61ad60a2d1f2"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.20.0/pacer-core-darwin-x64"
        sha256 "33b34fc7ed3792160149763dab12db54c7d443ec86e1b1a709c1a46d8ef2ea9b"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.20.0/pacer-linux-arm64"
      sha256 "09f8545470dc808af91668ffa4af2310b2f12f88af320b1641cbbb382f440b48"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.20.0/pacer-core-linux-arm64"
        sha256 "b362d09c2011224e46183e4b84c352cbd5d67ead199260880286569c42d19287"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.20.0/pacer-linux-x64"
      sha256 "9cc501489d357d7e53517a035b88a38c23e37175ac650af6b5d3b31f4f02acc4"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.20.0/pacer-core-linux-x64"
        sha256 "0a219fb2b5416ec3e9148b862e60956896e5c644a0e88e4f7e87c89bc3e46f28"
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
