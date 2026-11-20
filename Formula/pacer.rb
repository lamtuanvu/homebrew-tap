class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.17.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.7/pacer-darwin-arm64"
      sha256 "c51bf4604ed84d305095cf5237669b522aa9434e7e3f1ae87aee330f8cb4318a"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.7/pacer-core-darwin-arm64"
        sha256 "dabada8fb47b3b2f3108b9d0acafb57f0880a653b84ae1be9c715902ed5136f5"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.7/pacer-darwin-x64"
      sha256 "400053eda67200ee6ee42631a4b13ff45ba138a18a0410dea635ebcf87ef1041"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.7/pacer-core-darwin-x64"
        sha256 "22179d92032ae2c356f54659fc22bec990ea4aaa8cc4961491ea7105c7385209"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.7/pacer-linux-arm64"
      sha256 "772a3e06cff1f7ce96fed083860857d2177572ca1d5204ad7aeb791f0f73681e"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.7/pacer-core-linux-arm64"
        sha256 "35797ca0d58ed4211d0109b34dc443fdce4c41db1cdb63865abb9a730a66b353"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.7/pacer-linux-x64"
      sha256 "a448414144ff5a1f5be10747ed66dc583f052512d9a4d6c7b5353f0abd874bd8"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.7/pacer-core-linux-x64"
        sha256 "10cb60704c27a66202d2676aeefe0a49ef902a0461b7a2952ea316bd96dd0767"
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
