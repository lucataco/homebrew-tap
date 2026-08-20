cask "superkeet" do
  version "1.5.1"
  sha256 "31e3cefbc2bb8501de84164193b503f9fa8800e30538bf4bc6007d7c48a5f6d5"

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
