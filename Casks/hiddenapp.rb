cask "hiddenapp" do
  version "1.1.1"
  sha256 "b6dce5af410abe7b7baf02423c92c18f46ce1653737bb1d850ce915d93f5f341"

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
