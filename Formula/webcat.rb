class Webcat < Formula
  desc "Modal terminal web browser — headless Chrome rendered in Kitty"
  homepage "https://github.com/hoonkim/webcat"
  url "https://github.com/hoonkim/webcat/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "66d1a9b9cb4eb07e522f69c5893d623ad283beeca3513813e409cdbd547edbf0"
  head "https://github.com/hoonkim/webcat.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      webcat requires the Kitty terminal and Google Chrome/Chromium at runtime:
        brew install --cask kitty
        brew install --cask google-chrome
    EOS
  end

  test do
    assert_match "webcat", shell_output("#{bin}/webcat --help")
  end
end
