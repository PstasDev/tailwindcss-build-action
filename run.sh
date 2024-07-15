#!/bin/sh

apk add --no-cache git nodejs npm
npm install -D tailwindcss
npm install

npx tailwindcss --input "$INPUT_INPUT" --output "$INPUT_OUTPUT" "$INPUT_PARAMS"

git config --global --add safe.directory /github/workspace
git add --force $INPUT_OUTPUT
git config user.name "GitHub"
git config user.email "noreply@github.com"
git diff-index --quiet HEAD || git commit -sm "tailwindcss-update"