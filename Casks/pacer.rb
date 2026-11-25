cask "pacer" do
  version "0.18.4"

  on_arm do
    sha256 "b76ddcbbc77d2529c3abc5fe03a9bb4f53150f0c8e6078a3c52e358af747e639"

    url "https://github.com/lamtuanvu/pacer/releases/download/v#{version}/desktop-pacer-#{version}-darwin-aarch64.dmg"
  end
  on_intel do
    sha256 "2e451f6e3acf6402f0e1fc4ac4f5349aac73d9499b169da10f8b6046e1e61332"

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
