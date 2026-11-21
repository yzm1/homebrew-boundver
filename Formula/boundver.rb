class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://github.com/yzm1/boundver"
  url "https://github.com/yzm1/boundver/releases/download/v0.17.0/boundver-0.17.0.pyz"
  sha256 "fdc62fb273f6f39eaaec5367b718efc951b0ea13c9ab184e71fbd93b219b6c40"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    bin.mkpath
    system python, "-m", "zipapp", "boundver-0.17.0.pyz",
           "--output", bin/"boundver", "--python", python
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/boundver --version")
  end
end
