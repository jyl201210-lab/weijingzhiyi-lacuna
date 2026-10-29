<div align="right">
  <a href="./README.md">中文</a> &nbsp;·&nbsp; <strong>English</strong>
</div>

![Lacuna 未竟之意](./assets/screenshots/poster-preview-en.png)

## Install

Requires `Node.js >= 20` on Windows, macOS, or Linux:

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

Codex Desktop App: send `npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init` in an in-app chat to install, then quit and restart the app once.

## Features

- **Task presets**: Attaches frontend, database, and statistical baselines before prompts reach the model. Explicit instructions take precedence; English prompts stay 100% English.
- **Session rules**: Carries confirmed session constraints (schemas, soft-delete, etc.) across turns. Inspect, add, or revoke via `lacuna rules`.
- **JSONL rollback**: `lacuna rebase <session_id> [turns]` backs up and truncates the last `N` turns of local Codex or Claude `.jsonl` logs.

## Commands

```bash
lacuna config show                 # Show active configuration
lacuna config set lang auto        # Language: auto (default) | en | zh
lacuna rules list                  # List session constraints (also: add, revoke, clear)
lacuna rebase <session_id> [turns] # Back up and truncate last N .jsonl turns
lacuna uninstall                   # Remove pre-model hooks
```

## Contact

Closed-source single-file CLI (`UNLICENSED`) · `1061790014@qq.com` · WeChat `Jyl2012111`
