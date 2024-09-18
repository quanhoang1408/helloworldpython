# Use a lightweight Python base image
FROM python:3.9-alpine

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set the working directory
WORKDIR /app

# Copy the application code to the container
COPY app.py /app

# Install dependencies
RUN pip install flask

# Change ownership of the application files to the non-root user
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER appuser

# Expose port 5555
EXPOSE 5555

# Run the application
CMD ["python", "app.py"]
