class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://github.com/yzm1/boundver"
  url "https://github.com/yzm1/boundver/releases/download/v0.13.0/boundver-0.13.0.pyz"
  sha256 "14b446f137431ab9c31b72ef49fcfbeb70b95e4a7e6f4b7be30bb149ae153e77"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    bin.mkpath
    system python, "-m", "zipapp", "boundver-0.13.0.pyz",
           "--output", bin/"boundver", "--python", python
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/boundver --version")
  end
end
