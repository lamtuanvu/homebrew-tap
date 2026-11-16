class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.0/pacer-darwin-arm64"
      sha256 "f2f532a7d75636cc52bea8b79f0c72ba3a5c12c15e77b1f6b03e8ed2a7e1a81a"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.0/pacer-core-darwin-arm64"
        sha256 "aaaace22408276070ac5bdd89911693b961b7f70fd62374bb49906b57813b340"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.0/pacer-darwin-x64"
      sha256 "2a38d04e7d0e412c964c5c113a79bd2d14d45b028a6a8bd3a63d29f5264d4b6c"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.0/pacer-core-darwin-x64"
        sha256 "1d25ae30c636224b36669a0d3ef9eb6508d5c6323713d7a900680deb2a835c9d"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.0/pacer-linux-arm64"
      sha256 "1f35ac70c2540f1125809446f5e0887dd7451ffb0d15cee63e29356b55a814e0"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.0/pacer-core-linux-arm64"
        sha256 "9ba2eb25f794fdd0909d0c5101f7d571773e1050c04f040dee0b300909641848"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.0/pacer-linux-x64"
      sha256 "eb0912b2629dc3491d446557c7749516d422e1a58fa5beb45ca48e4b724786b4"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.0/pacer-core-linux-x64"
        sha256 "4dcfe0301ba6a576ea93322471cebbdb85d0cd2b256cf7b592e20df489c58f4e"
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
