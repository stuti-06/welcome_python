#Use an official python runtime as a base image
FROM python:3.9-slim

RUN apt-get update && apt-get upgrade -y

# Install Trivy
RUN wget https://github.com/aquasecurity/trivy/releases/download/v0.32.0/trivy_0.32.0_Linux-64bit.deb && \
    dpkg -i trivy_0.32.0_Linux-64bit.deb && \
    rm trivy_0.32.0_Linux-64bit.deb

#Set the working directory isnide the container
WORKDIR /app

# Expose the port the app will run on
EXPOSE 8080

# Command to run the application (change it based on how you run your Python code)
CMD python arithmatic_operations.py && python test_arithmatic_operations.py



