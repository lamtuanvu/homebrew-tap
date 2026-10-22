class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.7.1/pacer-darwin-arm64"
      sha256 "f37bb3f6c2dd804e69c0651bda6fd4846ab92b00623b4dc95d75e89e64bbb340"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.7.1/pacer-darwin-x64"
      sha256 "4f5d5be10f5c7bbe63f6dd31f6645e05e95940981dcf44d6a0064e3486286abb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.7.1/pacer-linux-arm64"
      sha256 "568bfd50d010e96d5cf71f63d53608fb3b006b2a069f9432ccedb08495815221"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.7.1/pacer-linux-x64"
      sha256 "68ea865e1728ac475c2935d8b96a75dae0a2f35c01d7598fd3aefd6d7f3787b3"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
