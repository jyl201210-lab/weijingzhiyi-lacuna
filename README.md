<div align="right">
  <strong>中文</strong> &nbsp;·&nbsp; <a href="./README.en.md">English</a>
</div>

![未竟之意 Lacuna](./assets/screenshots/poster-preview.png)

## 安装

需要 `Node.js >= 20`（Windows / macOS / Linux）：

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

Codex 桌面端 App：把 `npm i -g jyl201210-lab/weijingzhiyi-lacuna && lacuna init` 发给应用内对话自动安装，装完退出并重启一次 App。

## 作用

- **前置预设**：发给模型前按任务附加前端排版、数据库事务与统计检验基线；当轮显式指令优先，中英文自动识别。
- **会话约束**：自动记录当前会话已定的约束（表结构、软删除等），后续轮次持续附带，可用 `lacuna rules` 管理。
- **记录回退**：`lacuna rebase <session_id> [turns]` 自动备份并截断 Codex / Claude 本地 `.jsonl` 最后 N 轮对话。

## 命令

```bash
lacuna config show                 # 查看当前配置
lacuna config set lang auto        # 语言：auto（默认）| zh | en
lacuna rules list                  # 查看当前会话约束（支持 add / revoke / clear）
lacuna rebase <session_id> [turns] # 备份并截断最后 N 轮 .jsonl 对话
lacuna uninstall                   # 卸载前置 Hook
```

## 联系

闭源单文件 CLI 发行版（`UNLICENSED`） · `1061790014@qq.com` · WeChat `Jyl2012111`
