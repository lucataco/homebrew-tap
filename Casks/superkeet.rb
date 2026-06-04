cask "superkeet" do
  version "1.2.0"
  sha256 "fc118d3258e3eff5c260603738da901eaad786d0169069cb732c24ffbdc145fb"

  url "https://github.com/lucataco/superkeet/releases/download/v#{version}/Superkeet-#{version}.zip"
  name "Superkeet"
  desc "Local voice-to-text menu bar app powered by Parakeet"
  homepage "https://github.com/lucataco/superkeet"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Superkeet.app"

  uninstall quit: "com.superkeet.app"

  caveats <<~EOS
    Superkeet runs speech recognition locally on your Mac.

    On first launch, macOS may ask for Microphone access. Accessibility access is
    required for global shortcuts and automatic paste.
  EOS

  zap trash: [
    "~/Library/Application Support/Superkeet",
    "~/Library/Caches/com.superkeet.app",
    "~/Library/Preferences/com.superkeet.app.plist",
  ]
end
