class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.3.1/pacer-darwin-arm64"
      sha256 "f91e96ce8907b20ecf4ed7cae0ac75e8cfe7a9e86b95f4b83d5a0039262ff079"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.3.1/pacer-darwin-x64"
      sha256 "04f024c5b72d875b1df557885ad4b8f8ba33d10f7062baf1e8e4658b66718101"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.3.1/pacer-linux-arm64"
      sha256 "fc2d5e7ee164110c152272acc492af85ad1f9d633e93e100f04cdb3bc635f9ba"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.3.1/pacer-linux-x64"
      sha256 "138fdb5ece513beaf9a6c548b54f2b69fcc01eae8c35968d5f9b02a669496cd9"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
