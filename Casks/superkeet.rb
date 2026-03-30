cask "superkeet" do
  version "1.0.8"
  sha256 "07fb94ed8d5449d7e10318cf3f5a3a592a9d307e01797fae1249b555654ecc12"

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
