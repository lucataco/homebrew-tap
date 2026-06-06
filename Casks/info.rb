cask "info" do
  version "0.1.0"
  sha256 "c357bc02acc54225c8bbcd1848a9d82f941eb1d8d7ea19f8ca7cd6d65d249784"

  url "https://github.com/lucataco/Info/releases/download/v#{version}/Info-#{version}.zip"
  name "Info"
  desc "Menu bar system monitor for CPU, GPU, memory, and network"
  homepage "https://github.com/lucataco/Info"

  depends_on macos: :tahoe

  app "Info.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Info.app"]
  end

  uninstall quit: "com.info.app"

  zap trash: [
    "~/Library/Caches/com.info.app",
    "~/Library/Preferences/com.info.app.plist",
  ]
end
