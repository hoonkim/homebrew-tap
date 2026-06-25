class Webcat < Formula
  desc "Modal terminal web browser — headless Chrome rendered in Kitty"
  homepage "https://github.com/hoonkim/webcat"
  url "https://github.com/hoonkim/webcat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8d550347dd02487c5f543c775c51118619dd0bba171d0b5f0f85622a354f0f34"
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
