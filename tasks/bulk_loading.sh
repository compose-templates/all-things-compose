#!/bin/bash
if [ "$1" == "yes" ]; then
  echo "👋 performing bulk loading..."
  cat ../tasks/data.txt | redis-cli -h redis-server -p 6379 --pipe 
else
  echo "🤖 no bulk loading"
fi
