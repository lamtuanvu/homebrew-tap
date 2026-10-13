class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.1.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.16/pacer-darwin-arm64"
      sha256 "e7f196102f6b0ec06226181b1345f7a90d41ba01976e247099ddc49de58cf331"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.16/pacer-darwin-x64"
      sha256 "9851af5b54e47eb1ef29f492395ede339e65b2f31c5826102c07330d5217b98d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.16/pacer-linux-arm64"
      sha256 "a22afb81fd6997e9889129d719e2df02ddb1c3fe57efdb78d665013693b64cf1"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.1.16/pacer-linux-x64"
      sha256 "835e3af5507cda3e8abd64a37da61cd191eba0d95429993e936a0a96dfe3abda"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
