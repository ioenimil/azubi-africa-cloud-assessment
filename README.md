<p align="center">
    <img src="https://user-images.githubusercontent.com/62269745/174906065-7bb63e14-879a-4740-849c-0821697aeec2.png#gh-light-mode-only" width="40%">
    <img src="https://user-images.githubusercontent.com/62269745/174906068-aad23112-20fe-4ec8-877f-3ee1d9ec0a69.png#gh-dark-mode-only" width="40%">
</p>

# Full-Stack Todo List Application

This repository **hosts** a full-stack Todo List application designed to allow users to create, manage, and organize their tasks efficiently. The application features a React-based frontend and a Node.js backend, utilizing MongoDB for data persistence.

## Setup Instructions

### Prerequisites
- Install Docker and Docker Compose.
- Ensure ports 3000, 27017, and 80 are available.

### Build and Run Containers
1. Navigate to the project root directory:
   ```bash
   cd /home/ioenimil/ENIMIL-DISK/Software Engineering/Projects/Azubi/fullstack-todo-list
   ```
2. Build and start the containers:
   ```bash
   docker compose up --build
   ```
3. Access the services:
   - Backend: [http://localhost:3000](http://localhost:3000)
   - Frontend: [http://localhost](http://localhost)
   - MongoDB: Internal connection at `mongodb://mongo:27017/`
4. Test container health:
   ```bash
   chmod +x test_containers.sh
   ./test_containers.sh
   ```

### Stop Containers
To stop the containers, run:
```bash
docker-compose down
```

## Network and Security Configurations

### Network
- All services are connected via a custom Docker network: `azubui-africa-app-network`.

### Container Names
- Backend: `azubi-africa-backend`
- MongoDB: `azubi-africa-mongodb`
- Frontend: `azubi-africa-frontend`

### Exposed Ports
- Backend: Port `3000` (host mapped).
- MongoDB: Port `27017` (host mapped).
- Frontend: Port `80` (host mapped).

### Environment Variables
- **Backend**:
  - `MONGO_URI`: MongoDB connection string.
  - `NODE_ENV`: `production`.
  - `PORT`: `3000`.
- **Frontend**:
  - `VITE_APP_BACKEND_URL`: Backend API URL.

### Security
- MongoDB is configured with `restart: always`.
- Use `.env` files for sensitive credentials.

## Troubleshooting Guide

### Quick Container Health Check
Run the included test script to verify all services are operational:
```bash
chmod +x test_containers.sh
./test_containers.sh
```
This script checks the connectivity of all three components.

### Containers Not Starting
- Ensure Docker is running.
- Check for port conflicts.

### Backend Healthcheck Failing
- View backend logs:
  ```bash
  docker logs azubi-africa-backend
  ```
- Test API connectivity:
  ```bash
  curl http://localhost:3000/todos
  ```

### Frontend Not Loading
- Verify backend is accessible at `http://localhost:3000`.
- Check frontend directly:
  ```bash
  curl http://localhost:80
  ```

### Database Connection Issues
- Check MongoDB logs:
  ```bash
  docker logs azubi-africa-mongodb
  ```
- Test database connection:
  ```bash
  nc -zv localhost 27017
  ```
