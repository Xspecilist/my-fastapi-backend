FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libxml2 \
    libxslt1.1 \
    libxslt1-dev \
    libjpeg-dev \
    zlib1g-dev \
    libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
