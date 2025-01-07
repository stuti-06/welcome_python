#Use an official python runtime as a base image
FROM python:3.9-slim

#Install Git to clone this repository
RUN apt-get update && apt-get install -y git

#Set the working directory isnide the container
WORKDIR /app

#Clone your python project from github 
COPY welcome_python/ .

# Expose the port the app will run on
EXPOSE 8080

# Command to run the application (change it based on how you run your Python code)
CMD python arithmatic_operations.py && python test_arithmatic_operations.py
