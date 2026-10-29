<div align="right">
  <strong>中文</strong> &nbsp;·&nbsp; <a href="./README.en.md">English</a>
</div>

![未竟之意 Lacuna](./assets/screenshots/poster-preview.png)

## 安装

需要本机已安装 `Node.js >= 20`（Windows / macOS / Linux 通用，中英文提问自动识别切换）：

```bash
npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init
```

也可以直接用系统脚本安装：

```powershell
# Windows (PowerShell)
irm https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.ps1 | iex
```

```bash
# macOS / Linux / WSL
curl -fsSL https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.sh | sh
```

> **Codex 桌面端 App**：直接把下面这句发给对话框里的 AI 代装，装完**彻底退出并重启一次 App** 即可：  
> `Install Lacuna globally via: npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init`

## 核心机制

- **自动垫好预设**：按任务挂载 UI 排版（`tabular-nums`、克制色板、防连点）、SQLite 写锁与科研统计规范；你的明确指令永远排第一，一句话即可覆盖。
- **先跑初版再拍板**：话没说死时先交出可逆第一版，末尾最多只问 **2 个关键选择题**，不套廉价模板也不十连追问。
- **跨轮锁死 & 走偏回退**：自动记住已确认的规矩（含“不要物理删除”等否定要求）；某轮走偏时 `lacuna rebase` 自动备份并截断回退 `.jsonl` 会话。

## 常用命令

```bash
lacuna config show                 # 查看当前配置
lacuna config set lang en          # 语言：auto（默认自动识别，英文提问 100% 纯英文注入）| zh | en
lacuna rules list                  # 查看当前会话已锁定的规矩
lacuna rebase <session_id> 1       # 备份并物理截断最近 1 轮走偏记录
lacuna uninstall                   # 一键卸载全局前置 Hook
```

## 说明与联系

闭源单文件 CLI 发行版（`UNLICENSED`）。反馈与交流：`1061790014@qq.com` · WeChat `Jyl2012111`
