cask "pomodoro" do
  version "1.2.1"
  sha256 "11811d12656f661153aa2c10cecefb7dd32b6130124fe3138db93eeed9562fbc"

  url "https://github.com/rescenedev/pomodoro/releases/download/v#{version}/Pomodoro.dmg"
  name "Pomodoro"
  desc "Minimal native macOS menu-bar Pomodoro timer"
  homepage "https://github.com/rescenedev/pomodoro"

  depends_on macos: :sonoma

  app "Pomodoro.app"

  zap trash: [
    "~/Library/Preferences/com.playground.pomodoro.plist",
  ]
end
