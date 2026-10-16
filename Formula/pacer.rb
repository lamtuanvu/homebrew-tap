class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.3/pacer-darwin-arm64"
      sha256 "bd0b77890298ca1841bf1b14f8f439b00084a1168837438be961f64107bf08f1"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.3/pacer-darwin-x64"
      sha256 "1a763b33e90164cb8f2eb252c8dff0780ad3b2ae227e12545d9b47980727a498"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.3/pacer-linux-arm64"
      sha256 "0320c2c2c91e05457c487b936619d965689ae9e09e84b2a3fd6952705bbe2a15"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.3/pacer-linux-x64"
      sha256 "13dc680f2aa1f9a8f7c035115fdf7e3ecc55258487753af11f5747b97f3e6238"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
