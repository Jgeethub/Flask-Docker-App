# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first, to leverage Docker's cache
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Tell Flask to run on this port
ENV FLASK_RUN_PORT=3000

# Expose the port that the Flask app runs on
EXPOSE 3000

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]

