class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.8.0/pacer-darwin-arm64"
      sha256 "0e3959eb8f398efe1f9682b944e567d152bd29928d0c73fc1a76f20de45acdaa"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.8.0/pacer-darwin-x64"
      sha256 "dab5a85383c277d47dcf5d81a369f8a489fac7ac673f09549b7359072f9bdde7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.8.0/pacer-linux-arm64"
      sha256 "9be9b598b4ac4ab62a674de2b0aa652d167db50620ffa3e950371cc4fc6858c6"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.8.0/pacer-linux-x64"
      sha256 "f642d2a274b6d6494a1f2643dba61bbe093ba02812a22c1f33dcf51ea82a3fc4"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
