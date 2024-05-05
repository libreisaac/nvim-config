# Neovim Configuration

This repository contains a Neovim configuration with my own personal preferences.

The goal is to configure Neovim into a full-featured IDE for programming languages (and other structured files) I use frequently:
- Rust (& toml)
- .NET (& xml)
- Lua
- Python
- JavaScript (& json)
- HTML
- CSS
- Markdown

## Configuration Files
- `./init.lua` whose job it is to import all the other lua configuration
- `./lua/` which contains all of the lua configuration files and plugins
    - `./lua/ide/` which contains all of the lua configuration files
        - `./lua/ide/styles.lua` visual style tweaks
        - `./lua/ide/options.lua` configure all core nvim options
        - `./lua/ide/keymaps.lua` all globally applied keybindings (including autoformat logic)
        - `./lua/ide/autocmds.lua` an index for autocommands which are broken up inside the directory of the same name
        - `./lua/ide/autocmds/terminal.lua` autocommands run when entering a terminal

## Plugins
No plugin manager is used; instead, plugins' git repositores are cloned as submodules inside the `lua` folder, and symlinks (`ln -s ./whatever/the/path/is.lua ./is.lua`) are used for necessary files and directories.

## Installation
To install this nvim configuration, simply install nvim, then run `cd ~/.config`, and `git clone --recurse-submodules https://github.com/libreisaac/nvim-config nvim`, to `clone` the `nvim-config` github repository under the `libreisaac` account into the `nvim` directory. The `--recurse-submodules` argument also clones the submodules, which is necessary for the plugins included in the configuration.

Note: the clone will fail if you already have a non-empty `~/.config/nvim` directory; rename your current config to `nvim.old/` or similar and manually port over any configuration you want to keep.

It's strongly recommended you fork the repository and maintain your own changes via git too.

A more in-depth guide can be found [here](./gentoo-guide.md), but note that it's written specifically for people who are using a Gentoo environment based on my Gentoo installation guide; others may find some utility in reading it, and skipping over the `Portage` and `Sway` bits.
