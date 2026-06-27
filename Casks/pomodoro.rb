cask "pomodoro" do
  version "1.2.0"
  sha256 "a9e0368462476b1ff1d668e76e8755e6a1ad45cc8a5ffbce3ad3c379f174587e"

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
