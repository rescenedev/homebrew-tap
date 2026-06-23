cask "pomodoro" do
  version "1.1.0"
  sha256 "675b51e0fe2194c93edbd9159e44e3800a6e189ec4f2822230b0b55321611261"

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
