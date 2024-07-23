#!/bin/bash
set -e
docker rm -f amiga_gcc || true
cat ./scripts/Dockerfile.bookworm | docker build -t amiga_gcc -
docker run -d --name amiga_gcc amiga_gcc sleep 86400 # 24 hours...
docker cp amiga_gcc:/release ./
docker rm -f amiga_gcc || true
docker system prune -f -a
exit 0
