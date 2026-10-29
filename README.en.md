<div align="right">
  <a href="./README.md">中文</a> &nbsp;|&nbsp; <strong>English</strong>
</div>

# Lacuna (未竟之意) `v2.4`
**Pre-Send Intent & Preset Controller for Codex (CLI & Desktop App), Claude Code, and Antigravity · Windows / macOS / Linux · Auto EN / ZH**

![Lacuna v2.4 Preview](./assets/screenshots/poster-preview-en.png)

---

## 1. What Problem Does It Actually Solve?

When building software, UIs, or data analysis pipelines with Codex or Claude Code, three everyday frustrations show up over and over:

1. **On Turn 1, when your prompt doesn't spell out every detail, the model either guesses ugly/unsafe defaults or stalls with ten questions**:
   - Ask for "a billing page" without specifying colors, numeric alignment, or SQLite locks, and the model either ships a generic purple-gradient template with jittery decimals and three unrequested join tables—or interrogates you before writing a single line of code.
2. **Ten turns into a session, it forgets the rules you already settled**:
   - You confirm on Turn 2: *"Keep everything in one flat table and never hard-delete settled rows."* By Turn 5 while fixing a concurrency bug, the model quietly reintroduces soft-delete join tables or destructive deletes.
3. **Once a turn goes down the wrong rabbit hole, arguing in chat only digs deeper**:
   - Hundreds of lines of wrong code stay inside the session context, pulling follow-up fixes back into the same trap—yet starting a fresh chat wipes out all the rules you already agreed on.

**Lacuna does three concrete things locally—right before your prompt is sent to the model (your explicit instructions always take top priority and override any preset in one sentence):**

1. **Fills in concrete domain habits automatically (Preset Library)**:
   - **Frontend & UI**: Adds `tabular-nums` alignment on amounts/counts, `4px/8px` spacing scales, empty/loading/error states, duplicate-submit locks, and restrained palettes (no neon purple-blue AI gradients);
   - **Backend & Data**: Requires locking explicit record ID snapshots and verifying row counts on batch updates/deletes; injects `BEGIN IMMEDIATE` write locks and integer cent storage only when `SQLite` / ledger tasks are detected;
   - **Scientific & Statistical Rigor**: Blocks circular validation (re-testing a variable on the same data split used to select it) and hardcoded `scRNA-seq` `5%` mitochondrial cutoffs in favor of per-batch `MAD` thresholds and sensitivity checks.
2. **Turn 1: Ships a working, reversible v1 first + asks at most 2 binary choices**:
   - When requirements aren't fully settled yet, the model delivers a runnable reversible v1 first, then asks at most **2 plain-English trade-off questions** outside the code block (e.g., *physically delete settled rows vs. keep history via status flags?*) so your real intent can surface against working code.
3. **Locks confirmed decisions across turns + physically truncates drifted `.jsonl` history (`lacuna rebase`)**:
   - Confirmed choices (including negations like *"Never hard-delete"*) stay attached to every subsequent turn; if a turn goes off-track, `lacuna rebase` backs up the `.jsonl` transcript and truncates the bad turn so you rerun cleanly with your locked rules intact.

---

## 2. 30-Second Install (Windows / macOS / Linux)

Requires `Node.js >= 20`. Language mode defaults to `auto`: **prompts written in English automatically receive 100% pure English presets and directives (zero Chinese character leakage)**.

### Option 1: Universal `npm` Command (PowerShell, CMD, macOS, Linux)
```bash
npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init
```

### Option 2: Native Shell Scripts
- **Windows (PowerShell)**:
  ```powershell
  irm https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.ps1 | iex
  ```
- **macOS / Linux / WSL**:
  ```bash
  curl -fsSL https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.sh | sh
  ```

### Option 3: Codex Desktop App (Windows / macOS) — Let Codex Install It for You
Paste this directly into your **Codex App** chat, then **fully quit and restart Codex App** once finished (click **Trust / Allow** if prompted once to approve the local hook):

```text
Please check if Node.js (>=20) is installed (install LTS if missing), then run `npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init` and verify with `lacuna self-test`.
```

---

## 3. Same-Condition A/B Verification

Tested on the exact same underspecified full-stack workbench prompt (*"Build a single-file HTML workbench for lab sample anomaly review and batch settlement"*) at identical `xhigh` reasoning effort:

| Model | Mode | `tabular-nums` Alignment | Restrained Warm/Slate Palette (No Purple Slop) | `:focus-visible` & Submit Lock | Snapshot ID Set Lock on Batch Settlement | Surfaces 2 Key Choices at End of Turn 1 |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: |
| **GPT-6 Astra** (`xhigh`) | Raw | 1 | **0** | 1 | **0** | **0** |
| **GPT-6 Astra** (`xhigh`) | **With Lacuna** | **1** | **1** | **1** | **1** | **1** |
| **GPT-5.6 Sol** (`xhigh`) | Raw | 1 | **0** | **0** | **0** | **0** |
| **GPT-5.6 Sol** (`xhigh`) | **With Lacuna** | **1** | **1** | **1** | **1** | **1** |

In 3-turn real CLI sessions (`codex` with `gpt-6-astra xhigh + multi_agent` and `claude` with `claude-opus-5-5 xhigh`), both CLIs delivered a runnable v1 plus 2 clear schema/retention choices on Turn 1, and passed the Turn 3 concurrent insertion race test (`100 + 50` settled while `30` inserted concurrently) using `BEGIN IMMEDIATE` + snapshot IDs without violating Turn 2's locked rules.

---

## 4. Priority Order & Everyday CLI Controls

Strict rule priority (never overrides your explicit intent):
> **1. Your explicit instructions in the current turn** > **2. Data safety & statistical validity (reversible v1 default)** > **3. Confirmed session decisions** > **4. Stack-conditional rules** > **5. Default UI & craft baseline**

```bash
lacuna help                                      # Bilingual CLI help
lacuna config show                               # Show active persistent settings
lacuna config set lang en                        # Language: auto (default) | en | zh
lacuna config set visual.default warm-editorial  # Pin default UI archetype
lacuna rules list                                # List locked decisions in current session
lacuna rules revoke --id r_1                     # Revoke a locked decision
lacuna rebase <session_id> 1                     # Backup & truncate last 1 drifted .jsonl turn
lacuna self-test                                 # Run cross-platform & bilingual verification
lacuna uninstall                                 # Remove global pre-model hooks cleanly
```

---

## 5. Distribution & Contact

This repository distributes the closed-source single-file CLI bundle of **Lacuna (`UNLICENSED`, all rights reserved)** without internal source trees or raw preset files.

- **Email**: `1061790014@qq.com`
- **WeChat**: `Jyl2012111`
- **GitHub**: [jyl201210-lab](https://github.com/jyl201210-lab)
