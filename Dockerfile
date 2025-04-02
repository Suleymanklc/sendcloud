# Use the official Python image from Docker Hub
FROM python:3.11-slim

# Install PostgreSQL development libraries for psycopg2
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*


# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the required Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django app code into the container
COPY ./app/. /app/

# Set environment variables for Django
ENV SECRET_KEY='your-secret-key'
ENV DEBUG='False'
ENV DATABASE_NAME='django_db'
ENV DATABASE_USER='django_user'
ENV DATABASE_PASSWORD='django_password'
ENV DATABASE_HOST='postgres-service'
ENV DATABASE_PORT='5432'

# Expose the port the app will run on
EXPOSE 8080

# Run
