# lucataco's Homebrew Tap

Homebrew tap for lucataco's CLI tools and macOS apps.

## Install

```bash
brew tap lucataco/tap
```

## Install Packages

```bash
# formula
brew install lucataco/tap/<name>

# cask
brew install --cask lucataco/tap/<name>
```

## Packages

### Formulae

- `kokoro-cli` - Fast local text-to-speech CLI using Kokoro-82M on Apple Silicon via MLX
- `parakeet-cli` - Local speech-to-text CLI powered by NVIDIA Parakeet TDT via ONNX Runtime

### Casks

- `hiddenapp` - macOS menu bar utility that hides other apps' status bar icons
- `superkeet` - Local macOS voice-to-text menu bar app powered by Parakeet

## Update / Uninstall

```bash
brew update
brew upgrade

brew uninstall <formula>
brew uninstall --cask <cask>

# casks only: remove user data
brew uninstall --cask --zap lucataco/tap/superkeet
```

## Notes

- Run `brew info lucataco/tap/<name>` for per-tool caveats, permissions, and setup steps.
- Some tools require a one-time model download during setup or fetch assets on first use.
- `superkeet` may request microphone and Accessibility permissions.

## Manual Cleanup (formulae)

Homebrew formulae do not support `--zap`. Delete these to fully reset local data:

- `kokoro-cli`: `~/Library/Application Support/kokoro/` and related caches
- `parakeet-cli`: `~/Library/Application Support/parakeet/` and related caches
