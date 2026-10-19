class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.3.0/pacer-darwin-arm64"
      sha256 "cac3c030a49eef2e957d333526ffb0dcc67dc2c74922144576b6af34c3d61309"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.3.0/pacer-darwin-x64"
      sha256 "fdbb8191e69535714e6c6e18a1844fb96919f1b15e43a273174832580ffb103f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.3.0/pacer-linux-arm64"
      sha256 "c73de84730cea834b0e4960425ad84bbd4cea24fd6ecae3bc1564f186c117cc8"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.3.0/pacer-linux-x64"
      sha256 "f0fef9097ac635f64e7452feee3324e7a2ebdf2e777635b87284c9a614cdf08f"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
