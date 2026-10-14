class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.22"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.22/pacer-darwin-arm64"
      sha256 "52ac588451cac25bd4ad18954bdd200a0e8ea1b682e63949bc7b48acec0c60bf"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.22/pacer-darwin-x64"
      sha256 "5fa74f41f3fff449360e6a3950c0da6fbd20d981674603440dde76135b217e32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.22/pacer-linux-arm64"
      sha256 "c709c00f11be0c3cdcf7612161e508168378563e028ddde4fb6993cdf3789ef4"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.22/pacer-linux-x64"
      sha256 "25e50baa431eab238c412600e89fccc5d7b8055f4693712f0c4cf024592c0aa8"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
