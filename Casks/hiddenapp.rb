cask "hiddenapp" do
  version "1.0.3"
  sha256 "42b5d6d2b5ce7acd7aed863596bdb2fbb379660e8f714d1cde4d22bf6b114ac0"

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
