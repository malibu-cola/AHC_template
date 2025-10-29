#!/bin/bash
set -euo pipefail

if [ ! -d tools ]; then
    echo "tools/ ディレクトリが見つかりません。" >&2
    exit 1
fi

cd tools

for in_file in in/*.txt; do
    if [ ! -f "$in_file" ]; then
        echo "in/ に .txt が見つかりませんでした。" >&2
        exit 1
    fi

    filename="$(basename "$in_file" .txt)"
    out_file="../output/${filename}.txt"

    if [ -f "$out_file" ]; then
        echo "Processing: $filename"
        cargo run -r --bin vis "$in_file" "$out_file" "${filename}.html"
    else
        echo "Warning: output/${filename}.txt が見つかりませんでした。" >&2
    fi
done
