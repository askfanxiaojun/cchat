# cchat

A small tool for searching, previewing, and resuming local Claude Code and Codex sessions.

You only need to remember one command:

```bash
cchat
```

- no arguments: opens the macOS popup UI
- with arguments: runs directly in terminal mode

Chinese docs:

- [中文 README](./README.md)
- [Detailed Chinese guide](./docs/详细安装使用教程.md)

## Features

- Search local Claude Code and Codex sessions by keyword
- List recent sessions
- Filter by date
- Filter by source, such as Claude Code only or Codex only
- Filter by project directory name
- Preview matching snippets
- Copy resume commands from a macOS popup
- Open the correct resume command directly in Terminal

## One-line install

```bash
curl -fsSL https://raw.githubusercontent.com/askfanxiaojun/cchat/main/install.sh | bash
```

After installation, restart your terminal or run:

```bash
source ~/.zshrc
```

If you use `bash`:

```bash
source ~/.bashrc
```

## Quick start

### Popup mode

```bash
cchat
```

### Terminal search

```bash
cchat "keyword"
```

### Recent sessions

```bash
cchat --list
```

### Sessions from a specific date

```bash
cchat --list --date 2026-04-15
```

### Filter by source

```bash
cchat --source claude --list
cchat --source codex --list
cchat "keyword" --source codex
```

### Force popup mode

```bash
cchat --popup
cchat --popup "keyword"
```

## Common commands

```bash
cchat --help
cchat "keyword"
cchat --list
cchat --list --date 2026-04-15
cchat --source claude --list
cchat --source codex --list
cchat "keyword" --date 2026-04-15
cchat "keyword" --source codex
cchat "keyword" --project lark
cchat "keyword" --json
```

## How it works

This project contains two scripts:

- `cchat`: the main user-facing entry point
- `csearch`: the internal search engine

For normal usage, you only need `cchat`.

By default it searches both sources:

- Claude Code: `~/.claude/projects`
- Codex: `~/.codex/sessions`

## Requirements

- Python 3
- Claude Code or Codex installed and used at least once
- At least one local session root exists:
  - `~/.claude/projects`
  - `~/.codex/sessions`

For popup mode only:

- macOS
- `osascript`
- `pbcopy`

## Installed files

By default, the installer puts these into:

```bash
~/.local/bin
```

- `cchat`
- `csearch`

It also adds this PATH line if needed:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Upgrade

Run the installer again:

```bash
curl -fsSL https://raw.githubusercontent.com/askfanxiaojun/cchat/main/install.sh | bash
```

## Uninstall

```bash
rm -f ~/.local/bin/cchat ~/.local/bin/csearch
```

## Repository layout

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
