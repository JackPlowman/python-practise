# ------------------------------------------------------------------------------
# General Commands
# ------------------------------------------------------------------------------

# Install python dependencies
install:
    uv sync

# Runs unit tests
test:
    uv run pytest challenges --cov=. --cov-report=xml

# ------------------------------------------------------------------------------
# Cleaning Commands
# ------------------------------------------------------------------------------

# Remove all generated files
clean:
    find . \( \
      -name '__pycache__' -o \
      -name '.coverage' -o \
      -name '.mypy_cache' -o \
      -name '.pytest_cache' -o \
      -name '.ruff_cache' -o \
      -name '*.pyc' -o \
      -name '*.pyd' -o \
      -name '*.pyo' -o \
      -name 'coverage.xml' -o \
      -name 'db.sqlite3' \
    \) -print | xargs rm -rfv

# ------------------------------------------------------------------------------
# Ruff - Python Linting and Formating
# Set up ruff red-knot when it's ready
# ------------------------------------------------------------------------------

# Fix all Ruff issues
ruff-fix:
    just ruff-format-fix
    just ruff-lint-fix

# Check for Ruff issues
ruff-lint:
    uv run ruff check .

# Fix Ruff lint issues
ruff-lint-fix:
    uv run ruff check . --fix

# Check for Ruff format issues
ruff-format:
    uv run ruff format --check .

# Fix Ruff format issues
ruff-format-fix:
    uv run ruff format .

# ------------------------------------------------------------------------------
# Prettier
# ------------------------------------------------------------------------------

# Check files are prettier formatted
prettier-check:
    prettier . --check

# Format files with prettier
prettier-format:
    prettier . --check --write

# ------------------------------------------------------------------------------
# Justfile
# ------------------------------------------------------------------------------

# Format the justfile
just-format:
    just --fmt --unstable

# Check if the justfile is formatted correctly
just-format-check:
    just --fmt --check --unstable

# ------------------------------------------------------------------------------
# Git Leaks
# ------------------------------------------------------------------------------

# Detect secrets in the repos
gitleaks-detect:
    gitleaks detect --source .

# ------------------------------------------------------------------------------
# Git Hooks
# ------------------------------------------------------------------------------

# Install pre commit hook to run on all commits
install-git-hooks:
    cp -f githooks/pre-commit .git/hooks/pre-commit
    cp -f githooks/post-commit .git/hooks/post-commit
    chmod ug+x .git/hooks/*
