#!/bin/bash
set -e +x

# Check if there are any changes in the watched folder
if git diff --cached --name-only | grep -q "^challenges/"; then
  just install
  just ruff-fix
fi
