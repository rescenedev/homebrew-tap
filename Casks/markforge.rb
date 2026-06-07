cask "markforge" do
  version "0.1.1"
  sha256 "869ba3ba664ac3c1d1764d328d0fa228f93556fca7bd331744881b00547f451a"

  url "https://github.com/rescenedev/markforge/releases/download/v#{version}/MarkForge.app.zip"
  name "MarkForge"
  desc "Native macOS Markdown viewer & editor built in Rust on GPUI"
  homepage "https://github.com/rescenedev/markforge"

  app "MarkForge.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MarkForge.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/MarkForge",
  ]
end
