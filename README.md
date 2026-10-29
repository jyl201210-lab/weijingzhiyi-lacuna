<div align="right">
  <strong>中文</strong> &nbsp;|&nbsp; <a href="./README.en.md">English</a>
</div>

# 未竟之意 · Lacuna `v2.4`

**在模型开口之前，先把工程与安全底线垫稳，把真正的决定权留给人。**

**未竟之意（Lacuna）** 是挂载在 **Codex（CLI & 桌面端 App）**、**Claude Code** 与 **Antigravity** 前面的本地**模型前置引擎**（Pre-Model Context & Decision Engine），原生支持 **Windows / macOS / Linux**，并按输入语言**全自动切换中英文**。

![未竟之意 Lacuna v2.4 预览](./assets/screenshots/poster-preview.png)

---

## 一行命令安装（Windows / macOS / Linux）

前置要求：本机已安装 `Node.js >= 20`（桌面端用户可直接复制下方口令让内置 AI 代装）。

### 方式 1：跨平台通用（推荐，PowerShell / CMD / 终端均可用）
```bash
npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init
```

### 方式 2：系统原生脚本
- **Windows (PowerShell)**：
  ```powershell
  irm https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.ps1 | iex
  ```
- **macOS / Linux / WSL**：
  ```bash
  curl -fsSL https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/i.sh | sh
  ```

### 方式 3：Codex 桌面端 App（Windows / macOS）直接让 AI 帮你装
如果你用的是桌面版 Codex App，直接把下面这句话发给对话框里的 AI，装完**彻底退出并重启一次 Codex App**（若弹窗询问本地 Hook 信任，点一次 **Trust / Allow**）即可：

```text
Please check if Node.js (>=20) is installed (install LTS if missing), then run `npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init` and verify with `lacuna self-test`.
```

---

## 它现在具体做什么？

平时你完全不用改说话习惯，模型自己也感知不到额外工具负担——Lacuna 在提示词发往模型前的 **15 毫秒内纯本地介入**（0 额外 API 调用）：

1. **按场景自动补齐工程与科研底线**
   - **前端与交互**：自动要求金额/编号开启 `tabular-nums` 等宽对齐、异步按钮防连点加载态、补齐空状态/错态与 `:focus-visible` 键盘焦点环。
   - **数据库与资金安全**：SQLite 写事务显式 `BEGIN IMMEDIATE` + `busy_timeout` 防并发锁死；货币统一按最小整数单位（分 / cents）计算，杜绝浮点精度误差。
   - **单细胞与统计质控（`scRNA-seq` 等）**：拒绝一刀切硬编码 `percent.mt < 5%`，自动按样本批次计算中位数与 `MAD` 动态阈值，先给过滤前后样本量对比。
2. **未拍板需求：先交可逆第一版 + 2 道大白话选择题**
   - 当数据保留策略或冲突处理还没定死时，既不会一口气抛十几个问题卡住你，也不会擅自做物理删库；先交出带状态标记或 `--dry-run` 预览的可运行第一版，并在结尾只列最多 **2 个关键选择题**请你拍板。
3. **跨轮决定锁定 + 跑偏物理截断（`rebase`）**
   - 自动识别并锁定你在对话中拍板的规矩（完整保留“不要物理删除”等否定语义，排除反问句误判）；改主意时自动覆盖旧决定；模型若在某轮跑偏，一行 `lacuna rebase` 自动备份并物理截断回退 `.jsonl` 会话记录。
4. **中英双语全自动隔离**
   - 默认 `lang: auto`：中文提问注入中文底线；纯英文提问自动切换为 **100% 地道纯英文底线与指令（零中文字符混入）**；日常翻译或非技术闲聊完全不触发注入。

---

## 四大主力模型同口径实证

使用完全相同的简短模糊提示词与验证断言，在挂载未竟之意前置引擎后实测通过：

| 验证场景 | 裸提示词常见问题 | 挂载未竟之意后的实测结果 | 覆盖模型 |
| :--- | :--- | :--- | :--- |
| **UI 与账单面板** | 数字跳动不对齐、表单可重复提交、漏写空错态 | 自动启用 `tabular-nums`、防连点锁、完整空错态与焦点环 | GPT-6 Astra / GPT-5.6 Sol / Claude Opus 5.5 / Claude Fable 5.1 |
| **SQLite 与结算写库** | 浮点数算钱精度漂移、并发报 `SQLITE_BUSY`、擅自硬删数据 | 整数分存储、`BEGIN IMMEDIATE` 写锁、默认可逆状态标记 | 4 / 4 全部通过 |
| **单细胞 `scRNA-seq` 质控** | 生搬硬套 `5%` 阈值误杀高代谢活性细胞 | 按批次计算中位数 + `MAD` 自适应阈值并输出过滤预览 | 4 / 4 全部通过 |

---

## 常用本地管理命令

安装后默认静默生效，随时可通过 `lacuna` 命令调整设置：

```bash
lacuna help                                  # 查看中英双语帮助说明
lacuna config show                           # 查看当前生效的持久化设置
lacuna config set lang en                    # 语言模式：auto（默认自动识别）| zh | en
lacuna config set visual.default warm-editorial  # 固定默认 UI 视觉气质
lacuna rules list                            # 查看当前会话已锁定的决定
lacuna rules revoke --id r_1                 # 撤销某条历史决定
lacuna rebase <session_id> 1                 # 备份并物理截断最近 1 轮走偏对话
lacuna self-test                             # 运行跨平台与中英双语自检套件
lacuna uninstall                             # 一键卸载全局前置 Hook
```

---

## 仓库说明与联系方式

本仓库为 **未竟之意（Lacuna）** 的对外发行与产品说明仓，提供混淆封装后的闭源单文件 CLI 分发包（协议：`UNLICENSED`，保留一切权利），不包含内部完整开发源码与明文预设库。

欢迎反馈使用体验或交流合作：
- **Email**：`1061790014@qq.com`
- **WeChat**：`Jyl2012111`
- **GitHub**：[jyl201210-lab](https://github.com/jyl201210-lab)
