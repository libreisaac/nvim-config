# Nvim Configuration

This repository contains an nvim configuration with my own personal preferences.

The goal is to configure Vim into a full-featured IDE for programming languages (and other structured files) I use frequently:
- Rust (& toml)
- .NET (& xml)
- Lua
- Python
- JavaScript (& json)
- HTML
- CSS
- Markdown

It's a work in progress, but will eventually contain:

## Configuration Files
- `./init.lua` whose job it is to import all the other lua configuration
- `./lua/` which contains all of the lua configuration files and plugins
    - `./lua/ide/` which contains all of the lua configuration files
        - `./lua/ide/styles.lua` visual style tweaks
        - `./lua/ide/options.lua` configure all core nvim options
        - `./lua/ide/keymaps.lua` all globally applied keybindings (including autoformat logic)
        - `./lua/ide/autocmds.lua` an index for autocommands which are broken up in the directory of the same name`
        - `./lua/ide/autocmds/terminal.lua` autocommands run when entering a terminal

## Plugins
No plugin manager is used; instead, plugins' git repositores are cloned as submodules, and required symlinks are created manually.

### Nvim-Tree
A plugin for a directory tree displayed in the sidebar, bound by default to `<Leader>e`.
- `./lua/nvim-tree-git` cloned git repository with desired version checked out for the nvim-tree plugin
- `./lua/nvim-tree` synlink to the relevant nvim-tree plugin contents
- `./lua/nvim-tree.lua` symlink to the relevant nvim-tree plugin root file

## Installation
To install this nvim configuration, simply install nvim, then run `cd ~/.config`, and `git clone https://github.com/libreisaac/nvim-config nvim`, to `clone` the `nvim-config` github repository under the `libreisaac` account into the `nvim` directory.

Note: the clone will fail if you already have a non-empty `~/.config/nvim` directory; rename your current config to `nvim.old/` or similar and manually port over any configuration you want to keep.

It's strongly recommended you fork the repository and maintain your own changes via git too.
