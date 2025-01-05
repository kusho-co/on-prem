## Prerequisites

- Docker Engine (version 20.10.0 or higher)
- Docker Compose (version 2.0.0 or higher)
- Minimum 4GB RAM
- At least 20GB free disk space

## Quick Start

1. Clone this repo
```bash
git clone https://github.com/kusho-co/on-prem.git
```

2. Change directory to `on-prem`. This is needed for next set of steps. 
```bash
cd on-prem
```

3. Run the setup script. This will install docker if not already present and create environment variables. Please go through this script and add set environment variables before running this.   
```bash
bash setup-kusho.sh     
```

4. Run the start script. It will take a couple of minutes for the services to come up.
```bash
bash start-kusho.sh
```

6. Verify all services are healthy. This should show 6 services - backend, frontend, mysql, redis, rq and cron jobs
```bash
sudo docker ps
```

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
