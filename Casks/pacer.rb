cask "pacer" do
  version "0.18.7"

  on_arm do
    sha256 "1b2daf7631fd5a7343dd5da6d6389d7b37cc9acd7a6814f0a110aad5b74ed28e"

    url "https://github.com/lamtuanvu/pacer/releases/download/v#{version}/desktop-pacer-#{version}-darwin-aarch64.dmg"
  end
  on_intel do
    sha256 "9a003822aff27ddcd2c7378e0110e6f66a0b5067fc2f4f58b9777747aff369b4"

    url "https://github.com/lamtuanvu/pacer/releases/download/v#{version}/desktop-pacer-#{version}-darwin-x86_64.dmg"
  end

  name "pacer"
  desc "Subscription budget routing for AI coding agents"
  homepage "https://github.com/lamtuanvu/pacer"

  auto_updates true
  depends_on :macos

  app "pacer.app"

  # Casks cannot declare a formula conflict, so refuse here: one owner of `pacer` (ADR 0021).
  preflight_steps do
    if_path_exists "opt/pacer", base: :homebrew_prefix do
      run "/bin/sh", args: ["-c", "echo 'The pacer CLI formula is installed. Run: brew uninstall pacer' >&2; exit 1"]
    end
  end

  uninstall quit: "dev.pacer.desktop"

  zap trash: [
    "~/Library/Caches/dev.pacer.desktop",
    "~/Library/Preferences/dev.pacer.desktop.plist",
    "~/Library/Saved Application State/dev.pacer.desktop.savedState",
    "~/Library/WebKit/dev.pacer.desktop",
  ]

  caveats <<~EOS
    pacer updates itself; `brew upgrade` leaves it alone unless you pass --greedy.
    While builds are self-signed, approve the first launch once in
    System Settings › Privacy & Security › Open Anyway (again after a brew reinstall).
    To remove the service, the pacer command and agent hooks, run `pacer uninstall --all`.
  EOS
end
