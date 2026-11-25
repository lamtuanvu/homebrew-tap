cask "pacer" do
  version "0.18.3"

  on_arm do
    sha256 "bcd53185f303882bb50bffaf82068b2c8646c9289da15757b87d0dfa3eb8972f"

    url "https://github.com/lamtuanvu/pacer/releases/download/v#{version}/desktop-pacer-#{version}-darwin-aarch64.dmg"
  end
  on_intel do
    sha256 "03e765249cc628d974a721e4d7833de18c418dc2d20b0769ea5c5cf783b95716"

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
