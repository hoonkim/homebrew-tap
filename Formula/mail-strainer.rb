class MailStrainer < Formula
  desc "Gmail spam classifier using gws and TypeSafe Jev, with a local SQLite web UI"
  homepage "https://github.com/hoonkim/mail-strainer"
  url "https://github.com/hoonkim/mail-strainer/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "24d54e1ed57f6d1b8a9c0bdf535926470fe593908894eb1575f2b81609f13055"
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
