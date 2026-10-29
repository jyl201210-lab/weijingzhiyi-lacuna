<div align="right">
  <strong>中文</strong> &nbsp;·&nbsp; <a href="./README.en.md">English</a>
</div>

![未竟之意 Lacuna](./assets/screenshots/poster-preview.png)

## 安装

`Node.js >= 20` · Windows / macOS / Linux · 支持 Codex（CLI 与桌面端 App）、Claude Code、Antigravity

```bash
npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init
```

```powershell
# Windows PowerShell
irm https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.ps1 | iex
```

```bash
# macOS / Linux
curl -fsSL https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.sh | sh
```

Codex 桌面端 App 可在应用内对话直接发送上方 `npm` 命令安装，完成后完全退出并重启一次 App。

## 使用

- **探索**：目标未定时，先做出可用、可回退的实现，再列出关键取舍供你确认。
- **迭代**：将已确认的架构与数据约定持续带入后续开发和修复；用 `lacuna rules` 查看、添加或撤销。
- **回退**：备份并截断本地 Codex / Claude Code `.jsonl` 最后若干轮对话，保留工作区代码。

```bash
lacuna rules list                   # 查看已确认的约定（支持 add / revoke / clear）
lacuna rebase <session_id> [turns]  # 备份并截断最后 N 轮对话
lacuna config show                  # 查看配置
lacuna config set lang auto         # 语言：auto（默认，英文输入纯英文注入）| zh | en
lacuna uninstall                    # 移除接入配置
```

内置前端排版与状态、数据库事务锁与快照核验、统计检验防循环论证基线；你的明确指令始终优先。

## 关于

v2.4 · 闭源单文件 CLI · `UNLICENSED` · [1061790014@qq.com](mailto:1061790014@qq.com) · WeChat `Jyl2012111`
