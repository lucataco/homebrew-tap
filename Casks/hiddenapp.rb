cask "hiddenapp" do
  version "1.0.0"
  sha256 "fdf450cbef3ea399de4db51baef835f5dee619e38618acb2f29e1b3c899c29b1"

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
