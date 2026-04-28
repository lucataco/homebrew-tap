cask "hiddenapp" do
  version "1.0.1"
  sha256 "819b801da4b18a38545b10b3dd269222a222e40a78bc27802876867752b15ead"

  url "https://github.com/lucataco/hiddenApp/releases/download/v#{version}/HiddenApp-#{version}.zip"
  name "HiddenApp"
  desc "macOS menu bar utility that hides other apps' status bar icons"
  homepage "https://github.com/lucataco/hiddenApp"

  depends_on macos: ">= :tahoe"

  app "hiddenapp.app"

  zap trash: [
    "~/Library/Preferences/com.catacolabs.hiddenapp.plist",
  ]
end
