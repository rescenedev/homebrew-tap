class Ev < Formula
  desc "Everything-style terminal file search with office-document extraction"
  homepage "https://github.com/rescenedev/ev"
  url "https://github.com/rescenedev/ev/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "e72bda37631523a7853eb5c498850ee6f27b134d250fdf1d39935f4470b20712"
  license "MIT"
  head "https://github.com/rescenedev/ev.git", branch: "main"

  depends_on "fd"
  depends_on "fzf"
  depends_on "ripgrep"

  # Optional but enhance functionality:
  #   bat     — syntax-highlighted preview pane
  #   poppler — pdftotext, enables PDF content search/extraction
  #   chafa   — inline image (Ctrl-V) visual preview on kitty-graphics terminals
  depends_on "bat" => :recommended
  depends_on "chafa" => :recommended
  depends_on "poppler" => :recommended

  def install
    # Keep the script's layout intact: ev resolves its helpers relative to
    # itself via ${0:A:h}, and ev-extract via ${0:A:h:h}. Install the whole
    # tree under libexec and symlink the entry point — :A follows the symlink
    # back to the real location, so sourcing still resolves correctly.
    libexec.install "ev", "lib", "libexec"
    bin.install_symlink libexec/"ev"
  end

  def caveats
    <<~EOS
      ev auto-installs missing required tools via Homebrew on first interactive
      run; with this formula rg/fzf/fd are already present, so set
      EV_AUTO_INSTALL=0 to opt out of that behavior entirely.

      Optional dependencies (install for full functionality):
        brew install bat                          # syntax-highlighted preview
        brew install poppler                      # PDF content search (pdftotext)
        brew install chafa                        # Ctrl-V inline image preview
        brew install --cask postmelee/tap/alhangeul   # hwpx visual preview (QuickLook)

      Visual preview (Ctrl-V) renders documents inline as images on
      kitty-graphics terminals (Ghostty / kitty / WezTerm); it falls back to
      text everywhere else.
    EOS
  end

  test do
    # Non-interactive paths don't need a TTY. Plain-text extraction just
    # echoes the file, so it exercises the dispatcher + sourced helpers.
    (testpath/"hello.txt").write("liquidity report\n")
    assert_match "liquidity report", shell_output("#{bin}/ev -x #{testpath}/hello.txt")

    # File listing via fd should find the file we just created.
    assert_match "hello.txt", shell_output("#{bin}/ev -l #{testpath}")

    # Content search via rg should match a term inside the file.
    assert_match "liquidity", shell_output("#{bin}/ev -g liquidity #{testpath}")
  end
end
