#!/usr/bin/env bash
#
# bootstrap.sh — symlink the dotfiles in this repo into their target locations.
#   Run from anywhere; paths resolve relative to this script.
#
# usage:
#   ./bootstrap.sh            apply symlinks (backs up anything in the way)
#   ./bootstrap.sh --dry-run  show what would happen, change nothing
#   ./bootstrap.sh --force    overwrite existing targets WITHOUT backup
#
set -euo pipefail

DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"

DRY=0; FORCE=0
for a in "$@"; do
  case "$a" in
    --dry-run) DRY=1 ;;
    --force)   FORCE=1 ;;
    *) echo "unknown option: $a" >&2; exit 2 ;;
  esac
done

# src (relative to DOTDIR)  ->  dest (absolute)
# powertoys/ is Windows-only and intentionally skipped.
links=(
  ".ideavimrc|$HOME/.ideavimrc"
  "nvim/init.lua|$HOME/.config/nvim/init.lua"
  "jgit/config|$HOME/.config/jgit/config"
  "configstore/update-notifier-@google/gemini-cli.json|$HOME/.config/configstore/update-notifier-@google/gemini-cli.json"
  "claude-sandbox/claude-box|$HOME/.local/bin/claude-box"
)

run() { if [ "$DRY" = 1 ]; then echo "  [dry] $*"; else eval "$@"; fi; }

for entry in "${links[@]}"; do
  src="$DOTDIR/${entry%%|*}"
  dest="${entry##*|}"

  if [ ! -e "$src" ]; then
    echo "skip  $dest  (source missing: $src)"
    continue
  fi

  # already linked correctly?
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok    $dest  (already linked)"
    continue
  fi

  run "mkdir -p \"$(dirname "$dest")\""

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "$FORCE" = 1 ]; then
      run "rm -rf \"$dest\""
    else
      echo "backup $dest -> $dest.bak.$STAMP"
      run "mv \"$dest\" \"$dest.bak.$STAMP\""
    fi
  fi

  echo "link  $dest -> $src"
  run "ln -s \"$src\" \"$dest\""
done

echo
echo "done.${DRY:+ (dry-run — nothing changed)}"
echo "note: init-keyboard.sh is a one-time keyboard remap; run it manually if you want it:"
echo "      bash \"$DOTDIR/init-keyboard.sh\""
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "note: \$HOME/.local/bin is not in PATH — add it so 'claude-box' resolves:"
     echo "      export PATH=\"\$HOME/.local/bin:\$PATH\"" ;;
esac
