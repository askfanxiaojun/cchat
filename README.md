# cchat

一个用于搜索、预览和恢复本地 Claude Code 与 Codex 会话记录的小工具。

现在你主要只需要记住一个命令：

```bash
cchat
```

- 无参数：打开 macOS 弹窗界面
- 有参数：直接在终端里搜索或列出聊天记录

英文版入口：

- [English README](./README.en.md)

详细中文教程：

- [详细安装使用教程](./docs/详细安装使用教程.md)

## 它能做什么

- 按关键词同时搜索 Claude Code 和 Codex 本地会话
- 列出最近会话
- 按日期过滤会话
- 按来源过滤，只看 Claude Code 或 Codex
- 按项目目录名过滤
- 预览命中片段
- 在 macOS 弹窗里复制恢复命令
- 自动生成并在 Terminal 中打开正确的恢复命令

## 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/askfanxiaojun/cchat/main/install.sh | bash
```

安装完成后，重新打开终端，或者执行：

```bash
source ~/.zshrc
```

如果你使用的是 `bash`：

```bash
source ~/.bashrc
```

## 快速开始

### 1. 打开弹窗

```bash
cchat
```

### 2. 直接在终端搜索

```bash
cchat "关键词"
```

例如：

```bash
cchat "claude code"
cchat "飞书"
cchat "nano-banana"
```

### 3. 列出最近会话

```bash
cchat --list
```

### 4. 查看某一天的会话

```bash
cchat --list --date 2026-04-15
```

### 4.1 只看 Codex 或 Claude Code

```bash
cchat --source codex --list
cchat --source claude --list
cchat "关键词" --source codex
```

### 5. 强制使用弹窗模式

```bash
cchat --popup
cchat --popup "关键词"
```

## 常用命令

```bash
cchat --help
cchat "关键词"
cchat --list
cchat --list --date 2026-04-15
cchat --source claude --list
cchat --source codex --list
cchat "关键词" --date 2026-04-15
cchat "关键词" --source codex
cchat "关键词" --project lark
cchat "关键词" --json
```

## 工作方式

这套工具实际包含两个脚本：

- `cchat`：用户主入口
- `csearch`：内部搜索引擎

正常使用时，你只需要记住 `cchat`。

默认会同时搜索两个来源：

- Claude Code：`~/.claude/projects`
- Codex：`~/.codex/sessions`

## 依赖要求

- Python 3
- Claude Code 或 Codex 至少安装并使用过一次
- 本地存在以下任意目录：
  - `~/.claude/projects`
  - `~/.codex/sessions`

弹窗模式额外要求：

- macOS
- `osascript`
- `pbcopy`

## 安装后会放到哪里

默认安装到：

```bash
~/.local/bin
```

安装器会放入：

- `cchat`
- `csearch`

如果需要，还会自动把下面这行加到你的 shell 配置文件：

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## 升级

重复执行安装命令即可：

```bash
curl -fsSL https://raw.githubusercontent.com/askfanxiaojun/cchat/main/install.sh | bash
```

## 卸载

```bash
rm -f ~/.local/bin/cchat ~/.local/bin/csearch
```

如果你不再需要，也可以手动从 shell 配置文件里删除这行：

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## 仓库结构

```text
bin/cchat
bin/csearch
docs/详细安装使用教程.md
install.sh
README.md
README.en.md
LICENSE
```

## License

MIT
