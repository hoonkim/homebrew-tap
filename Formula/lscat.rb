class Lscat < Formula
  desc "Rust terminal file explorer designed for kitty"
  homepage "https://github.com/hoonkim/lscat"
  url "https://github.com/hoonkim/lscat/releases/download/v0.1.0/lscat-0.1.0.tar.gz"
  sha256 "266e1d15655b37f54ddbd031a64e4b182beeb8d04834f698ffaadd67f35ad991"
  license :cannot_represent

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    zsh_function.install "shell/lscat.zsh"
  end

  test do
    assert_match "lscat - terminal file explorer", shell_output("#{bin}/lscat --help")
  end
end
