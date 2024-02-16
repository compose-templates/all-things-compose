#!/bin/bash
cat /load-data/data.txt | redis-cli -h redis-server -p 6379 --pipe 

