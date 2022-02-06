#!/usr/bin/env bash

# Can be used to restore the submodules used in this repo.

git submodule init

# Color support
git submodule add --name "base16-shell" https://github.com/chriskempson/base16-shell.git base16-shell

# Neovim plugins
#
# Colors
git submodule add --name "base16" https://github.com/chriskempson/base16-vim.git nvim/site/pack/bundle/opt/base16
git submodule add --name "lualine" https://github.com/hoob3rt/lualine.nvim.git nvim/site/pack/bundle/opt/lualine
git submodule add --name "devicons" https://github.com/kyazdani42/nvim-web-devicons.git nvim/site/pack/bundle/opt/devicons
# Basics
git submodule add --name "popup" https://github.com/nvim-lua/popup.nvim.git nvim/site/pack/bundle/opt/popup
git submodule add --name "plenary" https://github.com/nvim-lua/plenary.nvim.git nvim/site/pack/bundle/opt/plenary
git submodule add --name "telescope" https://github.com/nvim-telescope/telescope.nvim.git nvim/site/pack/bundle/opt/telescope
git submodule add --name "surround" https://github.com/tpope/vim-surround.git nvim/site/pack/bundle/opt/surround
git submodule add --name "commentary" https://github.com/tpope/vim-commentary.git nvim/site/pack/bundle/opt/commentary
# Programming languages
git submodule add --name "lspconfig" https://github.com/neovim/nvim-lspconfig.git nvim/site/pack/bundle/opt/lspconfig
git submodule add --name "treesitter" https://github.com/nvim-treesitter/nvim-treesitter.git nvim/site/pack/bundle/opt/treesitter
git submodule add --name "completion" https://github.com/nvim-lua/completion-nvim.git nvim/site/pack/bundle/opt/completion
git submodule add --name "neoformat" https://github.com/sbdchd/neoformat.git nvim/site/pack/bundle/opt/neoformat
# Web development
git submodule add --name "graphql" https://github.com/jparise/vim-graphql.git nvim/site/pack/bundle/opt/graphql
git submodule add --name "jsxpretty" https://github.com/MaxMEllon/vim-jsx-pretty.git nvim/site/pack/bundle/opt/jsxpretty
git submodule add --name "jsxtypescript" https://github.com/peitalin/vim-jsx-typescript.git nvim/site/pack/bundle/opt/jsxtypescript
git submodule add --name "typescript" https://github.com/leafgarland/typescript-vim.git nvim/site/pack/bundle/opt/typescript
git submodule add --name "javascript" https://github.com/pangloss/vim-javascript.git nvim/site/pack/bundle/opt/javascript
git submodule add --name "styledcomponents" https://github.com/styled-components/vim-styled-components.git nvim/site/pack/bundle/opt/styledcomponents
