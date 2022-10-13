local options = {
    number = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,
    so = 5,
    wildmenu = true,
    lazyredraw = true,
    splitbelow = true,
    splitright = true,
    syntax = "on",
    termguicolors = true,
    showcmd = true,
    --spell = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
