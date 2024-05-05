# Installation on Gentoo

Edit `/etc/portage/package.use`, adding:
```
\# Neovim (IDE)
app-editors/neovim -lua_single_target_5-4 lua_single_target5-1 python
dev-lua/luv -lua_single_target_5-4 lua_single_target5-1
```
Note: The `-` USE flag assumes a Gentoo environment built via [this guide](https://github.com/libreisaac/gentoo-installation-guide-resources); you may not need the `lua` target flags, or may need to subtract a different one depending on the `LUA_SINGLE_TARGET` in your `make.conf`.

Run `emerge --ask app-editors/neovim app-shells/fzf` to compile and install neovim and fzf, which is a fuzzy finder application you can run from the terminal, which we'll be making heavy use of inside neovim.

Move to your `.config` directory with `cd ~/.config`, then clone this repository into a folder named `nvim`  with `git clone --recurse-submodules https://github.com/libreisaac/nvim-config nvim`.

Now `cd nvim`, and run `git tag` to list available versions of this config. Pick the latest (or any other version you like), and run `git checkout [tag]` (eg: `git checkout 0.0.1`) to check out that version.

In the future, you can run `git pull`, `git tag`, and `git checkout X` in this directory to check for, and update to, new versions. `git diff 0.0.1 0.0.2` would show you all the changes between tags `0.0.1` and `0.0.2`.

Now run `nvim`, and type `:Tutor`. Read through the tutorial, and follow along. All of the custom keybindings included in this configuration are beind the `Leader` key, which is set to the space bar.

Once you've finished the nvim tutorial, run `:edit ./init.lua` to open the `init.lua` file. The `require` lines import different `lua` files; you can check each of them to see what they do.

First, we `require fzf`, which loads the `fzf` plugin which is a submodule of this repository. Then we `require` each of the custom configuration files included in this repository.

Run `:cd lua/ide`, then type `:edit ./`, and hit tab. You should see a list of files in the `ide` repository. You can hit `tab` to cycle through them, then `enter` to complete the command with the currently selected option, or the up or down arrow key to write the option to the command line, where you can hit tab again, to select a directory and cycle through that.

Check what each of the files is doing; the code is fairly self-explanatory, even a non-programmer should be able to work out what's going on, but if you've got any questions, don't hesistate to ask for clarification.

If, while in normal mode (which is accessed with `ESC`), you hit the spacebar, then type `rt`, the line numbers in the currently focused buffer will toggle between relative and absolute modes. Absolute mode displays the actual line number, while relative mode displays the line number relative to your cursor, which is useful for various nvim commands.

Space then `f` will try to detect what kind of workspace you're in, based on the contents of the working directory, and run some format commands like `cargo fmt` to format any relevant files in the current working directory, and its children.

TODO: Fuzzy Find Demo

Finally, you may want to modify your `.config/sway/config` file, and add `xkb_options caps:escape` to your `input *` selector, where your keyboard layout is set, to override the `CapsLock` key's behaviour to `ESC`. This will change the behaviour system-wide, but `CapsLock` is a pretty useless key in my opinion. `ESC` is used fairly frequently, in neovim, and all over your Linux system in general, and making it more accessible is a great idea. If you _really_ want access to `CapsLock`, you could always map it to `ESC`! 
