#!/bin/sh

apk add --no-cache git nodejs npm
npm install -D tailwindcss
npm install

npx tailwindcss --input "$INPUT_INPUT" --output "$INPUT_OUTPUT" "$INPUT_PARAMS"