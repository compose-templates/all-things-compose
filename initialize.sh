#!/bin/bash
cat > ./compose.yaml <<- EOM
# All things Compose
services:
EOM

rm redis-server.yaml
