#!/usr/bin/env bash
set -euo pipefail

REPO_RAW_BASE="${REPO_RAW_BASE:-https://raw.githubusercontent.com/askfanxiaojun/cchat/main}"
INSTALL_DIR="${CCHAT_INSTALL_DIR:-$HOME/.local/bin}"
TMP_DIR=""

log() {
  printf '%s\n' "$*"
}

fail() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "missing required command: $1"
}

pick_shell_rc() {
  if [ -n "${ZSH_VERSION:-}" ] || [ "${SHELL:-}" = "/bin/zsh" ] || [ "${SHELL:-}" = "/usr/bin/zsh" ]; then
    printf '%s\n' "$HOME/.zshrc"
    return
  fi
  if [ -n "${BASH_VERSION:-}" ] || [ "${SHELL:-}" = "/bin/bash" ] || [ "${SHELL:-}" = "/usr/bin/bash" ]; then
    if [ -f "$HOME/.bashrc" ]; then
      printf '%s\n' "$HOME/.bashrc"
    else
      printf '%s\n' "$HOME/.bash_profile"
    fi
    return
  fi
  printf '%s\n' "$HOME/.profile"
}

ensure_path_line() {
  local rc_file="$1"
  local path_line='export PATH="$HOME/.local/bin:$PATH"'

  mkdir -p "$(dirname "$rc_file")"
  touch "$rc_file"
  if ! grep -Fqx "$path_line" "$rc_file"; then
    printf '\n%s\n' "$path_line" >>"$rc_file"
    log "Added PATH setup to $rc_file"
  else
    log "PATH already configured in $rc_file"
  fi
}

download_file() {
  local url="$1"
  local out="$2"
  curl -fsSL "$url" -o "$out"
}

main() {
  need_cmd curl
  need_cmd python3

  local rc_file
  rc_file="$(pick_shell_rc)"

  mkdir -p "$INSTALL_DIR"
  TMP_DIR="$(mktemp -d)"
  trap 'rm -rf "${TMP_DIR:-}"' EXIT

  log "Installing cchat into $INSTALL_DIR"

  download_file "$REPO_RAW_BASE/bin/cchat" "$TMP_DIR/cchat"
  download_file "$REPO_RAW_BASE/bin/csearch" "$TMP_DIR/csearch"

  install -m 0755 "$TMP_DIR/cchat" "$INSTALL_DIR/cchat"
  install -m 0755 "$TMP_DIR/csearch" "$INSTALL_DIR/csearch"

  ensure_path_line "$rc_file"

  if [ "$(uname -s)" != "Darwin" ]; then
    log "Note: popup mode is macOS-only. Terminal mode still works."
  fi

  if [ ! -d "$HOME/.claude/projects" ]; then
    log "Note: ~/.claude/projects does not exist yet."
    log "Use Claude Code once on this machine before searching local sessions."
  fi

  if command -v "$INSTALL_DIR/cchat" >/dev/null 2>&1; then
    python3 -m py_compile "$INSTALL_DIR/cchat" "$INSTALL_DIR/csearch"
  fi

  log
  log "Install complete."
  log "Main command:"
  log "  cchat"
  log
  log "Try:"
  log "  cchat --help"
  log "  cchat --list"
  log "  cchat \"keyword\""
  log
  log "If your current shell cannot find cchat yet, run:"
  log "  source \"$rc_file\""
}

main "$@"
