cask "hiddenapp" do
  version "1.0.0"
  sha256 "9335a6e9c879446c89b0deb945154f90ee0edb1431525d20274fdb0679315c66"

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
