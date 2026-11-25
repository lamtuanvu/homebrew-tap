class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.2/pacer-darwin-arm64"
      sha256 "422e11db7478350e32d579ca61fac5c67bcc99460c67b50f53336666f74b7cbe"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.2/pacer-core-darwin-arm64"
        sha256 "b5806be11db7465b2a7fec175af2b09aa3740756aeecad796c1e6872906ab8a2"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.2/pacer-darwin-x64"
      sha256 "0de7ff921fb15383ac29db068fcfe80dd9dba6d91442a5eb982a26b6c9446623"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.2/pacer-core-darwin-x64"
        sha256 "da12b1f10a84cb3354de793e5ae4f1427af00ea5abac7c12275ccb6b3ca4901e"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.2/pacer-linux-arm64"
      sha256 "981df77e69ea6d967b4b43864a658d6660ba22718e2028c203416776ca9b1dd0"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.2/pacer-core-linux-arm64"
        sha256 "e594005498989277096ee4f40c74d5511fa878ef04127f79261a5564fd671a34"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.2/pacer-linux-x64"
      sha256 "2f073b4b23299dfab696ca9ba59b22a6781a346fa94109586cf385f43e2c27fe"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.2/pacer-core-linux-x64"
        sha256 "ab239ddf480d561b5c1fa43fd71e6109d2a01fff7b2f1a83903cdd5112da0f46"
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
