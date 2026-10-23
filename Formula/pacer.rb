class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.9.0/pacer-darwin-arm64"
      sha256 "b52cf10881169bc49c04f6ebafbb8853e8f0051090b0652fa9c76fae29e6a2b8"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.9.0/pacer-darwin-x64"
      sha256 "c4edcf9bc1c7fa6b82dda2e19e01401a3c7e014733495b9c6048660fb52cdb4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.9.0/pacer-linux-arm64"
      sha256 "13ebfa30671e984ccc5f1c20654bb3554ac7aa86c6690b7e6e02c784b64b0493"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.9.0/pacer-linux-x64"
      sha256 "01473f9dd6cd96ed6920401a98850b15a7aacfb2ecc52144fae07507a749c693"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
