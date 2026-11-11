cat << 'EOF' > setup_live_japanese.sh && chmod +x setup_live_japanese.sh && ./setup_live_japanese.sh
#!/bin/bash

echo "=== Live環境向け 日本語環境自動セットアップを開始します ==="

# 1. パッケージリストの更新とインストール（高速化のため不要な更新はスキップ）
echo "1/2 日本語入力システムをインストールしています..."
sudo apt update && sudo apt install -y fcitx5 fcitx5-mozc

# 2. 環境変数の設定とFcitx5の即時起動
echo "2/2 再起動なしで入力システムを有効化しています..."
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# すでに動いている入力メソッドがあれば終了し、Fcitx5をバックグラウンドで起動
pkill -f fcitx
pkill -f ibus
fcitx5 -d &

echo "=== 設定が完了しました ==="
echo "現在のデスクトップのまま日本語入力（Fcitx5）を起動しました。"
echo "「半角/全角」キーまたは「Ctrl + Space」で切り替わるか確認してください。"
EOF
