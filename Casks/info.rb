cask "info" do
  version "0.2.0"
  sha256 "e79b6019103ed4daf362ce8a74f6db8a1591aad31de50758282bdcf45c57e161"

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

  caveats <<~EOS
    Info is a menu-bar-only app. After install, launch it from Applications or run:

      open -a Info

    It will appear in the macOS menu bar, not the Dock.
  EOS
end
