class Webcat < Formula
  desc "Modal terminal web browser — headless Chrome rendered in Kitty"
  homepage "https://github.com/hoonkim/webcat"
  url "https://github.com/hoonkim/webcat/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "df9d1dd111b349417e9b8345845fd046b8f73fba180143f580a9edd591b055fc"
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
