#!/bin/bash

# エラーが発生したら即座に終了
set -e

echo "========================================="
echo " Lubuntu 日本語環境 自動構築スクリプト"
echo "========================================="

# 1. パッケージリストの更新
echo "[1/5] パッケージリストを更新中..."
apt-get update -y

# 2. 日本語フォントのインストール
echo "[2/5] 日本語フォント（Noto CJK）をインストール中..."
apt-get install -y fonts-noto-cjk fonts-noto-cjk-extra

# 3. 日本語入力環境（Fcitx5 + Mozc）のインストール
echo "[3/5] 日本語入力システム（Fcitx5-Mozc）をインストール中..."
apt-get install -y fcitx5-mozc im-config dbus-x11

# 4. 言語パック・ロケール・タイムゾーンの設定
echo "[4/5] 地域・言語設定（日本語・東京）を適用中..."
apt-get install -y language-pack-ja language-pack-gnome-ja
locale-gen ja_JP.UTF-8
update-locale LANG=ja_JP.UTF-8
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# 5. システム全体への環境変数の書き込み（日本語入力の自動有効化）
echo "[5/5] 入力システムの環境変数を設定中..."
cat << 'EOF' >> /etc/profile

# Fcitx5 Japanese Input Settings
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
EOF

echo "========================================="
echo " 設定が完了しました！システムを再起動してください。"
echo "========================================="
