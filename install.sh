#!/usr/bin/env bash
# Symlink these dotfiles into place. Safe to re-run: existing links are
# replaced, existing real files/dirs are moved aside to <name>.bak-<date>.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"

link() {
	local src="$DOTFILES/$1" dest="$2"
	mkdir -p "$(dirname "$dest")"
	if [ -L "$dest" ]; then
		rm "$dest"
	elif [ -e "$dest" ]; then
		mv "$dest" "$dest.bak-$STAMP"
		echo "backed up $dest -> $dest.bak-$STAMP"
	fi
	ln -s "$src" "$dest"
	echo "linked $dest -> $src"
}

link nvim "$HOME/.config/nvim"
link tmux "$HOME/.config/tmux"
