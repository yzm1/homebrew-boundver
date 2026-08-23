class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://yzm1.github.io/boundver/"
  url "https://github.com/yzm1/boundver/releases/download/v0.12.0/boundver-0.12.0.pyz"
  version "0.12.0"
  sha256 "be02083ff1133a07ad36571e4eb99bc1848fbc11608e234df59be712f442a301"
  license "MIT"

  depends_on "python@3.14"

  def install
    libexec.install "boundver-0.12.0.pyz" => "boundver.pyz"
    (bin/"boundver").write <<~SH
      #!/bin/bash
      exec "#{Formula["python@3.14"].opt_bin}/python3.14" "#{libexec}/boundver.pyz" "$@"
    SH
    chmod 0755, bin/"boundver"
  end

  test do
    assert_match "boundver 0.12.0", shell_output("#{bin}/boundver --version")
  end
end
