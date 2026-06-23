cask "pomodoro" do
  version "1.1.0"
  sha256 "83a4c0a52d742fc369b26710781b1737f769dc75620eb095c98c2b8cf187711d"

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
