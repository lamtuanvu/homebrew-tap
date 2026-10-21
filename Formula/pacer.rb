class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.6.1/pacer-darwin-arm64"
      sha256 "4ea3fd6a850ebd2d245aef77d9ca6ea9c1e35dc72ce2ca3fa8d491d9e845e714"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.6.1/pacer-darwin-x64"
      sha256 "385a2a6996aee82aa69449cefb083372638ac9a440ad7e89487b6d17f4bfd737"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.6.1/pacer-linux-arm64"
      sha256 "9864bc2ee225d01e0326f615dc59b53d6286cdc6834d437b85e0afa60748a264"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.6.1/pacer-linux-x64"
      sha256 "a3286388ddb9d7a570bd8a1f01fd5d470769bd9f416ae1d36fa078d5ebcd805e"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
