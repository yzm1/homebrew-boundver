# Homebrew tap for boundver

Install [boundver](https://yzm1.github.io/boundver/) from its immutable GitHub
Release archive:

```bash
brew install yzm1/boundver/boundver
boundver --version
```

Each formula pins the SHA-256 of the release's self-contained `.pyz` asset.
The update workflow accepts only a stable, immutable exact SemVer release,
checks its published `SHA256SUMS`, and runs `brew audit`, install, and test on
macOS before opening a maintainer-reviewed pull request.

The software and tap metadata are MIT licensed. Support and security reports
belong in the [boundver repository](https://github.com/yzm1/boundver).
