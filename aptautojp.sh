cat << 'EOF' > setup_kubuntu_live.sh && chmod +x setup_kubuntu_live.sh && ./setup_kubuntu_live.sh
#!/bin/bash

echo "=== Kubuntu Live環境 日本語自動セットアップ ==="

# 1. Fcitx5 と Mozc のインストール
echo "1/3 パッケージをインストール中..."
sudo apt update && sudo apt install -y fcitx5 fcitx5-mozc kde-config-fcitx5

# 2. KDEセッションへ環境変数を即時注入
echo "2/3 環境変数を設定中..."
export IMMODULE=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# 3. 既存のインプットメソッドを終了し、Fcitx5を即時バックグラウンド起動
echo "3/3 日本語入力システムを起動中..."
pkill -f fcitx
pkill -f ibus
fcitx5 -d --replace &

echo "=== 設定完了 ==="
echo "タスクバー（右下）にキーボードか「あ」のアイコンが表示されたら準備完了です。"
echo "「半角/全角」キーまたは「Ctrl + Space」で日本語入力を切り替えてください。"
EOF
