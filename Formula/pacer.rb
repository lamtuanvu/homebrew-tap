class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.17.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.5/pacer-darwin-arm64"
      sha256 "ebbc461620d270b8d9b06309ba05b2fb1215c54467cadc18d3015a31397d1a72"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.5/pacer-core-darwin-arm64"
        sha256 "e0098c5df6a9a462e91b20f1bdf99671b83f7de06392bb39c96ddf26bd0a4931"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.5/pacer-darwin-x64"
      sha256 "363f7f955a8d9f643e64b8e5176ade10c4be942adfca0cfe8d37e934d7178a8c"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.5/pacer-core-darwin-x64"
        sha256 "203556d8755f3dd53ff4d1c09a540c3a200f748bc8646cfaad424877c0214e31"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.5/pacer-linux-arm64"
      sha256 "a9b2bcfb39732d50b8b1db2b01164d526766789292de37a73fe3236e1f6a0483"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.5/pacer-core-linux-arm64"
        sha256 "1bcd897a8c8df9e6180fab497d8e1f915157a7d8217bd5ed1eba590ea21faebe"
      end
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.5/pacer-linux-x64"
      sha256 "1732a785328dc6a3036786c3b2fee3de239ac2637d3db09652d2efb823ecfeac"
      resource "pacer-core" do
        url "https://github.com/lamtuanvu/pacer/releases/download/v0.17.5/pacer-core-linux-x64"
        sha256 "36133fe46b2986fddcb440768be4d6c69b0d0768a90f272245faf40808bfa2a2"
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
