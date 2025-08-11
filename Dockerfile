# Use a stable official Java runtime base image
FROM openjdk:17-jdk-alpine AS build

# Metadata
LABEL maintainer="your-email@example.com" \
      version="1.0" \
      description="A simple Java application"

# Set working directory
WORKDIR /app

# Copy source code
COPY src/Main.java .

# Compile the Java code
RUN javac Main.java

# ------------------------------
# Create a smaller runtime image
# ------------------------------
FROM openjdk:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy compiled class from build stage
COPY --from=build /app/Main.class .

# Run the Java application
CMD ["java", "Main"]
