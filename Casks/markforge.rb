cask "markforge" do
  version "0.1.17"
  sha256 "68334863967f719ff557cbb073fcd5664f462b408f0b4e50b578c616942e0297"

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
