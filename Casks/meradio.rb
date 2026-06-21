cask "meradio" do
  version "1.0.0"
  sha256 "2c0001c376e1ee459a7732706cde47b52483bd5f0a273278f6136a4d2c5c268d"

  url "https://github.com/rescenedev/meradio/releases/download/v#{version}/meradio.dmg"
  name "meradio"
  desc "Korean radio stations in your macOS menu bar"
  homepage "https://github.com/rescenedev/meradio"

  depends_on macos: :sonoma

  app "meradio.app"

  zap trash: [
    "~/Library/Preferences/com.playground.meradio.plist",
  ]
end
