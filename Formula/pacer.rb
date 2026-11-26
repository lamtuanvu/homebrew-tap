class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.6/pacer-darwin-arm64"
      sha256 "acd49738d2d508dfcc358e50f39698ab8d64f88795c47c1f364373ea8f9a0b13"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.6/pacer-core-darwin-arm64"
        sha256 "710222059fc80b84f1d70994cc7648e0b55b8f8fca95e330a3b6d479542694e8"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.6/pacer-darwin-x64"
      sha256 "7c591d29d43c83e3935b316b2ba050442348afb3d36ade69ccf9a8bf20fac049"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.6/pacer-core-darwin-x64"
        sha256 "6eba8388c860820fda9d573a60d9e9c1e7554181a485c2937a92211c4b161665"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.6/pacer-linux-arm64"
      sha256 "db81adf08efdfb7df9aa4a5ba2a4790ccfd7b272b8b9f0045977eec33521af80"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.6/pacer-core-linux-arm64"
        sha256 "ceb74469acf3e60ca53e7a3087e993023a43e7ad9b638a34c08b80cf2cea8c26"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.6/pacer-linux-x64"
      sha256 "0cbea34a9a68feec9f4a571e77a9f4b0c85e8c7366e22149fa644989faa77eb1"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.6/pacer-core-linux-x64"
        sha256 "e37ac20a8b77f6d1a94de2f690b43707193789efe26a29a5229809aca9d2728f"
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
