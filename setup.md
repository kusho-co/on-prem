## Prerequisites

- Docker Engine (version 20.10.0 or higher)
- Docker Compose (version 2.0.0 or higher)
- Minimum 4GB RAM
- At least 20GB free disk space

## Quick Start

1. Create a `.env` file in the project root with the following variables:
```env
MYSQL_ROOT_PASSWORD=your_secure_password
MYSQL_USER=your_db_user
MYSQL_PASSWORD=your_secure_password
OPENAI_API_KEY=your_api_key
OPENAI_ORG_ID=your_org_id
ENVIRONMENT=production
```

2. Start the services:
```bash
docker-compose up -d
```

3. Verify all services are healthy:
```bash
docker-compose ps
```

## Service Configuration

### Backend API Server
- Default port: 8080
- Configuration via environment variables:
  - `MYSQL_USERNAME`: Database username
  - `MYSQL_PASSWORD`: Database password
  - `MYSQL_HOST`: Database hostname
  - `REDIS_HOST`: Redis hostname
  - `REDIS_PORT`: Redis port
  - `OPENAI_API_KEY`: OpenAI API key
  - `OPENAI_ORG_ID`: OpenAI Organization ID

### Frontend Dashboard
- Default port: 5173
- Accessible at: `http://localhost:5173`
  

### MySQL Database
- Default port: 3306
- Persistence: Data stored in named volume `mysql_data`

### Redis Cache
- Default port: 6379
- Persistence: AOF enabled
- Data stored in named volume `redis_data`


## Volume Management
The deployment uses two named volumes:
- `mysql_data`: Persists MySQL database files
- `redis_data`: Persists Redis data

To backup these volumes:
```bash
docker run --rm -v mysql_data:/source -v $(pwd)/backup:/backup alpine tar czf /backup/mysql_backup.tar.gz -C /source .
docker run --rm -v redis_data:/source -v $(pwd)/backup:/backup alpine tar czf /backup/redis_backup.tar.gz -C /source .
```

## Troubleshooting

Common issues and solutions:

1. **Database Connection Failed**
   - Verify MySQL service is running: `docker-compose ps db`
   - Check logs: `docker-compose logs db`
   - Ensure correct credentials in `.env` file

2. **Redis Connection Issues**
   - Check Redis logs: `docker-compose logs redis`
   - Verify network connectivity between services

3. **Worker Not Processing Jobs**
   - Verify Redis connection
   - Check worker logs: `docker-compose logs worker`
   - Ensure correct environment variables are set

## Security Considerations

1. Change all default passwords in production
2. Secure the Redis instance if exposed
3. Regular backup of data volumes
4. Keep Docker and all images updated
5. Monitor service logs for unusual activity