class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://github.com/yzm1/boundver"
  url "https://github.com/yzm1/boundver/releases/download/v0.15.0/boundver-0.15.0.pyz"
  sha256 "9e10a4ed592fd55e910a475da1c0c0c91a401cf176299b5e7440d246928ade63"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    bin.mkpath
    system python, "-m", "zipapp", "boundver-0.15.0.pyz",
           "--output", bin/"boundver", "--python", python
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/boundver --version")
  end
end
