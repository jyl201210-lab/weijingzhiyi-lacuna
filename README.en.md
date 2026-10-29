<div align="right">
  <a href="./README.md">中文</a> &nbsp;·&nbsp; <strong>English</strong>
</div>

![Lacuna 未竟之意](./assets/screenshots/poster-preview-en.png)

## Install

Requires `Node.js >= 20` (Windows / macOS / Linux · English prompts automatically receive **100% pure English** presets with zero Chinese leakage):

```bash
npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init
```

Or install via native shell script:

```powershell
# Windows (PowerShell)
irm https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.ps1 | iex
```

```bash
# macOS / Linux / WSL
curl -fsSL https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.sh | sh
```

> **Codex Desktop App**: Paste this directly into your Codex App chat, then **fully quit and restart Codex App** once finished:  
> `Install Lacuna globally via: npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init`

## What It Does

- **Stack-aware presets**: Attaches UI craft (`tabular-nums`, restrained palettes, submit locks), SQLite write locks, and statistical rigor before send—your explicit instructions always win.
- **Reversible v1 + 2 choices**: Ships a runnable reversible v1 when underspecified, then surfaces at most **2 plain-English trade-off choices** instead of purple-gradient slop or 10 questions.
- **Session rule lock & rebase**: Preserves confirmed decisions (including negations like *"Never hard-delete"*) across turns, and backs up + truncates drifted `.jsonl` turns via `lacuna rebase`.

## Everyday Commands

```bash
lacuna config show                 # Inspect active settings
lacuna config set lang en          # Language: auto (default) | en | zh
lacuna rules list                  # List locked rules in current session
lacuna rebase <session_id> 1       # Backup & roll back last 1 drifted .jsonl turn
lacuna uninstall                   # Cleanly remove global pre-model hooks
```

## License & Contact

Closed-source single-file CLI distribution (`UNLICENSED`). Contact: `1061790014@qq.com` · WeChat `Jyl2012111`
