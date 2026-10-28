#!/usr/bin/env bash
set -euo pipefail
# Aerial APK 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/pengchujin/aerial-tv/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

read -r -p "请输入电视 IP（例如 192.168.1.20）: " TV
curl -fL -o aerial-standard.apk "https://github.com/pengchujin/aerial-tv/releases/download/v1.67/aerial-standard.apk"
echo "29e5bda2350305d7d63c9dae0339ac885722fa42f239f51bbbb3bd133cf606ad  aerial-standard.apk" | sha256sum -c -
if command -v adb >/dev/null 2>&1; then adb connect "$TV:5555" && adb install -r aerial-standard.apk && adb shell pm grant app.orchard.tv android.permission.WRITE_SECURE_SETTINGS && adb shell am start -n app.orchard.tv/.MainActivity; else echo "未检测到 adb：请把 aerial-standard.apk 拷到 U 盘，用电视文件管理器安装"; fi

echo ""

echo "安装完成：按主页键选择 Aerial 并设为始终；若电视不弹选择框，到设置里开启桌面守护与通知使用权"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/pengchujin/aerial-tv/blob/main/README.md"
