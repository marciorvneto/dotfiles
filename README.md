# dotfiles

Neovim and tmux, both in Catppuccin Mocha with transparent backgrounds.

```bash
git clone git@github.com:marciorvneto/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` symlinks `nvim/` → `~/.config/nvim` and `tmux/` → `~/.config/tmux`,
moving any existing config aside first.

## Neovim (0.11+)

- **lazy.nvim**: one spec file per area in `nvim/lua/marcio/plugins/`; versions pinned in `lazy-lock.json`
- **Native LSP**: `vim.lsp.config` in `nvim/lua/marcio/lsp.lua`; Mason-installed servers are enabled automatically
- nvim-cmp + LuaSnip, Telescope, Treesitter, lualine, fugitive

`nvim/ftdetect` and `nvim/syntax` symlink into a local checkout of
[Aktua](https://aktua.dev) at `~/Projetos/aktua`; they are inert without it.

## tmux (3.1+)

Prefix is `M-w`. Truecolor, undercurl and focus events for Neovim; `prefix r` reloads.

## Windows Terminal (WSL)

`windows-terminal/settings.json` is a snapshot, not a symlink: Windows Terminal
rewrites its own file, so copy it by hand in either direction:

```bash
WT="/mnt/c/Users/<WindowsUser>/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"
cp windows-terminal/settings.json "$WT/settings.json"   # restore
cp "$WT/settings.json" windows-terminal/settings.json   # save changes
```

Catppuccin Mocha scheme, solid background for the Kali profile (the default).
Font: [IosevkaTerm Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases),
installed on Windows.
