cask "markforge" do
  version "0.1.13"
  sha256 "31a3ee69b175c1f8bae4fa6e56d09d8e6c92dac81cff106a98ba11ec1d9f1acf"

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
