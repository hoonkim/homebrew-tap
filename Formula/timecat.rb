class Timecat < Formula
  desc "Large 7-segment digital clock for modern terminals"
  homepage "https://github.com/hoonkim/timecat"
  url "https://github.com/hoonkim/timecat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9bf73e2a637c0de5cc63b430d347b953b57c69fad6a3a69a26db8dd0ae342584"
  head "https://github.com/hoonkim/timecat.git", branch: "develop"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "timecat 0.1.0", shell_output("#{bin}/timecat --version")
  end
end
