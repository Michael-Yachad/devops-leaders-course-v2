# Dockerfile

FROM python:3.10-slim

# Environment config
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies for building wheels (e.g. uvicorn[standard])
RUN apt-get update && apt-get install -y gcc build-essential libffi-dev

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy source code
COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
