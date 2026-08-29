class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://github.com/yzm1/boundver"
  url "https://github.com/yzm1/boundver/releases/download/v0.14.1/boundver-0.14.1.pyz"
  sha256 "df19427ab072b1b9a483740ddcc2b477986b2e89fca7c596536932d0522ddd55"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    bin.mkpath
    system python, "-m", "zipapp", "boundver-0.14.1.pyz",
           "--output", bin/"boundver", "--python", python
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/boundver --version")
  end
end
