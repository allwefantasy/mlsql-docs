#!/usr/bin/env bash

gitbook build
docker build -t mlsql-docs .