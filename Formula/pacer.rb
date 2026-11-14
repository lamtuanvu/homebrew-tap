class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.14.0/pacer-darwin-arm64"
      sha256 "8c838426b68adfbe69524f40ace820a600a512f9b84abef630419013004bc8c3"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.14.0/pacer-core-darwin-arm64"
        sha256 "6047fb33cd1cd852f6442397836a943be850543ee9cc98d41d17fccb1a49f914"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.14.0/pacer-darwin-x64"
      sha256 "114b8486e107d0440d54d147570b7dc8af25aee1e97aa65d30fd8534aac69f4b"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.14.0/pacer-core-darwin-x64"
        sha256 "70b621179bc4f5120a248579f04fc9b5f169376add9548ebd3d1f784f3dfc5cd"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.14.0/pacer-linux-arm64"
      sha256 "bb87489f2b6dbc41f3dba1d20b30641b67748e42398ed432b506a5ccf7e7d3a3"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.14.0/pacer-core-linux-arm64"
        sha256 "d4a39ae31f6965d57b141efb8932b64febd42d414fb9f7519700669db7cdf7cf"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.14.0/pacer-linux-x64"
      sha256 "9529625edb38705777b6d034d1733457553614673a26e44fb79a2eeeac188bc9"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.14.0/pacer-core-linux-x64"
        sha256 "e7789fd0506691b625a86b3d21efe5af7a2fc457e13d60d2e507e7cdcd25ccd7"
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
