class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.18/pacer-darwin-arm64"
      sha256 "0e30354e48eee7f6cc7292d299490b8a829b76c5ffe31ecae176ef0f71fb6fb3"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.18/pacer-darwin-x64"
      sha256 "cae6e28c3e4860f43c0190ce38351ce87db7d3182044daa427ccf687f7883b0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.18/pacer-linux-arm64"
      sha256 "bad44e346fb80641d14e1c9b2fc80c029800e0760d2973e3f1737f8f404eead4"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.18/pacer-linux-x64"
      sha256 "c9e502665a2728e8c91113fe2b93ca26196f8db56698d3ee86bd50bfc185f71b"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
