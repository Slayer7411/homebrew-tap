cask "minos-741" do
  version :latest
  sha256 :no_check

  url "https://github.com/Slayer7411/MINOS-741/releases/latest/download/MINOS-741.dmg"
  name "MINOS-741"
  desc "DJ app with a C++ realtime core, native hid controllers, nml collection"
  homepage "https://github.com/Slayer7411/MINOS-741"

  depends_on macos: ">= :sequoia"

  app "MINOS-741.app"

  # not signed by apple -> remove the download flag so it opens without the gatekeeper block
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MINOS-741.app"]
  end

  zap trash: [
    "~/Library/Application Support/MINOS-741",
    "~/Library/Preferences/com.github.slayer7411.minos741.plist",
  ]
end
