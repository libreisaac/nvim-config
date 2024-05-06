local set_options = {
    autochdir = false,                                                     -- Automatically change working directory to focused file
    autoindent = true,                                                     -- Automatically indent newlines to current indentation level
    background = "dark",                                                   -- Set the colour palette of nvim; options are "dark" and "light"
    backup = false,                                                        -- Create backups when overwriting files
    breakindent = true,                                                    -- Wrapped lines will maintain their indentation
    clipboard = "unnamedplus",                                             -- Bi-directional system clipboard access
    cmdheight = 2,                                                         -- Character height of the nvim command line
    cmdwinheight = 10,                                                     -- Character height of the dedicated command line window
    completeopt = { "menu", "noselect" },                                  -- Autocompletion options
    conceallevel = 0,                                                      -- Don't conceal text
    confirm = true,                                                        -- Prompt for confirmation before performing potentially destructive actions like exiting a buffer with unwritten changes
    copyindent = true,                                                     -- Match indentation method of current line when automatically indenting new line
    cursorline = true,                                                     -- Highlight the line the cursor is on
    expandtab = true,                                                      -- Use spaces for indentation
    fixendofline = true,                                                   -- Ensure files end with newline
    guicursor = "i-c-r:blinkwait500-blinkoff400-blinkon250,i-c:ver25",     -- Blinking line cursor
    history = 100,                                                         -- Remember 100 commands in history (default is 10,000)
    hlsearch = true,                                                       -- Highlight all matches when searching
    ignorecase = true,                                                     -- Ignore case when searching by default; can override with `\c` or `\C`
    infercase = true,                                                      -- Predict desired casing when performing an autocomplete
    mouse = "a",                                                           -- Allow using the mouse in all modes
    mousefocus = false,                                                    -- Change focus to the buffer the mouse is currently hovered over
    mousehide = true,                                                       -- Hide the mouse when typing; moving the mouse will show it again
    mousescroll = "ver:3,hor:6",                                           -- Number of cells to scroll by when using the mouse to scroll
    mousetime = 300,                                                       -- Maximum allowable time between consecutive clicks before a multi-click is no longer used (eg: double click)
    number = true,                                                         -- Show line numbers
    numberwidth = 4,                                                       -- Set the width of the line number column
    preserveindent = true,                                                 -- When changing the indentation of a line, maintain the current indentation structure (tabs vs spaces) as best as possible
    pumblend = 10,                                                         -- Pop up menu transparency; 0 is opaque, 100 is transparent
    pumheight = 10,                                                        -- Maximum number of rows to show in pop up menu; 0 will use as much space as possible
    relativenumber = true,                                                 -- Display line numbers relative to the cursor; useful for various commands
    pumwidth = 30,                                                         -- Number of columns to show in the pop up menu; if larger than available space, the menu will be nudged left to allow for it to be displayed
    ruler = true,                                                          -- Display cursor position
    scrollback = 1000,                                                     -- Terminal line scrollback availability (default is 10,000)
    scrolloff = 5,                                                         -- Scroll with the cursor to ensure there's always at least X lines on either side of it
    shiftround = true,                                                     -- Align indentation to shift width
    shiftwidth = 4,                                                        -- Spaces per indentation level
    showbreak = ">",                                                       -- Visible wrap indicators for lines
    showmode = false,                                                      -- Don't write mode into command line
    showtabline = 2,                                                       -- Tab line display option; 0 is never, 1 is when there are multiple tabs, 2 is always
    sidescrolloff = 5,                                                     -- Scroll with the cursor to ensure there's always at least X columns on either side of it
    signcolumn = "yes",                                                    -- Always show the sign column
    smartcase = true,                                                      -- Smart casing for searches
    smartindent = true,                                                    -- Attempt to indent newlines correctly
    smarttab = true,                                                       -- Improved indentation editing
    spell = false,                                                         -- Spellcheck
    spelllang = "en",                                                      -- Language(s) to use for spellcheck
    splitbelow = true,                                                     -- Horizontal screen splits place the new window below the current one
    splitkeep = "cursor",                                                  -- Whether to keep the `cursor`, `text` or `topline` at the same relative position on the display when splitting windows
    splitright = true,                                                     -- Vertical screen splits place the new window to the right of the current one
    termguicolors = true,                                                  -- Enable 24-bit RGB colours
    timeoutlen = 300,                                                      -- Timeout in ms for a mapped sequence compleion (default 1,000)
    title = true,                                                          -- Set window title to value of title string or filename
    undolevels = 1000,                                                     -- Undo buffer length (default 1,000)
    updatetime = 500,                                                      -- Milliseconds before swap is flushed (default 4,000)
    wrap = false,                                                          -- Don't wrap lines; use horizontal scrolling
}

for k, v in pairs(set_options) do
    vim.opt[k] = v
end

local append_options = {
    iskeyword = "-",           -- Treat `-` as a keyword for command purposes
    shortmess = "c",           -- Don't show messages for autocompletion
    whichwrap = "<,>,[,],h,l", -- Allow horizontal scrolling keys to wrap to next line
}

for k, v in pairs(append_options) do
    vim.opt[k]:append(v)
end
