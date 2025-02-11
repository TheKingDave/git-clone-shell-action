#!/bin/bash

set -eux

SERVER_URL=${GITHUB_SERVER_URL}
if [[ "$SERVER_URL" =~ ^https?://(.+/?)$ ]]; then
  SERVER_URL="${BASH_REMATCH[1]}"
fi

git clone --progress --single-branch --branch "${INPUTS_BRANCH:-${GITHUB_REF##*/}}" "https://${GITHUB_REPOSITORY_OWNER}:${GITHUB_TOKEN}@${SERVER_URL}/${GITHUB_REPOSITORY}.git" .
