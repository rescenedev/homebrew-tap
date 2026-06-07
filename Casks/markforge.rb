cask "markforge" do
  version "0.1.3"
  sha256 "1aa08743cdb0d771856729dbdc6f47ee22dadad3c3b1e43d2a9f4a6e9d60016a"

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
