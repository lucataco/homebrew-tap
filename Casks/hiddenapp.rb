cask "hiddenapp" do
  version "1.1.0"
  sha256 "b4ec8125e96aeba80d4d22890153295013e8e277dfcfaa2c7d2408a5e6728a1b"

  url "https://github.com/lucataco/hiddenApp/releases/download/v#{version}/HiddenApp-#{version}.zip"
  name "HiddenApp"
  desc "Menu bar utility that hides other apps' status bar icons"
  homepage "https://github.com/lucataco/hiddenApp"

  depends_on macos: :tahoe

  app "hiddenapp.app"

  uninstall quit: "com.catacolabs.hiddenapp"

  zap trash: "~/Library/Preferences/com.catacolabs.hiddenapp.plist"

  livecheck do
    url :url
    strategy :github_releases
  end
end
