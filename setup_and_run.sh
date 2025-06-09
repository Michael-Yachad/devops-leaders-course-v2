#!/bin/bash

set -e  # עצור מייד אם יש שגיאה

echo "🚀 Starting setup..."

# Create virtual environment if not exists
if [ ! -d "venv" ]; then
  echo "📦 Creating virtual environment..."
  python3 -m venv venv
fi

# Activate virtual environment
echo "📲 Activating virtual environment..."
source venv/bin/activate

# Upgrade pip and install dependencies
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

echo "📥 Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# Optional: install tools used in run_checks
pip install pytest flake8 black bandit detect-secrets

# Run the application (adjust as needed)
echo "🏃 Running the application..."
python main.py

echo "✅ Application executed successfully."
