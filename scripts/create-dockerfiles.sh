### DOCKERFILE FOR USER-SERVICE  ###
cat << EOF > ./user-service/Dockerfile
# Stage 1: Build stage
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy package.json và package-lock.json để cài đặt dependencies
COPY package*.json ./

# Cài đặt dependencies
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Build ứng dụng (biên dịch TypeScript sang JavaScript)
RUN npm run build

# Stage 2: Production stage
FROM node:18

# Set working directory
WORKDIR /app

# Copy các file cần thiết từ stage 1 (builder)
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist

# Cài đặt các dependencies tối thiểu cho production
RUN npm install --only=production

# Expose port (định nghĩa cổng mà ứng dụng sẽ chạy)
EXPOSE 3000

# Chạy ứng dụng
CMD ["node", "dist/main"]
EOF



### DOCKERFILE FOR TASK-SERVICE  ###
cat << EOF > ./task-service/Dockerfile
# Use Maven image to build the project
FROM maven:3.8.7-openjdk-18 AS build

# Set the working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Build the project and create the jar file
RUN mvn clean package -DskipTests

# Use OpenJDK to run the jar file
FROM openjdk:18

# Set the working directory
WORKDIR /app

# Copy the built jar file from the previous stage
COPY --from=build /app/target/heartistry-task-api-0.0.1-SNAPSHOT.jar /app

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "heartistry-task-api-0.0.1-SNAPSHOT.jar"]
EOF
