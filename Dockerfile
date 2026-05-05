FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    imagemagick \
    fonts-dejavu \
    && rm -rf /var/lib/apt/lists/*

# السماح لـ ImageMagick بالتعامل مع الملفات
RUN sed -i 's/rights="none" pattern="PDF"/rights="read|write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml || true

WORKDIR /app
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["python", "main.py"]
