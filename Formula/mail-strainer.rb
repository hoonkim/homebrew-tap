class MailStrainer < Formula
  desc "Gmail spam classifier using gws and OpenRouter, with a local SQLite web UI"
  homepage "https://github.com/hoonkim/mail-strainer"
  url "https://github.com/hoonkim/mail-strainer/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "79325dcce4fecbd301b6d105c6e00300cb3a30e76f6f917cb95fc0afec79f11e"
  license :cannot_represent

  depends_on "python@3.14"

  def install
    libexec.install "strainer.py", "ui.html"
    (bin/"mail-strainer").write <<~SH
      #!/bin/bash
      exec "#{Formula["python@3.14"].opt_bin}/python3.14" "#{libexec}/strainer.py" "$@"
    SH
  end

  def caveats
    <<~EOS
      mail-strainer needs the gws CLI with Gmail access:
        npm install -g @googleworkspace/cli && gws auth login
      Then save your OpenRouter API key:
        mail-strainer setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mail-strainer --version")
  end
end
