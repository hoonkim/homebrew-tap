class Timecat < Formula
  desc "Large 7-segment digital clock for modern terminals"
  homepage "https://github.com/hoonkim/timecat"
  url "https://github.com/hoonkim/timecat/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6e70fec350be436a9d4e050d7f34e5fcf54e07390c4de8058c43165e53aff09b"
  head "https://github.com/hoonkim/timecat.git", branch: "develop"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "timecat 0.1.1", shell_output("#{bin}/timecat --version")
  end
end
