cask "info" do
  version "0.4.1"
  sha256 "4f468bd0cfc851974ee8bd588ae9515d3d7c849abcd2179318818fd82a20a157"

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
