#Use an official python runtime as a base image
FROM python:3.9-slim

#Set the working directory isnide the container
WORKDIR /app

# Expose the port the app will run on
EXPOSE 8080

# Command to run the application (change it based on how you run your Python code)
CMD python arithmatic_operations.py && python test_arithmatic_operations.py



