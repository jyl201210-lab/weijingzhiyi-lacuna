<div align="right">
  <a href="./README.md">中文</a> &nbsp;|&nbsp; <strong>English</strong>
</div>

# Lacuna (未竟之意) `v2.4`

**Set the craft and safety baseline before the model speaks. Keep every real decision yours.**

**Lacuna** is a local, zero-latency **Pre-Model Context & Decision Engine** for **Codex (CLI & Desktop App)**, **Claude Code**, and **Antigravity**. It runs natively on **Windows, macOS, and Linux**, and automatically operates in **100% pure English** whenever you write prompts in English (zero CJK character leakage).

![Lacuna v2.4 Preview](./assets/screenshots/poster-preview-en.png)

---

## One-Line Install (Windows / macOS / Linux)

Prerequisite: `Node.js >= 20` (if you use the Codex Desktop App on Windows/macOS, you can paste the prompt below directly into Codex and let the AI install everything for you).

### Option 1: Universal `npm` One-Liner (PowerShell, CMD, macOS, Linux)
```bash
npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init
```

### Option 2: Native Shell One-Liners
- **Windows (PowerShell)**:
  ```powershell
  irm https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.ps1 | iex
  ```
- **macOS / Linux / WSL**:
  ```bash
  curl -fsSL https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.sh | sh
  ```

### Option 3: Install Directly Inside Codex Desktop App (Windows / macOS)
Paste this straight into your **Codex App** chat, then **fully quit and restart Codex App** once finished (click **Trust / Allow** if prompted once to trust the local hook):

```text
Please check if Node.js (>=20) is installed (install LTS if missing), then run `npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init` and verify with `lacuna self-test`.
```

---

## What Lacuna Does Today

Keep writing short, natural prompts as usual. Lacuna runs locally in **under 15ms** on `UserPromptSubmit` / `PreInvocation` before token generation starts (**0 extra LLM calls, 0 MCP tool clutter**):

1. **Automatic Craft & Safety Baselines**
   - **UI & Frontend Craft**: Enforces `font-variant-numeric: tabular-nums` on amounts/counts/IDs, duplicate-submit locks on async buttons, complete empty/loading/error states, and `:focus-visible` rings.
   - **Database & Ledger Safety**: Starts SQLite write transactions with `BEGIN IMMEDIATE` + `PRAGMA busy_timeout` to prevent `SQLITE_BUSY` races; stores monetary values in integer minor units (cents) rather than floats.
   - **Scientific & Statistical Rigor (`scRNA-seq`, etc.)**: Replaces arbitrary hardcoded cutoffs (like `percent.mt < 5%`) with per-batch median + `MAD` outlier detection and pre/post cell retention previews.
2. **Reversible V1 First + 2 Plain-Language Choices**
   - When retention or conflict rules are still undecided, Lacuna stops the model from stalling with 10 questions or silently hardcoding destructive deletes. Instead, the model ships a working reversible v1 (soft status flags or `--dry-run`) and asks at most **2 concrete binary choices** at the end.
3. **Cross-Turn Decision Lock & Physical `.jsonl` Rebase**
   - Accurately extracts confirmed decisions (including negations like *"Never hard-delete invoices"*, while ignoring questions), keeps them locked across long sessions, supersedes cleanly when you change your mind, and backs up + truncates drifted `.jsonl` turns via `lacuna rebase`.
4. **Native Windows Support & Pure English Isolation**
   - Full Windows PowerShell, `cmd.exe`, path-space, and CRLF compatibility. English prompts receive 100% pure English context; non-technical prompts (e.g., casual chat or translation) stay completely untouched.

---

## Same-Condition Verification Across 4 Frontier Models

Verified with identical underspecified prompts across **GPT-6 Astra**, **GPT-5.6 Sol**, **Claude Opus 5.5**, and **Claude Fable 5.1**:

| Domain | Typical Raw-Prompt Failure | With Lacuna Pre-Model Hook | Verified Models |
| :--- | :--- | :--- | :--- |
| **UI & Billing Views** | Jittery numeric columns, duplicate form submits, missing empty/error states | `tabular-nums`, async submit lock, complete view states & `:focus-visible` | 4 / 4 Passed |
| **SQLite & Ledger Writes** | Float rounding drift, `SQLITE_BUSY` write races, silent hard-deletes | Integer minor units (cents), `BEGIN IMMEDIATE` lock, reversible v1 default | 4 / 4 Passed |
| **Single-Cell `scRNA-seq` QC** | Hardcoded `5%` cutoff discarding metabolically active cells | Per-batch median + `MAD` adaptive thresholds & retention preview | 4 / 4 Passed |

---

## Everyday CLI Controls

Lacuna works silently in the background once installed, with full local CLI control whenever you want to inspect or tune it:

```bash
lacuna help                                  # Bilingual CLI reference
lacuna config show                           # Inspect active persistent settings
lacuna config set lang en                    # Language: auto (default) | en | zh
lacuna config set visual.default warm-editorial  # Pin default UI visual archetype
lacuna rules list                            # View locked decisions in current session
lacuna rules revoke --id r_1                 # Revoke a specific locked decision
lacuna rebase <session_id> 1                 # Backup & truncate last 1 drifted turn
lacuna self-test                             # Run cross-platform & bilingual test suite
lacuna uninstall                             # Detach global pre-model hooks cleanly
```

---

## License & Contact

This public repository distributes the closed-source single-file CLI release of **Lacuna (`UNLICENSED`, all rights reserved)** without internal source trees or raw preset files.

Feedback, Windows/macOS field reports, and collaboration inquiries are welcome:
- **Email**: `1061790014@qq.com`
- **WeChat**: `Jyl2012111`
- **GitHub**: [jyl201210-lab](https://github.com/jyl201210-lab)
