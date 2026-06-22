class Mdcat < Formula
  desc "Terminal Markdown viewer for kitty (OSC 66 text sizing + graphics protocol)"
  homepage "https://github.com/hoonkim/mdcat"
  url "https://github.com/hoonkim/mdcat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "923467f9ce6db3d7db4646e41097dc067086c98d3cce3b224d7e6d22dab37bb9"
  license "MIT"
  head "https://github.com/hoonkim/mdcat.git", branch: "develop"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    # With no arguments mdcat prints usage to stderr and exits 2.
    assert_match "usage", shell_output("#{bin}/mdcat 2>&1", 2)
  end
end
