cask "markforge" do
  version "0.1.5"
  sha256 "ece1607f8f0d6d50dd8efac21bce1aaf3cb08f463e9f55d451faa49716c6bdac"

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
