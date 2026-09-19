[English](README.md) · 简体中文 · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

以 C11 和本地优先为核心的 AltSource 浏览器，面向 iPhone/iPad。界面完整打包在 IPA 内，更接近 F-Droid 风格的软件目录：**软件源 → 应用 → 详情 → 获取 / 添加软件源**。

## 本次更新

本仓库将原有 AltSource Center 原生外壳与 AltDirect、AltSource Viewer 的实用交互模式结合起来：

- 本地软件源库。
- 添加软件源按钮和软件源详情。
- 支持搜索的应用页面。
- 每个应用独立的获取流程。
- 独立的添加软件源流程。
- 可编辑处理器注册表的软件客户端页面。
- 支持 English / 简体中文 / 繁體中文 以及更多界面语言。
- 软件源库本地导入/导出。
- IPA 内包含完整的 `web/` 前端，不是只打包一个远程网页链接。
- C11 核心负责处理器模型；iOS 使用轻量 UIKit/WebKit 桥接。
- 首页加入复制当前 Web URL 的按钮，以及 GitHub Releases 跳转入口。

## URL 协议支持

项目采用配置驱动方式。不存在一份涵盖所有 AltSource 兼容客户端的绝对权威列表，支持添加软件源也不代表一定支持 IPA 安装。URL 协议可能随客户端版本变化。

当前软件源处理器包括：

- AltStore Classic — `altstore-classic://source?url=...`
- SideStore — `sidestore://source?url=...`
- Feather — `feather://source/...`
- LiveContainer — `livecontainer://sources?url=...`
- StikStore — `stikstore://add-source?url=...`
- TrollApps — `trollapps://add?url=...`
- FlareStore — `flarestore://source?url=...`
- ESign — `esign://addsource?url=...`
- Ksign — `ksign://addsource?url=...`
- GBox — `gbox://AddSource/...`
- KravaSigner — `kravasigner://addRepo=...`

仅在有公开实现支持的情况下提供 IPA 安装 URL 操作：

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

可编辑注册表位于 `src/resources/url_handlers.json`，Web 界面在 `web/js/app.js` 中使用相同列表。

## Release Notes

每次 iOS 构建 Action 成功后，Release Notes 会自动加入当前可用的软件源 URL 协议和 IPA URL 协议。

## 使用 Theos SDK 本地构建

SDK 集合应位于 `$THEOS_SDKS` 或 `$HOME/theos/sdks`。

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

本地脚本可以选择设备 SDK 版本和部署目标。默认生成 ad-hoc IPA；需要签名时可使用自己的签名身份并配合 `--sign`。

## GitHub Actions

IPA 工作流为**仅手动运行**，没有 push 或 pull-request 触发器。

进入：

**Actions → Build iOS IPAs (manual) → Run workflow**

The workflow:

1. 检出本仓库。
2. 检出 `theos/sdks`。
3. 查找所有可用的 `iPhoneOS*.sdk`。
4. 针对每个设备 SDK 构建 arm64 IPA。
5. 创建或更新 GitHub Release 并上传生成的 IPA。
6. 构建成功后，更新 Release Notes，加入软件源和 IPA URL 协议信息。

## GitHub Pages

Pages 工作流同样只支持手动运行。手动执行后会发布 `web/` 目录。

Web 页面：https://xiaozhang-qd.github.io/AltSource-Center/web

## 上游参考

功能设计参考了：

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

本仓库为 clean-room 实现。第三方名称和 URL 协议仅用于兼容性说明；实现本身不要求使用第三方品牌或资源。

## 重要限制

本应用是 **URL 启动器/软件目录**，不是签名引擎。点击获取或添加软件源时，会调用所选客户端的 URL 协议（或打开托管的 IPA）。实际签名/安装行为由对应客户端负责。

## 许可证

MIT.
