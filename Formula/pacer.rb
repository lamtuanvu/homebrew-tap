class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.24"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.24/pacer-darwin-arm64"
      sha256 "0dfd510bf279d90efd4ec7cc9a04b9d3ca1d2e3860c3e0c4e3af62ba54c904bc"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.24/pacer-darwin-x64"
      sha256 "288a0fdd35d888aa390cd513fad0d6bb40bf1a5e9a681487e825807d8b997ae1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.24/pacer-linux-arm64"
      sha256 "1d865aa304b8dc3cf8fe1054ecf72d155435b68f7bea270c67261990d9ab9849"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.24/pacer-linux-x64"
      sha256 "d37e6bc8dc6853a70312e7f7acb072e138fd2cdc663dca11b5f63e73de5520ea"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
