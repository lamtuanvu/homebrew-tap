class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.2/pacer-darwin-arm64"
      sha256 "ba05509d3cab25c7b3f479bbb4c46efe59a6dacb01c3e343af432154b0129445"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.2/pacer-darwin-x64"
      sha256 "8eec7e23c362f281b0fad6b1a648f83c225ad04113de1bf6a6d50ac8563e2e8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.2/pacer-linux-arm64"
      sha256 "3021bc8172d730521e20983573bd80d3a83283581c4c5d5c513be1c14cad382b"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.2/pacer-linux-x64"
      sha256 "c7d7a9ed04c40d023bed969d00795891122fe7c49f7f4e333db86c45c092b751"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
