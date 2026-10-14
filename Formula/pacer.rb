class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.21"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.21/pacer-darwin-arm64"
      sha256 "3720e681438b2e403703a56a46857d962851f2eaa043fe4dee4083230906793a"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.21/pacer-darwin-x64"
      sha256 "112cba2577c496d6db827e7675d872a57112af6dc6cec994a7ec8544d5f4a6d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.21/pacer-linux-arm64"
      sha256 "cbb1cf831fbfdd71c74914238743643019eb2285cca6e7532e40b7d1a8cb376c"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.21/pacer-linux-x64"
      sha256 "fff6f472b30b0736d2b8ec2f0e1a934c645a0d70759015a9f25938dd6d5097f9"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
