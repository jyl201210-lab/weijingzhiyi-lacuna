<div align="right">
  <a href="./README.md">中文</a> &nbsp;·&nbsp; <strong>English</strong>
</div>

![Lacuna 未竟之意](./assets/screenshots/poster-preview-en.png)

## Install

`Node.js >= 20` · Windows / macOS / Linux · Works with Codex (CLI & Desktop App), Claude Code, and Antigravity

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

For Codex Desktop App, send the `npm` command above in an in-app chat, then fully quit and restart the app.

## Use

- **Explore**: While the goal is taking shape, start with a working, reversible implementation and surface key trade-offs for your decision.
- **Iterate**: Carry confirmed architecture and data conventions through development and bug fixes. View, add, or revoke with `lacuna rules`.
- **Rewind**: Back up and truncate the last `N` turns of local Codex / Claude Code `.jsonl` logs while keeping workspace code in place.

```bash
lacuna rules list                   # View confirmed conventions (also: add, revoke, clear)
lacuna rebase <session_id> [turns]  # Back up and remove the last N turns
lacuna config show                  # View configuration
lacuna config set lang auto         # Language: auto (default, 100% EN on EN input) | en | zh
lacuna uninstall                    # Remove integration settings
```

Includes baselines for frontend layout and UI states, database transaction locks and snapshot checks, and avoiding circular reasoning in statistical tests. Explicit instructions always take precedence.

## About

v2.4 · Closed-source single-file CLI · `UNLICENSED` · [1061790014@qq.com](mailto:1061790014@qq.com) · WeChat `Jyl2012111`
