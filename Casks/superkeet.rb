cask "superkeet" do
  version "1.9.3"
  sha256 "534a2d6f65dca997682a3824a338b8c601ac21c6890c6b377bb48ba74a83af74"

  url "https://github.com/lucataco/superkeet/releases/download/v#{version}/Superkeet-#{version}.zip"
  name "Superkeet"
  desc "Local voice-to-text menu bar app powered by Parakeet"
  homepage "https://github.com/lucataco/superkeet"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Superkeet.app"

  uninstall quit:   "com.superkeet.app",
            script: {
              # The bundled speech engine can outlive the app after a crash or force quit.
              executable:   "/usr/bin/pkill",
              args:         ["-f", "Superkeet.app/Contents/Resources/bin/parakeet"],
              must_succeed: false,
            }

  # The speech model lives in the parakeet-cli default folder. Only Superkeet's model
  # directory is removed; other parakeet-cli data is left alone.
  zap trash: [
        "~/Library/Application Support/parakeet/models/parakeet-tdt-0.6b-v3",
        "~/Library/Application Support/Superkeet",
        "~/Library/Caches/com.superkeet.app",
        "~/Library/HTTPStorages/com.superkeet.app",
        "~/Library/Preferences/com.superkeet.app.plist",
        "~/Library/Saved Application State/com.superkeet.app.savedState",
      ],
      # Removed only if nothing else (such as the parakeet-cli formula) left files there.
      rmdir: "~/Library/Application Support/parakeet"

  caveats <<~EOS
    Superkeet runs speech recognition locally on your Mac.

    On first launch, macOS may ask for Microphone access. Accessibility access is
    required for global shortcuts and automatic paste.

    MCP server secrets are stored in your login Keychain under
    "com.superkeet.app.mcp"; `brew uninstall --zap` does not remove them.
  EOS
end
