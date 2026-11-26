class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.8/pacer-darwin-arm64"
      sha256 "d036e11e8f91adc73ef55e4dfc46ab57a061fad966edb0008b673b963580a902"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.8/pacer-core-darwin-arm64"
        sha256 "fecb0c517f2f25a7375affeac45d9a0bc042c506345d72ca41cdef191b08a93a"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.8/pacer-darwin-x64"
      sha256 "bce9f36434d0747ae5660e7bb0ac3e4b5e6feadfa554238308df11c2649ff663"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.8/pacer-core-darwin-x64"
        sha256 "3ee0616bc1cf07b42f23959ed7bdfe28773b32454a122d760de8814b0e463165"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.8/pacer-linux-arm64"
      sha256 "6c97524a7d2117b504bbc748e095aeec275d2402128565cc28c2880a4d8a3696"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.8/pacer-core-linux-arm64"
        sha256 "67e3baed334586f8c4a98157a72a645a10414a9dbde2bf165b59d5fc9eb9bf2d"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.8/pacer-linux-x64"
      sha256 "8ce27068335ebb13d9f02a71bfb18f4c9ab8f26fb6206d6885dc9966894aa80d"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.8/pacer-core-linux-x64"
        sha256 "6a51829135689b320191b26259a10ff8de48a3f34262e0a0872e9dbdcdabd0d1"
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
