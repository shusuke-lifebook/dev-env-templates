#!/usr/bin/env bash

code --list-extensions \
  | jq -R . \
  | jq -s '{ "recommendations": . }' \
  > extensions.json

echo "Generated extensions.json"
