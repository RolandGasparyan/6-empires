#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readme_path="${repo_root}/README.md"

if [[ ! -f "${readme_path}" ]]; then
  echo "README.md is missing."
  exit 1
fi

if [[ ! -s "${readme_path}" ]]; then
  echo "README.md is empty."
  exit 1
fi

if ! grep -Eq '^# 6 Empires$' "${readme_path}"; then
  echo "README.md must include the main project heading."
  exit 1
fi

if ! grep -Eq '^## Verification$' "${readme_path}"; then
  echo "README.md must document verification."
  exit 1
fi

echo "Repository verification passed."
