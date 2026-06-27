class Timecat < Formula
  desc "Large 7-segment digital clock for modern terminals"
  homepage "https://github.com/hoonkim/timecat"
  url "https://github.com/hoonkim/timecat/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "eff05691ac93622e90ada28b6662c4b85ef8822d06323202fc37ad55e223f56a"
  head "https://github.com/hoonkim/timecat.git", branch: "develop"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "timecat 0.1.3", shell_output("#{bin}/timecat --version")
  end
end
