class ParakeetCli < Formula
  desc "Local speech-to-text CLI powered by NVIDIA Parakeet TDT via ONNX Runtime"
  homepage "https://github.com/lucataco/parakeet-cli"
  url "https://github.com/lucataco/parakeet-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7c7e8ddc786672d8ac2a793f1e586c47f4f30c527f4f2dbbed4937e4655b8632"
  license "Apache-2.0"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "."), "--bin", "parakeet"
  end

  def caveats
    <<~EOS
      parakeet requires Apple Silicon (M1 or later) and macOS.

      Run once before transcribing:
        parakeet download

      This downloads the Parakeet TDT 0.6B v3 model to:
        ~/Library/Application Support/parakeet/models/

      The Silero VAD model is downloaded automatically on first:
        parakeet listen
        parakeet serve

      Quick start:
        parakeet download
        parakeet devices
        parakeet listen

      Daemon mode:
        parakeet serve
        echo "toggle" | nc -U "$HOME/Library/Application Support/parakeet/run/daemon.sock"
    EOS
  end

  test do
    assert_match "Usage: parakeet", shell_output("#{bin}/parakeet --help")
    assert_match "parakeet-tdt-0.6b-v3", shell_output("#{bin}/parakeet download --help")
  end
end
