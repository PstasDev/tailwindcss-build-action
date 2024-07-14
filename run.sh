#!/bin/sh

apk add --no-cache git nodejs npm
npm install -D tailwindcss
npm install

npx tailwindcss --input "$INPUT_INPUT" --output "$INPUT_OUTPUT" "$INPUT_PARAMS"

git config --global --add safe.directory /github/workspace
git add --force src/output.css
git auth --with-token "$INPUT_TOKEN"
git config user.name "PstasDev"
git config user.email "contact@botond.eu"
git diff-index --quiet HEAD || git commit -sm "tailwindcss-update"
git push