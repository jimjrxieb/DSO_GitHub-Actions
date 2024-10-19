FROM python:3.11-buster

# Set work directory
WORKDIR /app

# Dependencies for psycopg2
RUN apt-get update && apt-get install --no-install-recommends -y \
    dnsutils libpq-dev python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /app/

# Install pygoat
EXPOSE 8000
RUN python3 /app/manage.py migrate

# Set work directory
WORKDIR /app/pygoat

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "6", "pygoat.wsgi"]

