class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.16.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.16.0/pacer-darwin-arm64"
      sha256 "4921fb591ec701b95e15f011f7f519c823df69d57c03a492a7b390107fdaa45c"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.16.0/pacer-core-darwin-arm64"
        sha256 "b2810555adda6dcc84b0a8d46916cba1dcc9e77cf8c5f55265b34d5b5f1c3afa"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.16.0/pacer-darwin-x64"
      sha256 "469418b603bb31e19a1ae5dd8754574509ee36eb6889382dc18c809251104df9"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.16.0/pacer-core-darwin-x64"
        sha256 "62bfca8d36b77dbff31b85020f9c32ed54f8de9669dfd527bead596798d3014a"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.16.0/pacer-linux-arm64"
      sha256 "9bc024888e31a113d0243eeeca8ddbeac6e1e2480796b05f9295b7d49d1ea784"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.16.0/pacer-core-linux-arm64"
        sha256 "0dff2cfb4c809c208e574b3ed46e4822e8767de0abfd6353c817ef5f77357f32"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.16.0/pacer-linux-x64"
      sha256 "64ef53e464e5b33019a84489e2030d54217dcb3209c677c263364dd4366633ca"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.16.0/pacer-core-linux-x64"
        sha256 "8fe2b6add66d20a89a4843ecda37c558d0254e0e47d7ff0bdf2922f5e0cff4c1"
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
