class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://github.com/yzm1/boundver"
  url "https://github.com/yzm1/boundver/releases/download/v0.16.0/boundver-0.16.0.pyz"
  sha256 "d7d07997eaf90409b85cb97b41179daf11cce9cdde314464f4974cd86a99e474"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    bin.mkpath
    system python, "-m", "zipapp", "boundver-0.16.0.pyz",
           "--output", bin/"boundver", "--python", python
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/boundver --version")
  end
end
