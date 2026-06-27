class Lscat < Formula
  desc "Rust terminal file explorer designed for kitty"
  homepage "https://github.com/hoonkim/lscat"
  url "https://github.com/hoonkim/lscat/releases/download/v0.2.0/lscat-0.2.0.tar.gz"
  sha256 "89ae24047ee0629b2b24074d9e47b38dd3ed7e18913fdae1fecbb5579622f0b6"
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
