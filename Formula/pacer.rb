class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.19/pacer-darwin-arm64"
      sha256 "f0a11197c1d9cd3711bbfa8facfc906cbacdaa638a118673e3f793ea9df1a0c5"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.19/pacer-darwin-x64"
      sha256 "6c43ad2b30956a4f3920234eea1288bbcda75ed90dc71f6cc0f1d4c4ef2f5a08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.19/pacer-linux-arm64"
      sha256 "7075c34aafe597c5a8328e322c4a80b2c721dae94e71b58524515f53d14411a1"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.19/pacer-linux-x64"
      sha256 "1bc17440396ea8dbf68f312dd4b70fa97b6814acefe391c8f86484fdb88bc752"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
