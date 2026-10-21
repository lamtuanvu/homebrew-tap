class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.6.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.6.2/pacer-darwin-arm64"
      sha256 "df81746902afc4c07a538c9688000403a54b0d7ad75126cbca8897091e66eabe"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.6.2/pacer-darwin-x64"
      sha256 "d412b332e75a0714f592774b09730e5497bff115f44e3d5edc4796510fcdbc0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.6.2/pacer-linux-arm64"
      sha256 "0e31746a5eb43ed981a212e1d204d54f28e6ecaef7a2cb881fe65ad097b4a4c5"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.6.2/pacer-linux-x64"
      sha256 "9036e743345867c6aee5b928615503ae9fb5c97ff194d57a8c037b14fd14ee2a"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
