class Webcat < Formula
  desc "Modal terminal web browser — headless Chrome rendered in Kitty"
  homepage "https://github.com/hoonkim/webcat"
  url "https://github.com/hoonkim/webcat/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "caa0ae6615803ee32b4dc838fbca09ac05823d1bf5ba2893cb2f91063aee50aa"
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
