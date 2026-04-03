cask "superkeet" do
  version "1.0.9"
  sha256 "6d61aaafae669e0d9158722c11d9a0babc3f6701248511f1f4a8d7d4207beed2"

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
