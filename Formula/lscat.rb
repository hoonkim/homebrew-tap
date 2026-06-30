class Lscat < Formula
  desc "Rust terminal file explorer designed for kitty"
  homepage "https://github.com/hoonkim/lscat"
  url "https://github.com/hoonkim/lscat/releases/download/v0.3.0/lscat-0.3.0.tar.gz"
  sha256 "923e5c766847448a5d27739c172fa60bd6d8f7ede585f337d964ae073e01cfd9"
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
