class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.17.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.8/pacer-darwin-arm64"
      sha256 "acad3a0e3fffd73c4b9e8e8d6059ec1ffd3bd4c7eda9b83812daefacf95fefaf"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.8/pacer-core-darwin-arm64"
        sha256 "8e9c2993b68eaa2e72306b306ccc7baa494c11768d68f9b23503ddadd79ca488"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.8/pacer-darwin-x64"
      sha256 "25f5404bfee79d9a8db0ae71fec8d46e0e4d56e344d883b47fdef8d6294dd2f1"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.8/pacer-core-darwin-x64"
        sha256 "07245920ddd8e68b43d316812d7ad9e48a4b0863f7803005a0f3292901781d40"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.8/pacer-linux-arm64"
      sha256 "61f50da862d7072b3b3a9351dc2a92f3e7a59b623335ee07b9a6f16e1876a179"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.8/pacer-core-linux-arm64"
        sha256 "5e35aff1b1a5674d83d80fb2850b880ab062e4956b842b2dd98c5d04462209a6"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.8/pacer-linux-x64"
      sha256 "10729a850fbe1efde258b2b2d3ea45a36a3480365dd8c6ba978882b991eb3af2"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.8/pacer-core-linux-x64"
        sha256 "b09f256c7dcaf24262f8b33a9ce4904a387f5d3f993c767e97c7782ab1321ec3"
      end
    end
  end

  def install
    libexec.install Dir["pacer-*"].first => "pacer"
    resource("pacer-core").stage do
      libexec.install Dir["pacer-core-*"].first => "pacer-core"
    end
    bin.install_symlink libexec/"pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
