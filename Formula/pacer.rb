class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.17.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.9/pacer-darwin-arm64"
      sha256 "7c179eb801f34f8029febdac16415cd1cf583fa018670df06d040c11e02ee9c6"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.9/pacer-core-darwin-arm64"
        sha256 "cedefff8ff7ddfc94536e93a53146adf1923ebe0742ab3c914e7aea85c96563a"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.9/pacer-darwin-x64"
      sha256 "6626acc7597d46a0ac99e0c0a3b6677041c5ca7887c910711e7b287129727c3f"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.9/pacer-core-darwin-x64"
        sha256 "67dd6443915dbf3f1e0bf64f2d081e6f5cd2006802bcb324a38ace11424dccfe"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.9/pacer-linux-arm64"
      sha256 "2832bedbfda5a005f684bafcc871653b7a78a2a32dbc8ed70354578106269dbd"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.9/pacer-core-linux-arm64"
        sha256 "e8ff1d277d83fdb6b1592bacc3d2602e93e404904499c64ff1b9bddf6d966099"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.9/pacer-linux-x64"
      sha256 "9e8c539c868a31c2c210aff7f6a1eec78dbc661d795b0ab85e3fa679b3649090"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.9/pacer-core-linux-x64"
        sha256 "297fa16f3154c4240b92c4a6ce6e16cd75e6226a1faecc7a9d3fcba09449c55f"
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
