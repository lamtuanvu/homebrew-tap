class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.1/pacer-darwin-arm64"
      sha256 "dec6eda98ccb075b6d7e084e2ba54b60f94b8b325bdae85bbda726eeddcf0d3d"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.1/pacer-darwin-x64"
      sha256 "e34218f1555e95d7b00c336aec66e92f13de462bbb5bb8d23650deb9afe18180"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.1/pacer-linux-arm64"
      sha256 "9a57a3e5fb2869ad3fecbe070ed6078d210b44ee5af5ddd12140c127e5cf9ae1"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.1/pacer-linux-x64"
      sha256 "eb65446caf715e28191025920d76fd504cda3acf1cf22da7ee3c046cc6e4ca11"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
