# cchat

Search and resume local Claude Code sessions with one command.

`cchat` gives you two ways to work:

- terminal mode: search, list, filter, and output JSON
- macOS popup mode: click to search, preview, copy resume commands, or open in Terminal

Behind the scenes it uses a bundled internal engine named `csearch`, but for normal use you only need to remember `cchat`.

## Features

- Search Claude Code session history by keyword
- List recent sessions
- Filter sessions by date
- Filter sessions by project directory name
- Preview matching snippets
- Copy or run `claude --resume <session-id>` from a popup on macOS
- Install with one command

## Quick install

```bash
curl -fsSL https://raw.githubusercontent.com/askfanxiaojun/cchat/main/install.sh | bash
```

After installation, restart your terminal or run:

```bash
source ~/.zshrc
```

If you use `bash`, run:

```bash
source ~/.bashrc
```

## Full guide

For a detailed Chinese tutorial, including fresh-machine installation and troubleshooting:

- `docs/详细安装使用教程.md`

## Requirements

- Python 3
- Claude Code installed
- Local Claude Code session files under `~/.claude/projects`

For popup mode only:

- macOS
- `osascript`
- `pbcopy`

## Usage

### Popup mode

```bash
cchat
```

Or force popup mode:

```bash
cchat --popup
cchat --popup "keyword"
```

### Terminal mode

```bash
cchat "keyword"
cchat --list
cchat --list --date 2026-04-15
cchat "claude code" --date 2026-04-15
cchat "keyword" --project lark
cchat "keyword" --json
```

### Help

```bash
cchat --help
```

## What gets installed

The installer places these files into `~/.local/bin` by default:

- `cchat`
- `csearch`

It also adds this PATH line to your shell config if needed:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Upgrade

Run the same install command again:

```bash
curl -fsSL https://raw.githubusercontent.com/askfanxiaojun/cchat/main/install.sh | bash
```

## Uninstall

```bash
rm -f ~/.local/bin/cchat ~/.local/bin/csearch
```

Then optionally remove the PATH line from your shell config:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## How it works

- `cchat` is the main user-facing command
- `csearch` is the bundled internal search engine
- both read local Claude Code JSONL transcripts from `~/.claude/projects`

## Repository layout

```text
bin/cchat
bin/csearch
install.sh
README.md
LICENSE
```

## License

MIT
