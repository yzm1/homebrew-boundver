class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://github.com/yzm1/boundver"
  url "https://github.com/yzm1/boundver/releases/download/v0.14.0/boundver-0.14.0.pyz"
  sha256 "80d343bb48689353d7b04e0c3826a22acc4162216cfe09c8c6e8f67cfc61e485"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    bin.mkpath
    system python, "-m", "zipapp", "boundver-0.14.0.pyz",
           "--output", bin/"boundver", "--python", python
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/boundver --version")
  end
end
