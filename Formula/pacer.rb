class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.15/pacer-darwin-arm64"
      sha256 "dab41e8ac9b3ab3709e3f7dd09de571b52a808e55d758020102ab74b449ef275"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.15/pacer-darwin-x64"
      sha256 "22d39eef909d5e437f057e533182feb0f1314067a424d46e511474ccc0713eeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.15/pacer-linux-arm64"
      sha256 "69d56e83c7a9cbce00f30d20477e5eb0b62f5847a7b3ac634f6551a27abcf83e"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.15/pacer-linux-x64"
      sha256 "61864369d97933d2cae1c082d68efe03d4c8400aad80f44d36e453019a8014b1"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
