local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim"

  -- LSP

  -- Completion
  use {"hrsh7th/nvim-cmp"}
  use {"hrsh7th/cmp-buffer"}
  use {"hrsh7th/cmp-path"}
  use {"hrsh7th/cmp-cmdline"}
  use {"saadparwaiz1/cmp_luasnip"}

  -- Snippet
  use {"L3MON4D3/LuaSnip"}
  use {"rafamadriz/friendly-snippets"}

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "kylechui/nvim-surround"
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
  }

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Note Taking

  -- Color

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Utility
  use "lewis6991/impatient.nvim"

  -- Registers

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Debugging

  -- Tabline
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  -- Startup
  use "goolord/alpha-nvim"

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Comment
  use "numToStr/Comment.nvim"

  -- Terminal

  -- Project
  use "ahmedkhalf/project.nvim"

  -- Session

  -- Quickfix

  -- Code Runner

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Editing Support
  use "windwp/nvim-autopairs"
  
  -- Motion

  -- Keybinding

  -- Java

  -- Typescript 

  -- Markdown

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
