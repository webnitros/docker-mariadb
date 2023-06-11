```bash
docker build -t my-redis:3.2.12 .
docker run -d --name my-redis-container -p 16379:6379 my-redis:3.2.12
```
