class Timecat < Formula
  desc "Large 7-segment digital clock for modern terminals"
  homepage "https://github.com/hoonkim/timecat"
  url "https://github.com/hoonkim/timecat/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "0ee3c1cf6f11deafd02dc9377a01c54e4888b71b90190161f15b0ecb475ffa37"
  head "https://github.com/hoonkim/timecat.git", branch: "develop"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "timecat 0.1.2", shell_output("#{bin}/timecat --version")
  end
end
