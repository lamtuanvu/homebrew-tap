class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.12.0/pacer-darwin-arm64"
      sha256 "a5bcaba8215873e335f0e8803a81454581a2d8e44894437e6306a6cf22a91ae1"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.12.0/pacer-core-darwin-arm64"
        sha256 "a604bb9e7ec01083e9c3ea635faec8004699ce8774fa668b65eff4f689cae9c5"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.12.0/pacer-darwin-x64"
      sha256 "6f8f3de4ec66642f847937670b899e5b578495b9a9f8a5e4f21b91575794d422"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.12.0/pacer-core-darwin-x64"
        sha256 "66f739396d47bfaa223e7a5cb20bf848bcd08bb5335d28429828e435e8bfa82e"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.12.0/pacer-linux-arm64"
      sha256 "a3fe06399743589e15410ecd185b8337d1e28d92a9357e514677a2096d5dcfe2"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.12.0/pacer-core-linux-arm64"
        sha256 "b8227b6c45f2c4e3fad9cb5e53a0bdbdbc74963a4ab4bb5ffb481178818260dc"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.12.0/pacer-linux-x64"
      sha256 "251026d57e33e1a17f1febdb2dee85da2c385e4c8cc8d4519ff242581ee0389d"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.12.0/pacer-core-linux-x64"
        sha256 "bd4cb7f2acc424923fcbc8d0f477048eba8a155bc03b74ab660a23d9e2b19222"
      end
    end
  end

  def install
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
