class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.20"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.20/pacer-darwin-arm64"
      sha256 "a1711b90c3830c0e3666ee03c93ba7cfe5bd36c3324d354fe7b738c2a0339baa"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.20/pacer-darwin-x64"
      sha256 "f2b75bff83992c222eb6c0f17be3e3d2330626c57e8a98bc1a573a50c60ad1cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.20/pacer-linux-arm64"
      sha256 "1e950781ffcb0e9cf6b01770b54dcb08b78407ea1eeca634cafdb5504528fb4d"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.20/pacer-linux-x64"
      sha256 "c9a713819a58e599649be371ce22d67cfb0d98b34ca64132a024dfed9bb749ae"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
