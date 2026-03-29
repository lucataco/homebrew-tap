cask "superkeet" do
  version "1.0.5"
  sha256 "cedd9a18583d6a23d8b1817b7ebd6669913389e2fdb10a9958f190f24f36e516"

  url "https://github.com/lucataco/superkeet/releases/download/v#{version}/Superkeet-#{version}.zip"
  name "Superkeet"
  desc "Local macOS voice-to-text menu bar app powered by Parakeet"
  homepage "https://github.com/lucataco/superkeet"

  depends_on macos: ">= :sonoma"

  app "Superkeet.app"

  zap trash: [
    "~/Library/Application Support/Superkeet",
    "~/Library/Caches/com.superkeet.app",
    "~/Library/Preferences/com.superkeet.app.plist",
  ]
end
