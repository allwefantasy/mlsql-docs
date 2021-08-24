#!/usr/bin/env bash

docker stop mlsql-docs
docker rm mlsql-docs

docker run -p 4000:80 --name mlsql-docs -d mlsql-docs