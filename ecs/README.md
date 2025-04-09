This folder contains task definitions for KushoAI on-prem services. DB (MySQL 8) and cache (Redis 6) need to be deployed separately and are not specified here.  

Points to remember:
- ECS Task Execution role should have permission to create log group, write logs, read from ECR and read from Secrets Manager
- Docker registry credentials need to be stored in Secrets Manager. You can't keep them in task definition
  
