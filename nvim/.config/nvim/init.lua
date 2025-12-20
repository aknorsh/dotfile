vim.g.mapleader = " "
vim.opt.relativenumber = true -- 相対行番号を表示（エンジニアに人気）
vim.opt.expandtab = true      -- タブをスペースに変換
vim.opt.smartindent = true    -- スマートインデント
vim.opt.cursorline = true     -- カーソル行をハイライト



-- following settings are disabled on vscode
if not vim.g.vscode then
  vim.opt.number = true         -- 行番号を表示
  vim.opt.shiftwidth = 2        -- インデント幅
end

-- key mappings

-- zz -> z
vim.keymap.set('n', 'z', 'zz')

-- Jump left or right
vim.keymap.set({'n', 'v'}, '<C-h>', '^')
vim.keymap.set({'n', 'v'}, '<C-l>', '$')
-- Scroll half a page
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')
