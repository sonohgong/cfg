#!/usr/bin/env bash

# Can be used to restore the submodules used in this repo.

git submodule init

# Color support
./add-vim-plugin.sh "base16-shell" https://github.com/chriskempson/base16-shell.git

# Neovim plugins
#
# Colors
./add-vim-plugin.sh "base16" https://github.com/chriskempson/base16-vim.git
./add-vim-plugin.sh "lualine" https://github.com/hoob3rt/lualine.nvim.git
./add-vim-plugin.sh "devicons" https://github.com/kyazdani42/nvim-web-devicons.git
# Basics
./add-vim-plugin.sh "popup" https://github.com/nvim-lua/popup.nvim.git
./add-vim-plugin.sh "plenary" https://github.com/nvim-lua/plenary.nvim.git
./add-vim-plugin.sh "telescope" https://github.com/nvim-telescope/telescope.nvim.git
./add-vim-plugin.sh "surround" https://github.com/tpope/vim-surround.git
./add-vim-plugin.sh "commentary" https://github.com/tpope/vim-commentary.git
# Programming languages
./add-vim-plugin.sh "lspconfig" https://github.com/neovim/nvim-lspconfig.git
./add-vim-plugin.sh "treesitter" https://github.com/nvim-treesitter/nvim-treesitter.git
./add-vim-plugin.sh "neoformat" https://github.com/sbdchd/neoformat.git
# Web development
./add-vim-plugin.sh "graphql" https://github.com/jparise/vim-graphql.git
./add-vim-plugin.sh "styledcomponents" https://github.com/styled-components/vim-styled-components.git
# Completion
./add-vim-plugin.sh "nvim-cmp" url = https://github.com/hrsh7th/nvim-cmp.git
./add-vim-plugin.sh "cmp-buffer" url = https://github.com/hrsh7th/cmp-buffer.git
./add-vim-plugin.sh "cmp-path" url = https://github.com/hrsh7th/cmp-path.git
./add-vim-plugin.sh "cmp-nvim-lsp" url = https://github.com/hrsh7th/cmp-nvim-lsp.git
./add-vim-plugin.sh "lspkind-nvim" url = https://github.com/onsails/lspkind-nvim.git
./add-vim-plugin.sh "cmp-cmdline" url = https://github.com/hrsh7th/cmp-cmdline.git
