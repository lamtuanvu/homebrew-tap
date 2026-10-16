class Pacer < Formula
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.0/pacer-darwin-arm64"
      sha256 "187f17e59b36799b2cce180bb84494ac3edabcf41791cbdcd555bc46ae5f42a6"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.0/pacer-darwin-x64"
      sha256 "7aecbe5ba13627ad37d657fc2de2b627c7dfe21df47f33c8f42a2853f161861d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.0/pacer-linux-arm64"
      sha256 "5121e0207424bb622098494ba8a260176c67882a76bff159d805d856fb654eb0"
    end

    on_intel do
      url "https://github.com/lamtuanvu/pacer/releases/download/v0.2.0/pacer-linux-x64"
      sha256 "70f19445f6166100bf0b74887de859127e0bca3c968525ab9e1eeb8426fc8cb7"
    end
  end

  def install
    bin.install Dir["pacer-*"].first => "pacer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pacer --version")
  end
end
