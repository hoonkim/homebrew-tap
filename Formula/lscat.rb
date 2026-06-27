class Lscat < Formula
  desc "Rust terminal file explorer designed for kitty"
  homepage "https://github.com/hoonkim/lscat"
  url "https://github.com/hoonkim/lscat/releases/download/v0.1.1/lscat-0.1.1.tar.gz"
  sha256 "5918ca7fd5a78b199176a61b6eca4e10c51ce2b27067bd13bd35e0621bfc0571"
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
