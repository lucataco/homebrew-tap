cask "hiddenapp" do
  version "1.2.0"
  sha256 "f3b1782ec86afca9db4d8a75ac48ab0a405384e6a7a1cdc514b7c3bd80e8ea6a"

  url "https://github.com/lucataco/hiddenApp/releases/download/v#{version}/HiddenApp-#{version}.zip"
  name "HiddenApp"
  desc "Menu bar utility that hides other apps' status bar icons"
  homepage "https://github.com/lucataco/hiddenApp"

  depends_on macos: :sequoia
  auto_updates true

  app "hiddenapp.app"

  uninstall quit: "com.catacolabs.hiddenapp"

  zap trash: "~/Library/Preferences/com.catacolabs.hiddenapp.plist"

  livecheck do
    url :url
    strategy :github_releases
  end
end
