cask "termina" do
  version "1.0.0"
  sha256 "649270a40ba3c9e0d0e56498f7882e6aed98b7db0414dbf684a6e85be23f0738"

  url "https://github.com/rescenedev/termina/releases/download/v#{version}/Termina-#{version}.zip"
  name "Termina"
  desc "Native macOS SSH & SFTP manager powered by libghostty"
  homepage "https://github.com/rescenedev/termina"

  depends_on macos: ">= :sequoia"

  app "Termina.app"

  caveats <<~EOS
    Termina is ad-hoc signed (not notarized), so Gatekeeper may block first launch.
    If macOS says the app is damaged or can't be opened, clear the quarantine flag:

      xattr -dr com.apple.quarantine "#{appdir}/Termina.app"

    or right-click the app in Finder and choose Open.
  EOS

  zap trash: [
    "~/Library/Application Support/Termina",
    "~/Library/Preferences/com.zihado.termina.plist",
  ]
end
