FROM postgres:latest

# Set env variables
ENV  POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=password1234 \
    POSTGRES_DB=mydb

# Run Update
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy Script
COPY init-db.sh /docker-entrypoint-initdb.d/

# Copy Data
COPY Downloads/complaints.csv /data/complaints.csv