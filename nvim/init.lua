function set_tab_size(space)
	vim.opt.tabstop = space
	vim.opt.shiftwidth = space
	vim.opt.softtabstop = space
end

function init_settings()
	vim.cmd("syntax on")
	vim.opt.ignorecase = true
	vim.cmd("filetype plugin on")
	vim.cmd("filetype plugin indent on")
	vim.opt.wildmode = "list:longest,list:full"
	vim.opt.suffixes:prepend("/")
	vim.opt.mouse = "a"
	-- vim.opt.so = 0
	vim.opt.ruler = true
	vim.opt.wrap = false
	vim.opt.clipboard:append("unnamedplus")
	vim.opt.laststatus = 0
	vim.api.nvim_create_user_command("Wq", "wq", {})
	vim.api.nvim_create_user_command("W", "w", {})
	vim.api.nvim_create_user_command("WQ", "wq", {})
	vim.api.nvim_create_user_command("Q", "q", {})
	vim.opt.guicursor = "n-v-c:block"
	vim.g.loaded_matchparen = false
	vim.opt.autochdir = false
	vim.opt.expandtab = true

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		command = [[%s/\s\+$//e]],
	})
end

function init_keymap()
    vim.g.mapleader = " "

	vim.keymap.set("i", "[", "[]<Left>")
	vim.keymap.set("i", "(", "()<Left>")
	vim.keymap.set("i", "{", "{}<Left>")
	vim.keymap.set("i", '"', '""<Left>')
	vim.keymap.set("n", "<A-r>", ":CocCommand document.renameCurrentWord<CR>")

	vim.keymap.set("n", "<PageDown>", "5jzz")
	vim.keymap.set("n", "<PageUp>", "5kzz")
	vim.keymap.set("n", "<S-Tab>", ":bn<CR>", { silent = true })
	vim.keymap.set("n", "<space>k", ":bd<CR>", { silent = true })
	vim.keymap.set("n", "gg", "gg0")
	vim.keymap.set("n", "G", "G0")
	vim.keymap.set("n", "Y", '"Ayy')

	-- search and replace
	vim.keymap.set("n", "S", ":%s//g<Left><Left>", { silent = false })
	-- vim.keymap.set("n", "C-h", ":%s//g<Left><Left>", { silent = false })
	vim.keymap.set("v", "S", ":s//g<Left><Left>", { silent = false })

	-- Clear highlights
	vim.keymap.set("n", "<Esc>", ":noh<CR><C-l>", { silent = true })

	-- Resizing windows
	vim.keymap.set("n", "<A-Left>", ":vertical resize +3<CR>", { silent = true })
	vim.keymap.set("n", "<A-Right>", ":vertical resize -3<CR>", { silent = true })
	vim.keymap.set("n", "<A-Up>", ":resize +3<CR>", { silent = true })
	vim.keymap.set("n", "<A-Down>", ":resize -3<CR>", { silent = true })

	-- Disable unwanted keys
	vim.keymap.set("n", "<CR>", "<Nop>")
	vim.keymap.set("n", "<S-l>", "<Nop>")
	vim.keymap.set("n", "<S-h>", "<Nop>")
	vim.keymap.set("n", "<S-k>", "<Nop>")

    -- nnn
	vim.keymap.set("n", "<C-a>", ":NnnExplorer<CR>", { silent = true })

	-- File explorer / Telescope
	-- vim.keymap.set("n", "<space>f", ":Telescope find_files<CR>", { silent = true })
	vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { silent = true })
	-- vim.keymap.set("n", "<space>r", ":Rexplore<CR>", { silent = true })
	-- vim.keymap.set("n", "<space>f", ":Ex<CR>", { silent = true })
	-- vim.keymap.set("n", "<space>f", ":Telescope file_browser<CR>", { silent = true })

	-- Move lines in visual mode
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

	-- Keep cursor in place with J
	vim.keymap.set("n", "J", "mzJ`z")

	vim.keymap.set("n", "n", "nzzzv")
	vim.keymap.set("n", "N", "Nzzzv")
	vim.g.compile_command = "./build.sh"
	vim.g.run_command = "./exe &"

	vim.keymap.set("n", "<space><CR>", ":!", { silent = false })
	vim.keymap.set("n", "<space>c", ':let g:compile_command=""<left>', { silent = false })
	vim.keymap.set("n", "<space>r", ':let g:run_command=""<left>', { silent = false })

	-- vim.keymap.set("n", "<A-r>", function()
	-- 	vim.cmd("silent !" .. vim.g.run_command)
	-- end, { silent = true })

	vim.keymap.set("n", "<A-c>", function()
		vim.cmd("cexpr system('" .. vim.g.compile_command .. "')")
		vim.cmd("copen")
	end, { silent = true })

	vim.keymap.set("n", "<A-m>", function()
		vim.cmd("silent !" .. vim.g.compile_command .. " && " .. vim.g.run_command)
	end, { silent = true })

	-- Quickfix list navigation (commented out)
	vim.keymap.set("n", "<A-]>", ":cnext<CR>", { silent = true })
	vim.keymap.set("n", "<A-[>", ":cprev<CR>", { silent = true })
end

function init_colorscheme()
	vim.cmd.colorscheme("gruvbox")
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "#212121" })
	-- vim.cmd.colorscheme("terafox")
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "#152528" })
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
end

function init_plugins()
	local Plug = vim.fn["plug#"]
	vim.call("plug#begin", "~/.local/share/nvim/plugged")
	Plug("ap/vim-css-color")
	Plug("neoclide/coc.nvim", { branch = "release" })
	Plug("pacha/vem-tabline")
	Plug("tpope/vim-commentary")
	Plug("bfrg/vim-cpp-modern")
	Plug("whiteapolo/mygruvbox")
	Plug("nvim-lua/plenary.nvim")
	Plug("nvim-telescope/telescope.nvim")
	Plug("nvim-telescope/telescope-file-browser.nvim")
	Plug("desdic/telescope-rooter.nvim")
	Plug("maxmx03/solarized.nvim")
    Plug("luukvbaal/nnn.nvim")
	vim.call("plug#end")
end

function init_neovide()
	vim.opt.guifont = "IosevkaTerm Nerd Font Mono:h18"
end

function show_relative_numbers()
	vim.opt.relativenumber = true
	vim.opt.number = true
end

function init()
	init_plugins()
	init_settings()
	init_keymap()
	set_tab_size(4)
	show_relative_numbers()
	init_colorscheme()
	init_neovide()
	require("coc")
    require("nnn").setup()
end

init()
