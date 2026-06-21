cask "info" do
  version "0.4.5"
  sha256 "fb3e852db29a6b8c9856b5f458538ec2b22e7602b34d0a844fdef1d2168d0d83"

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
