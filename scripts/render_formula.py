#!/usr/bin/env python3
"""Render the tap formula from one immutable boundver release identity."""

from __future__ import annotations

import argparse
import os
import re
import tempfile
from pathlib import Path

VERSION_RE = re.compile(r"[0-9]+\.[0-9]+\.[0-9]+")
SHA256_RE = re.compile(r"[0-9a-f]{64}")


def render(version: str, digest: str) -> str:
    if VERSION_RE.fullmatch(version) is None:
        raise ValueError("version must be exact MAJOR.MINOR.PATCH")
    if SHA256_RE.fullmatch(digest) is None:
        raise ValueError("digest must be lowercase SHA-256")
    return f'''class Boundver < Formula
  desc "Classify contract drift and downstream impact across polyglot repositories"
  homepage "https://github.com/yzm1/boundver"
  url "https://github.com/yzm1/boundver/releases/download/v{version}/boundver-{version}.pyz"
  sha256 "{digest}"
  license "MIT"

  depends_on "python@3.14"

  def install
    libexec.install "boundver-{version}.pyz" => "boundver.pyz"
    (bin/"boundver").write <<~SH
      #!/bin/bash
      exec "#{{formula_opt_bin("python@3.14")}}/python3.14" "#{{libexec}}/boundver.pyz" "$@"
    SH
    chmod 0755, bin/"boundver"
  end

  test do
    assert_match "boundver {version}", shell_output("#{{bin}}/boundver --version")
  end
end
'''


def atomic_write(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8", newline="\n") as stream:
            stream.write(content)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    except BaseException:
        temporary.unlink(missing_ok=True)
        raise


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", required=True)
    parser.add_argument("--sha256", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    try:
        atomic_write(args.output.resolve(), render(args.version, args.sha256))
    except (OSError, ValueError) as error:
        parser.error(str(error))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
