#!/bin/bash

PORT=$1
cd "$PORT" || exit
redis-server ./redis.conf
