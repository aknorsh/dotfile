vim.g.mapleader = " "
vim.opt.relativenumber = true -- 相対行番号を表示（エンジニアに人気）
vim.opt.expandtab = true      -- タブをスペースに変換
vim.opt.smartindent = true    -- スマートインデント
vim.opt.cursorline = true     -- カーソル行をハイライト
vim.opt.ignorecase = true     -- 検索時に大文字小文字を無視
vim.opt.smartcase = true      -- 大文字を含めて検索したら、大文字小文字を区別する
vim.opt.incsearch = true      -- 入力中からマッチする場所を表示
vim.opt.wrap = false          -- 長い行を折り返さない
vim.opt.mouse = 'a'

-- following settings are disabled on vscode
if not vim.g.vscode then
  vim.opt.number = true         -- 行番号を表示
  vim.opt.shiftwidth = 2        -- インデント幅
end

-- VSCode でのみ有効な設定
if vim.g.vscode then
  -- <leader> + e でファイルツリー開閉
  vim.keymap.set('n', '<leader>e', [[<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>]])
end

-- ### key mappings

-- zz -> z
vim.keymap.set('n', 'z', 'zz')

-- Jump left or right
vim.keymap.set({'n', 'v'}, '<C-h>', '^')
vim.keymap.set({'n', 'v'}, '<C-l>', '$')
-- Scroll half a page
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')

-- ### plugins

-- lazy.nvim
require("config.lazy")

-- dial.nvim
vim.keymap.set("n", "<C-a>", function()
    require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
    require("dial.map").manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gnormal")
end)
vim.keymap.set("x", "<C-a>", function()
    require("dial.map").manipulate("increment", "visual")
end)
vim.keymap.set("x", "<C-x>", function()
    require("dial.map").manipulate("decrement", "visual")
end)
vim.keymap.set("x", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gvisual")
end)
vim.keymap.set("x", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gvisual")
end)

local augend = require("dial.augend")
require("dial.config").augends:register_group{
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.date.alias["%Y-%m-%d"],
    augend.date.alias["%m/%d"],
    augend.date.alias["%H:%M"],
    augend.constant.alias.ja_weekday_full,
    augend.constant.alias.bool	
  },
}
