class KokoroCli < Formula
  include Language::Python::Virtualenv

  desc "Fast local text-to-speech CLI using Kokoro-82M on Apple Silicon via MLX"
  homepage "https://github.com/lucataco/kokoro-cli"
  url "https://github.com/lucataco/kokoro-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "80a977cba1c6f14a78616fb27df7ca2ad154a7c2318777853c5b94ecc9435a95"
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
