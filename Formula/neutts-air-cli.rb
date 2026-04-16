class NeuttsAirCli < Formula
  desc "Local Apple Silicon text-to-speech CLI for Neuphonic NeuTTS Nano"
  homepage "https://github.com/lucataco/neutts-air-cli"
  url "https://github.com/lucataco/neutts-air-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "REPLACE_WITH_V0_1_1_TARBALL_SHA256"
  license "Apache-2.0"

  depends_on "python@3.12"
  depends_on "espeak-ng"
  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "cargo", "build", "--release", "--locked", "--bin", "neutts"
    pkgshare.install "python"
    libexec.install "target/release/neutts"
    (bin/"neutts").write_env_script libexec/"neutts", NEUTTS_PYTHON_DIR: pkgshare/"python"
  end

  def caveats
    <<~EOS
      neutts requires Apple Silicon (M1 or later) and macOS.

      Before first synthesis:
        export NEUTTS_SYSTEM_PYTHON="#{Formula["python@3.12"].opt_bin}/python3.12"
        neutts download

      This downloads the default model, codec, preset voices, and managed
      Python runtime into your user Library directories.

      Quick start:
        neutts download
        neutts serve
        neutts speak --text "Hello world"

      For startup debugging:
        neutts serve --foreground
        neutts doctor
    EOS
  end

  test do
    assert_match "Usage: neutts", shell_output("#{bin}/neutts --help")
    assert_match "python runtime present:", shell_output("#{bin}/neutts doctor")
  end
end
