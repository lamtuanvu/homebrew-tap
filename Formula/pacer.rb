class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.15.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.1/pacer-darwin-arm64"
      sha256 "fc2b2c7d226ddeb9cd63ac29578d83c7c11c9c06f75ec524761aa2daff8d55bb"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.1/pacer-core-darwin-arm64"
        sha256 "d4544efd2a9e6a6ef674077418fc4fe1bb4d4d7f91f53cbe7d89f80e58efb435"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.1/pacer-darwin-x64"
      sha256 "a890b0af9266a695ffccb3d2fcbb021397c12286cfd5a2050a849ad57732e763"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.1/pacer-core-darwin-x64"
        sha256 "be72cf3227a0bb9c77ac3a5e8cbb255b1f89b4d6a0c48e25aad7dd714a33a8d8"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.1/pacer-linux-arm64"
      sha256 "d9fc5eefa0a2c33728a0f06a568effc2db15856e15628d8de1d3c974f8c3cb62"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.1/pacer-core-linux-arm64"
        sha256 "aad9527043453652539591cc62999d0ef98852191127ab9a2bdd0b0bee3ee57a"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.1/pacer-linux-x64"
      sha256 "ec10fa2dbe2cb533e576095c18a3a63bd6b0c5ccccea341ce2026b29846d68b9"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.15.1/pacer-core-linux-x64"
        sha256 "acc26e6233b18e8d8dc16dcd46ec2c7bb72b513e0a8856b0f2a9b3656f603184"
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
