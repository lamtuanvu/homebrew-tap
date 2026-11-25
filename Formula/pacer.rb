class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.3/pacer-darwin-arm64"
      sha256 "af542a11344db0d20262bc6879e248821b2179e0d6ebbe44347926e9a8858fe9"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.3/pacer-core-darwin-arm64"
        sha256 "6e3ace35875f443ebc1a94a9d31a5526ec6b699cb70c9d928df22132706476d9"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.3/pacer-darwin-x64"
      sha256 "46f09ddc053bb5e89205ad5048d8a6e69507232ca4f6ac3e63657e5ee73c8e26"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.3/pacer-core-darwin-x64"
        sha256 "c7ec1786ef0b6bcb4b741de9ed6e0adacb9967270870d4db7187f9638d4ae5f3"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.3/pacer-linux-arm64"
      sha256 "950c12558e10cf06c4c592d9490ea8f911fc5a6b8474064376b587dfe503ccfa"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.3/pacer-core-linux-arm64"
        sha256 "228d78e7083dc8207957fe2d48c9c6f262ba9db1d9353e498aa1aa42337b3d3a"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.3/pacer-linux-x64"
      sha256 "0466f14521d374c953d341eb4a15fd3c553c177eb63c60e41d2425db7cbb1be9"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.3/pacer-core-linux-x64"
        sha256 "90d9fb2e0f1d62c77871ce16642b5a71d3087646314f8e64ee7650ad4e96da6e"
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
