# Aerial APK 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/pengchujin/aerial-tv/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

$TV = Read-Host '请输入电视 IP（例如 192.168.1.20）'
curl.exe -L --fail -o aerial-standard.apk "https://github.com/pengchujin/aerial-tv/releases/download/v1.67/aerial-standard.apk"
if ((Get-FileHash aerial-standard.apk -Algorithm SHA256).Hash.ToLower() -ne '29e5bda2350305d7d63c9dae0339ac885722fa42f239f51bbbb3bd133cf606ad') { throw 'SHA256 校验失败，请重新下载' }
if (Get-Command adb -ErrorAction SilentlyContinue) { adb connect "$TV`:5555"; adb install -r .\aerial-standard.apk; adb shell pm grant app.orchard.tv android.permission.WRITE_SECURE_SETTINGS; adb shell am start -n app.orchard.tv/.MainActivity } else { Write-Host '未检测到 adb：请把 aerial-standard.apk 拷到 U 盘安装' }

Write-Host ''

Write-Host '安装完成：按主页键选择 Aerial 并设为始终；若电视不弹选择框，到设置里开启桌面守护与通知使用权'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/pengchujin/aerial-tv/blob/main/README.md'
