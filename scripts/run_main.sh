#!/bin/bash
set -euo pipefail

if [ ! -d tools/in ]; then
    echo "tools/in/ が見つかりません。コンテスト配布のローカルテスターを tools/ 配下に配置してください。" >&2
    exit 1
fi

mkdir -p output

for input_file in tools/in/*.txt; do
    if [ ! -f "$input_file" ]; then
        echo "tools/in/ に処理対象の .txt が見つかりませんでした。" >&2
        exit 1
    fi

    filename="$(basename "$input_file" .txt)"
    echo "Processing $filename..."
    uv run python ./submits/submit.py < "$input_file" > "output/${filename}.txt"
done

echo "All files processed successfully!"
