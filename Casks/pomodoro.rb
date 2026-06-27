cask "pomodoro" do
  version "1.2.2"
  sha256 "0c2cb7523133d0c1b926a56e74140b7aac900a70f506df561b17602322522225"

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
