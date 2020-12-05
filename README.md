Create application:
```bash
eb init
```

Create environment:
```bash
eb create
```

Show images:
```bash
docker images
```

Local build and run:
```bash
docker build -t cart-api .
docker run --rm -it -p 8080:8080 cart-api
```
