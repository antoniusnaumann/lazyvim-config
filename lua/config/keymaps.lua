-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local del = vim.keymap.del
local set = vim.keymap.set

local function remap(mode, old, lhs, rhs, opts)
  opts = opts or {}
  del(mode, old)
  set(mode, lhs, rhs, opts)
end

local function swap(mode, lhs, rhs, opts)
  set(mode, lhs, rhs, opts)
  set(mode, rhs, lhs, opts)
end

------------------------------------------------------
-- Colemak -------------------------------------------
------------------------------------------------------
-- Set Colemak movement keys
set({ "n", "v" }, "n", "h", { desc = "Move left" })
swap({ "n", "v" }, "e", "j", { desc = "Move down" })
set({ "n", "v" }, "i", "k", { desc = "Move up" })
swap({ "n", "v" }, "o", "l", { desc = "Move right" })

-- Set h as switch to insert mode
set({ "n", "v" }, "h", "i", { desc = "Insert mode" })
set({ "n", "v" }, "H", "I", { desc = "Insert mode at start of line" })

-- Set k as prev/next
set({ "n", "v" }, "k", "n", { desc = "Next search result" })
set({ "n", "v" }, "K", "N", { desc = "Prev search result" })

-- Remap window navigation to Colemak movements
set("n", "<C-n>", "<C-w>h", { desc = "Go to left window", remap = true })
set("n", "<C-e>", "<C-w>j", { desc = "Go to lower window", remap = true })
set("n", "<C-i>", "<C-w>k", { desc = "Go to upper window", remap = true })
set("n", "<C-o>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Remap line movement
remap("n", "<A-j>", "<A-e>", "<cmd>m .+1<cr>==", { desc = "Move down" })
remap("n", "<A-k>", "<A-i>", "<cmd>m .-2<cr>==", { desc = "Move up" })
remap("i", "<A-j>", "<A-e>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
remap("i", "<A-k>", "<A-i>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
remap("v", "<A-j>", "<A-e>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
remap("v", "<A-k>", "<A-i>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Remap next/prev
set({ "n", "v" }, "<C-k>", "*", { desc = "Next occurrence" })
set({ "n", "v" }, "<C-S-k>", "#", { desc = "Prev occurrence" })

------------------------------------------------------
-- Helix-like Movement -------------------------------
------------------------------------------------------
set({ "n", "v" }, "go", "$", { desc = "Move to end of line" })
set({ "n", "v" }, "ge", "G", { desc = "Move to end of file" })
set({ "n", "v" }, "gi", "gg", { desc = "Move to start of file" })
set({ "n", "v" }, "gn", "0", { desc = "Move to start of line" })
set({ "n", "v" }, "gm", "%", { desc = "Move to matching bracket" })

------------------------------------------------------
-- Window Navigation ---------------------------------
------------------------------------------------------
remap("n", "<leader>ww", "<C-w>w", "<C-W>p", { desc = "Other window", remap = true })
remap("n", "<leader>wd", "<C-w>d", "<C-W>c", { desc = "Delete window", remap = true })
remap("n", "<leader>w-", "<C-w>s", "<C-W>s", { desc = "Split window below", remap = true })
remap("n", "<leader>w|", "<C-w>v", "<C-W>v", { desc = "Split window right", remap = true })

-- Resize window using <ctrl-alt> arrow keys
set("n", "<C-A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
set("n", "<C-A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
set("n", "<C-A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
set("n", "<C-A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

remap("n", "<leader><tab>]", "<leader><tab>e", "<cmd>tabnext<cr>", { desc = "Next Tab" })
remap("n", "<leader><tab>[", "<leader><tab>n", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
