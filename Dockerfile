# ============== Frontend ==============
FROM node:10 as frontend-builder
WORKDIR /workspace/frontend

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY frontend/package.json      package.json
COPY frontend/package-lock.json package-lock.json

RUN npm install

COPY frontend/ .

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

# ========= backend go
FROM golang:1.15.2 as backend-builder
WORKDIR /workspace/backend

COPY backend/go.mod go.mod
COPY backend/go.sum go.sum

RUN go mod download

# go source code
COPY backend/ .

RUN go build -ldflags "-s -w" -o echo-example .

# ============== Final ==============
FROM alpine
WORKDIR /workspace

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# Collect binaries and assets
COPY --from=frontend-builder /workspace/frontend/ frontend/
COPY --from=backend-builder  /workspace/backend/echo-example .
