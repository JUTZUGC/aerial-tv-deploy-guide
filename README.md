# Aerial APK 安装指南

> 第三方部署指南 · 非 Aerial 官方仓库。官方项目：[pengchujin/aerial-tv](https://github.com/pengchujin/aerial-tv)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://github.com/pengchujin/aerial-tv/blob/main/README.md)为准。

[![⚡ APK 安装](https://img.shields.io/badge/%E2%9A%A1_APK_%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#apk安装推荐用百度搭子)

## APK 安装（推荐：用百度搭子）

> [!TIP]
> 不用 root、不用刷机，让百度搭子用 ADB 把电视桌面换成 Aerial。

⚠️ 仅 Android TV 5.0+；Android 4.0–4.4 老电视用 Aerial Lite 测试版。需要电视与电脑在同一局域网并开启 ADB，部分品牌要先无线配对或用数据线授权。不 root、不改系统，可随时还原。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/aerial-tv-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会下载并校验 APK，检测到 adb 时连接电视安装并授权，否则提示用 U 盘安装，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## Aerial 是什么？

Aerial 是开源的7.2k stars，MIT，参照 tvOS 的无广告 Android TV 桌面（协议：MIT，<img src="https://img.shields.io/github/stars/pengchujin/aerial-tv?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

参照 Apple TV 重做的 Android TV 桌面：常用 App 放在底部玻璃底板，支持文件夹、隐藏、卸载与开机自启，带航拍屏保、必应壁纸和手机扫码整理。

- 无广告：没有推荐流和会员角标，只有 App、壁纸与屏保
- 整理能力：长按移动、文件夹、隐藏、卸载、设为开机启动
- 手机整理：扫电视二维码，在手机上拖动排序、改名、换图标
- 屏保与壁纸：航拍影片、必应每日精选、本地照片与视频
- 控制中心：信号源、网络、设置、音量、亮度与个性化
- 不 root：不改系统应用，随时可以还原

（来源：[官方仓库](https://github.com/pengchujin/aerial-tv)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 7.2k stars | 近期增长最快的国产电视桌面项目之一 |
| 无广告 | 没有推荐流、会员角标和营销位 |
| 不 root | 不改系统分区，随时能还原 |
| 功能够全 | 文件夹、隐藏、开机自启、屏保、手机整理都有 |
| 分品牌文档 | 小米、TCL、海尔、OPPO 等都有 ADB 开启说明 |
| MIT | 可自行编译与二次开发 |

| 需要注意 | 说明 |
|---|---|
| 需要 ADB | 电视必须开调试，部分品牌步骤较绕 |
| 无线调试要配对 | Android 11+ 部分机型不能直接连 5555 |
| 老电视功能受限 | Android 4.x 只能用 Lite 测试版 |
| 桌面接管依赖系统权限 | 部分电视要手动开无障碍与通知使用权 |
| 不是所有品牌都能装 | 极少数固件会拦截桌面类 App |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
read -r -p "请输入电视 IP（例如 192.168.1.20）: " TV
curl -fL -o aerial-standard.apk "https://github.com/pengchujin/aerial-tv/releases/download/v1.67/aerial-standard.apk"
echo "29e5bda2350305d7d63c9dae0339ac885722fa42f239f51bbbb3bd133cf606ad  aerial-standard.apk" | sha256sum -c -
if command -v adb >/dev/null 2>&1; then adb connect "$TV:5555" && adb install -r aerial-standard.apk && adb shell pm grant app.orchard.tv android.permission.WRITE_SECURE_SETTINGS && adb shell am start -n app.orchard.tv/.MainActivity; else echo "未检测到 adb：请把 aerial-standard.apk 拷到 U 盘，用电视文件管理器安装"; fi
```

安装包来源：[https://github.com/pengchujin/aerial-tv/releases/tag/v1.67](https://github.com/pengchujin/aerial-tv/releases/tag/v1.67)

## 验证状态

| 场景 | 状态 |
|---|---|
| Release v1.67 的 aerial-standard.apk 已下载，SHA256 与 Release 记录一致（2.9 MB） | 已核对 2026-10-28 |
| aerial-guard.apk / aerial-lite.apk 的资产与 SHA256 digest 已核对 | 已核对 2026-10-28 |
| README 确认分品牌 ADB 步骤、三个安装包用途与验收命令 | 已核对 2026-10-28 |
| 未实测安装（本机无 Android TV 设备） | 说明 2026-10-28 |
| 非目标宿主调用被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-28 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Aerial 本身不含 MCP；本仓库的 MCP 只提供安装步骤、分品牌 ADB 指引与常见问题，不参与电视桌面控制。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\aerial-tv-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 先开电视的 ADB

| 电视 | 大致路径 |
|---|---|
| 小米 / Redmi | 关于 → 连按产品型号进开发者模式，再到账号与安全打开 ADB 调试 |
| TCL / 雷鸟 | 关于 → 本机信息，按遥控器「上下左右」，在更多里打开 ADB |
| 海尔 / 模卡 | 机身信号源键 + 遥控器「左左上右」，工厂菜单里打开 ADB |
| OPPO | 关于本机 → 设备型号，按「上上右右」确认，再到开发者选项开 USB 调试 |
| 其他 Android TV | 关于 → 连按内部版本号 7 次，再到开发者选项开 USB 调试 |

电视 IP 在「设置 → 网络 → 已连接的网络」里。只有无线调试的 Android 11+ 电视，需要先在电视上打开「无线调试 → 使用配对码配对设备」，再执行 `adb pair` 与 `adb connect`。

## 三个安装包怎么选

| 文件 | 用在 |
|---|---|
| `aerial-standard.apk` | Android 5.0 及以上，先装这个 |
| `aerial-guard.apk` | standard 提示不允许安装桌面类 App 时 |
| `aerial-lite.apk` | Android 4.0–4.4 老电视，测试版 |

## 装完验收

```bash
adb shell "cmd package resolve-activity --brief -a android.intent.action.MAIN -c android.intent.category.HOME"
adb shell settings get secure enabled_accessibility_services
adb shell "dumpsys window | grep mCurrentFocus"
```

最后一条输出里出现 `app.orchard.tv`，说明桌面已经接管。

> ⚠️ 安装过程会改桌面与无障碍设置，但不卸载系统应用；升级前记下原来的桌面，需要时可在系统设置里切回。

## 常见坑

- 找不到 ADB 开关：不同品牌路径不同，按 README 的分品牌说明逐项找
- adb connect 被拒绝：Android 11+ 先无线配对，或先用数据线授权一次再 adb tcpip 5555
- standard 装不上：换 aerial-guard.apk 再试，仍不行说明固件限制桌面类 App
- 装完按主页键没反应：到电视设置里打开桌面守护（无障碍）和通知使用权
- 重启后回到原桌面：确认 Aerial 已被设为默认桌面，或重新执行启动命令
- 升级后设置丢失：正常覆盖安装会保留设置，不要先卸载
- 老电视界面异常：Android 4.x 改用 aerial-lite.apk

## 免责声明

本仓库为第三方指南，与 Aerial 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://github.com/pengchujin/aerial-tv/blob/main/README.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
