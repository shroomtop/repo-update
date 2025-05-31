#!/usr/bin/env bash
# repo-update bootstrapper — writes missing files and zips repo
set -euo pipefail
echo "[+] Generating assets…"

cat > README.md <<'EOF'
# repo‑update
Automated bulk‑maintenance toolkit for GitHub repositories
▶ **Live demo:** <https://shroomtop.github.io/repo-update/>
...
EOF

cat > .gitignore <<'EOF'
# Primary output
dist/
build/
...
EOF

mkdir -p .github/workflows
cat > .github/workflows/html-ci.yml <<'EOF'
name: HTML Lint & Build
on:
  push:
    branches: [main]
  pull_request:
jobs:
  html-lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install tidy‑html5
        run: sudo apt-get update && sudo apt-get install -y tidy
      - name: Lint HTML
        run: tidy -qe **/*.html
EOF

zip_name="repo-update-$(date +%Y%m%d).zip"
echo "[+] Packing $zip_name…"
zip -rq "$zip_name" . -x "*.git*" && echo "[✓] Archive ready: $PWD/$zip_name"
