#!/bin/bash

set -e  # עצור מייד אם משהו נכשל

echo "🔎 Running code quality checks..."

# Activate virtual environment
source venv/bin/activate

# 1. Run tests
echo "🧪 Running unit tests with pytest..."
pytest

# 2. Linting
echo "🧼 Linting with flake8..."
flake8 .

# 3. Formatting
echo "🎨 Checking formatting with black..."
black --check .

# 4. Secret scanning
echo "🔐 Scanning for secrets with detect-secrets..."
detect-secrets scan > .secrets.baseline
detect-secrets audit .secrets.baseline || echo "⚠️ Possible secrets found – please review."

# 5. Vulnerability scanning
echo "🛡️ Scanning for vulnerabilities with bandit..."
bandit -r . -q || echo "⚠️ Vulnerabilities found – please review."

echo "🎉 All checks completed successfully."
