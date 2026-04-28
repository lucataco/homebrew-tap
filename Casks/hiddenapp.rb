cask "hiddenapp" do
  version "1.0.2"
  sha256 "9b0538894505358fa4a6b54f3bc221585a84675f32eae9af5455c0bd7b003901"

  url "https://github.com/lucataco/hiddenApp/releases/download/v#{version}/HiddenApp-#{version}.zip"
  name "HiddenApp"
  desc "Menu bar utility that hides other apps' status bar icons"
  homepage "https://github.com/lucataco/hiddenApp"

  depends_on macos: ">= :tahoe"

  app "hiddenapp.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/hiddenapp.app"]
  end

  zap trash: "~/Library/Preferences/com.catacolabs.hiddenapp.plist"
end
