cask "superkeet" do
  version "1.1.0"
  sha256 "a74e5d3282574d28b0b3dd305b1344dbd2c457230873f0e1303cb92fd88b3862"

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
