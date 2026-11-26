class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.18.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.7/pacer-darwin-arm64"
      sha256 "2c22c2aaf29211e96932f3bc373bb7e0ee3c8e1649b7a0aacf8b7dfa6f4c4f24"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.7/pacer-core-darwin-arm64"
        sha256 "5bf6bd923d6b77d1cab87d4beeed0a2000cd0283df1a324447f9483b9e2b2310"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.7/pacer-darwin-x64"
      sha256 "4dd6608b9e5f23485f975f51168a9345f138cce78971389a1beacc3143213ac5"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.7/pacer-core-darwin-x64"
        sha256 "cac415c8c172c5c6a220cbfddbc05d6970d8e892d69f65dfd35adc63e96630ef"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.7/pacer-linux-arm64"
      sha256 "866b229cbd457e66798f9e4063dacda5e3054fdaf1c96ddc99d4bafba9e0f50c"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.7/pacer-core-linux-arm64"
        sha256 "34baf1c00844da6189559f62d40b2978d4ebb7752261db3d294f298c20fed785"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.7/pacer-linux-x64"
      sha256 "53463a9bdd20cc047d731d75067d00d7e84982da72323ff34f3a07ccee6bb386"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.18.7/pacer-core-linux-x64"
        sha256 "a4b36a13f831598bd7a346aeb87a95b2c8d00c73ce878707f4662d844243d678"
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
