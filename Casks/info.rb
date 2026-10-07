cask "info" do
  version "0.5.2"
  sha256 "04fe37f721e63831cc14137ff7a820f068e3ef2fd21b07f61eba7f7b993ddab4"

  url "https://github.com/lucataco/Info/releases/download/v#{version}/Info-#{version}.zip"
  name "Info"
  desc "Menu bar system monitor for CPU, GPU, memory, and network"
  homepage "https://github.com/lucataco/Info"

  depends_on macos: :tahoe

  app "Info.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Info.app"]
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
