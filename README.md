# AHC Template

AtCoder Heuristic Contest 向けの最小構成テンプレートです。`@ahc055/` のディレクトリ構成をベースに、毎回のコンテストで流用できるようにしています。

## 使い方

1. 新しいコンテスト用ディレクトリを作成し、このテンプレート一式をコピーします。
2. `pyproject.toml` を必要に応じて編集し、`uv sync` で依存関係をインストールします。
3. コンテスト配布のローカルテスター一式を `tools/` 配下に配置します（`tools/in/*.txt` など）。
4. `scripts/run_main.sh` や `scripts/visualize_scripts.sh` を実行できるように `chmod +x scripts/*.sh` を付与します。
5. `src/` 以下をコンテスト仕様に合わせて実装します。

## ディレクトリ構成

- `src/` : 実装の本体。`data_handler`（入出力のパース）、`solver`（アルゴリズム本体）、`utils`（スコア計算など）に分割しています。
- `submits/submit.py` : 提出用のラッパースクリプト。必要であれば複数バージョンを追加して管理してください。
- `scripts/run_main.sh` : `tools/in/*.txt` を順に読み込み、`output/` に結果を保存します。
- `scripts/visualize_scripts.sh` : `tools` 内の可視化ツール（`cargo run -r --bin vis` を想定）を一括実行します。
- `output/` : ローカル実行の出力を保存するディレクトリ（スクリプトが自動作成します）。
- `tools/` : コンテスト配布物（ローカルテスター・ビジュアライザなど）を配置する場所。テンプレートには含まれていないため、自分でダウンロードして配置してください。

## 実装の進め方

- `src/data_handler/data/input_data.py` / `output_data.py` に、コンテスト固有のデータ構造を定義します。
- `src/data_handler/manager/input_manager.py` / `output_manager.py` で入出力フォーマットに合わせたパース・フォーマット処理を実装します。
- `src/solver/solver.py` にアルゴリズム本体を記述します。
- `src/utils/score.py` をローカル評価値がある場合に実装し、`main.py` からログ出力できるようにします。
- 提出用コードの組み立て方を変えたい場合は `submits/` 配下に任意のスクリプトを追加し、`scripts/run_main.sh` の呼び出し先を変更してください。

## ローカル実行

- 単発のテストは `uv run python src/main.py < input.txt` のように実行できます。
- 複数入力をまとめて試す場合は `./scripts/run_main.sh` を利用します。
- 出力と組み合わせて可視化したい場合は `./scripts/visualize_scripts.sh` を実行します（`tools` 内のビジュアライザ実装に依存します）。

必要に応じて、ロガーやプロファイラ、各種ユーティリティを拡張して使ってください。
