<div align="right">
  <a href="./README.md">中文</a> &nbsp;·&nbsp; <strong>English</strong>
</div>

![Lacuna 未竟之意](./assets/screenshots/poster-preview-en.png)

## Install

`Node.js >= 20` · Windows / macOS / Linux · Works with Antigravity, Codex (CLI & Desktop App), and Claude Code (uses your logged-in subscription out of the box—no API key required)

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

- **Same-App Subscription Default**: Whichever app you are chatting in, Lacuna uses that app's own logged-in subscription model once before sending (zero hidden post-turn calls), showing every model call openly at the top of the window and falling back honestly to local baseline rules on timeout or quota exhaustion.
- **Multi-Message Coalescing & Long-Session Continuity**: Automatically combines consecutive short messages sent before the AI replies into one complete thought, and hydrates a lightweight Q&A spine plus your disclosed project context (such as real capabilities vs demo-only placeholders) from local session transcripts—even when attaching 40+ turns in.
- **Optional Multi-Model Cross-Review**: Users with multiple subscriptions on one machine can explicitly enable `lacuna cross-review on` for parallel primary + co-reviewer calibration with full call transparency.
- **Adjustable Cost Tiers**: Switch anytime between `standard` (every substantive turn), `light` (inflection points only), and `quiet` (local baseline rules, 0 model calls).
- **Existing-Project Respect & Recovery**: Follows existing UI tokens and ledger column precision first when editing established codebases; persists global commitments and cleanly `rebase`s or `fork`s derailed turns while preserving your words.

```bash
lacuna status                       # Inspect active subscription channel, tier, call log & hooks
lacuna tier standard|light|quiet    # Switch cost tier anytime (0-call 'quiet' mode supported)
lacuna cross-review on|off|status   # Toggle optional multi-model cross-review (off by default)
lacuna rules list                   # Manage standing global commitments (add / revoke / clear)
lacuna rebase <session_id> [turns]  # Back up and cut the last N derailed turns
lacuna fork <session_id> [turns]    # Fork a clean session UUID non-destructively
lacuna uninstall                    # Remove integration settings
```

Includes domain craft cards for frontend UI & states, SQLite/backend transactions, ledger-aware monetary math, independent statistical checks, verbatim note organization, and commercial accountability—delivered only when actively building that deliverable.

## About

v3.3 (3.3.0) · Closed-source single-file CLI · `UNLICENSED` · [1061790014@qq.com](mailto:1061790014@qq.com) · WeChat `Jyl2012111`
