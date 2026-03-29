# Homebrew Tap

Homebrew tap for lucataco's macOS tools.

## Setup

```bash
brew tap lucataco/tap
```

## Available Formulas

| Formula | Description | Version |
|---------|-------------|---------|
| `kokoro-cli` | Fast local text-to-speech CLI using Kokoro-82M on Apple Silicon via MLX | 0.1.0 |

### Install kokoro-cli

```bash
brew install lucataco/tap/kokoro-cli
```

Requires Apple Silicon (M1+). On first run, the TTS model (~170MB) is downloaded automatically.

```bash
# Quick start
kokoro --text "Hello world"
echo "Hello world" | kokoro
kokoro --list-voices

# Daemon mode (near-instant responses)
kokoro serve --daemon
kokoro --text "Fast speech"
kokoro stop
```

## Available Casks

| Cask | Description | Version |
|------|-------------|---------|
| `hiddenapp` | macOS menu bar utility that hides other apps' status bar icons | 1.0.0 |

### Install hiddenapp

```bash
brew install --cask lucataco/tap/hiddenapp
```

## Uninstall

```bash
brew uninstall kokoro-cli
brew uninstall --cask hiddenapp
```
