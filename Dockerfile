# Stage 1: Build the application
FROM python:3.11-slim AS build

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Prepare the runtime image
FROM python:3.11-slim AS runtime

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV SECRET_KEY=your-secret-key
ENV DEBUG=False
ENV DATABASE_NAME=your-db-name
ENV DATABASE_USER=your-db-user
ENV DATABASE_PASSWORD=your-db-password
ENV DATABASE_HOST=your-db-host
ENV DATABASE_PORT=5432

# Set working directory
WORKDIR /app

# Copy the application files from the build stage
COPY --from=build /app /app

# Expose the port the app will run on
EXPOSE 8080

# Run database migrations as an entrypoint before starting the app
ENTRYPOINT ["sh", "-c", "python manage.py migrate && gunicorn --bind 0.0.0.0:8080 --access-logfile - app.wsgi:application"]

