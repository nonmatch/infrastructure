#!/usr/bin/env bash

FORMAT_OPTS="-i -style=file"
TIDY_OPTS="-p . --fix --fix-errors"
COMPILER_OPTS="-fno-builtin -std=gnu90 -Iinclude -Isrc -D_LANGUAGE_C -DNON_MATCHING"

shopt -s globstar

echo "Running clang-format..."
clang-format ${FORMAT_OPTS} src/**/*.c
clang-format ${FORMAT_OPTS} include/**/*.h
echo "Adding missing final new lines..."
find src/ -type f -name "*.c" -exec sed -i -e '$a\' {} \;
echo "Done formatting all files."