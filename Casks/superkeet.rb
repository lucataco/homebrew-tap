cask "superkeet" do
  version "1.0.6"
  sha256 "799634bedbe8bc55dff6086f80d2ebb70bf352760f8395db59a44bc4d4b018c3"

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
