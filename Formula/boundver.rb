class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://github.com/yzm1/boundver"
  url "https://github.com/yzm1/boundver/releases/download/v0.15.2/boundver-0.15.2.pyz"
  sha256 "63dcd9b68883b4907edbb867be326e8009cf5ced1a242a2f04c0f4619bb293c7"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    bin.mkpath
    system python, "-m", "zipapp", "boundver-0.15.2.pyz",
           "--output", bin/"boundver", "--python", python
  end

  test do
    assert_match "0.15.2", shell_output("#{bin}/boundver --version")
  end
end
