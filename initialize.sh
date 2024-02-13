#!/bin/bash
rm -rf data

cat > ./compose.yaml <<- EOM
# All things Compose
services:
EOM

rm -rf load-data
