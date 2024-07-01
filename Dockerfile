FROM docker.io/library/node:latest AS s3-adapter

WORKDIR /tmp

RUN npm i ghost-storage-adapter-s3

FROM docker.io/library/ghost:5.87.0

RUN mkdir -p ./content/adapters/storage
COPY --from=s3-adapter /tmp/node_modules/ghost-storage-adapter-s3 ./content/adapters/storage/s3