class KokoroCli < Formula
  include Language::Python::Virtualenv

  desc "Fast local text-to-speech CLI using Kokoro-82M on Apple Silicon via MLX"
  homepage "https://github.com/lucataco/kokoro-cli"
  url "https://github.com/lucataco/kokoro-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "auto-generated)	ed4df8ed0c309148ab756b8b9c67008eb091eed79c8344e228cd91440fefb05a"
  license "Apache-2.0"

  depends_on "python@3.12"
  depends_on "espeak-ng"
  depends_on arch: :arm64
  depends_on :macos

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      kokoro-cli requires Apple Silicon (M1 or later) for MLX GPU acceleration.

      On first run, the Kokoro-82M model (~170MB) will be downloaded from
      HuggingFace and cached locally at ~/.cache/huggingface/.

      Quick start:
        kokoro --text "Hello world"
        echo "Hello world" | kokoro
        kokoro --list-voices

      Daemon mode (faster subsequent calls):
        kokoro serve --daemon
        kokoro --text "Near-instant speech"
        kokoro stop
    EOS
  end

  test do
    assert_match "af_sky", shell_output("#{bin}/kokoro --list-voices")
  end
end
