set nocompatible
set nomodeline " security

" The leader key will be (mostly) coupled to key sequences that have something
" to do with windows (opening a diagnostic, finding files/text, moving between
" windows).
let mapleader = "\<Space>"

" Most of these configs are folded to keep it readable.  Use `za` on a folded
" section to toggle folding, or use `zM` to fold all or `zR` to unfold all.  By
" default, stuff is folded at start. To disable, use `set nofoldenable`.

" Look and feel {{{
packadd! base16
packadd! devicons
lua require('me.lsp-devicons')

set termguicolors
set background=dark
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
" }}}

" Fuzzy finder {{{
packadd! popup
packadd! plenary
packadd! telescope
packadd! telescope-file-browser

" find files
" nnoremap <C-f>  <Nop>
nnoremap <leader>f/ :lua require('me.telescope').grep_pattern(vim.fn.input("Grep for > "))<CR>
nnoremap <leader>f* :lua require('me.telescope').grep_cword()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fp :lua require('me.telescope').find_files_project()<CR>
nnoremap <leader>fa :lua require('me.telescope').find_files()<CR>
nnoremap <leader>fw :lua require('me.telescope').git_worktree()<CR>
nnoremap <leader>ft :lua require('me.telescope').git_trunk()<CR>

" browse
nnoremap <leader>fy :lua require('me.telescope').search_cfg()<CR>
nnoremap <leader>fk :lua require('me.telescope').search_kb()<CR>
nnoremap <leader>bp :lua require('telescope').extensions.file_browser.file_browser()<CR>
nnoremap <leader>bh :lua require('telescope').extensions.file_browser.file_browser({ path=vim.fn.expand("%:p:h")})<CR>

" After opening a window to search for a file (or text), just hit enter to open
" the file, or Ctrl-t to open it in a new tab. You can switch tabs with `gt`
" (next tab) or `gT` (previous tab), or `Ngt` where `N` is the tab number
" (starting from 1) to jump immediately to the right tab.  Closing the last
" window in a tab will close the tab itself, so you can just use <leader>c to
" close tabs as well as windows (see window bindings below).

" }}}

" Status bar {{{
packadd! lualine
lua require('me.lualine')

" The status bar can be configured to use icons (but then you need some special
" fonts that have those icons, i.e. nerd fonts). The configuration is in the
" lua file, and we use the defaults there except that we add diagnostics output
" next to the file name (which shows LSP diagnostics).
"
" }}}

" Git {{{
autocmd FileType gitconfig setlocal noexpandtab

" mergetool with diff view can be used (see mergetool.vim)
" make sure LOCAL is on the left, REMOTE is on the right.
nnoremap <leader>dh :diffget LO<CR>
nnoremap <leader>dl :diffget RE<CR>
nnoremap <leader>db :diffget BA<CR>
" }}}

" Delimiters {{{
packadd! surround

" To change one type of quotes to another, use `csXY`
" with X and Y the characters representing from => to
" while positioned on the word.
"
" "hello" cs"' => 'hello'
" 'hello' cs'( => ( hello )
" 'hello' cs') => (hello)
" {hello} cs}{ => { hello }
"
" To add or remove quotes around a word, use either
" `ysiwX` (add), or `dsX` (delete):
"
" (hello) ds(   => hello
" (hello) ds)   => hello
" hello   ysiw{ => { hello }
" hello   ysiw} => { hello }
"
" With parentheses, using the open version keeps a space,
" using the closed version adds no space when adding
" (no difference when removing).

" jump to end of line in insert mode (to escape delimiters)
inoremap <C-e> <C-o>A

" }}}

" Comments {{{
packadd! commentary

" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment
" out the target of a motion (for example, gcap to comment out a paragraph), gc in
" visual mode to comment out the selection, and gc in operator pending mode to
" target a comment. You can also use it as a command, either with a range like
" :7,17Commentary, or as part of a :global invocation like with
" :g/TODO/Commentary. That's it.

" }}}

"""
""" Programming language support
"""

" A lot of programming language support requires NodeJS (using VS Code plugins)
" and packages that should be available system wide. To easily install global
" packages, create a `~/.npm-global` directory, add `~/.npm-global/bin` to your
" path and then set it as prefix with `npm config set prefix '~/.npm-global'`.

" Completion {{{
inoremap <silent><C-k> <C-x><C-o>
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
" }}}

" LSP {{{
packadd! lspconfig

" LSP relies on a bunch of language servers, they are listed in the
" sections that configure LSP for that particular language.

set signcolumn=yes
setlocal omnifunc=v:lua.vim.lsp.omnifunc

sign define LspDiagnosticsSignError text= texthl=lualine_c_diagnostics_error_normal
sign define LspDiagnosticsSignWarning text= texthl=lualine_c_diagnostics_warning_normal
sign define LspDiagnosticsSignInformation text= texthl=lualine_c_diagnostics_info_normal
sign define LspDiagnosticsSignHint text= texthl=lualine_c_diagnostics_info_normal

" Diagnostics key bindings
nnoremap <silent>glj	<cmd>lua vim.lsp.diagnostic.goto_next{ wrap = true }<CR>
nnoremap <silent>glk	<cmd>lua vim.lsp.diagnostic.goto_prev{ wrap = true }<CR>
nnoremap <silent>gl=	<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent>L	<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
" Navigation
nnoremap <silent>K	<cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><C-]>	<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><C-s>	<cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent>gld	<cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>glt	<cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent>gli	<cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>glr	<cmd>lua vim.lsp.buf.references()<CR>:copen<CR>
nnoremap <silent>glc	<cmd>lua vim.lsp.buf.incoming_calls()<CR>:copen<CR>
nnoremap <silent>glC	<cmd>lua vim.lsp.buf.outgoing_calls()<CR>:copen<CR>
" Refactoring
nnoremap <silent>glw	<cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent>glf	<cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent>gla	<cmd>lua vim.lsp.buf.code_action()<CR>

" Language support
" npm install --global bash-language-server
lua require('me.lsp-bash')
" npm install --global graphql-lsp
lua require('me.lsp-graphql')
" make sure go is installed properly, then gopls will be in your path
lua require('me.lsp-go')
" npm install --global vscode-langservers-extracted typescript-language-server typescript
lua require('me.lsp-ts')
" npm install --global yaml-language-server
lua require('me.lsp-yaml')
lua require('me.lsp-lua')
lua require('me.lsp-bicep')
" }}}

" TreeSitter {{{
packadd! treesitter
lua require('me.treesitter')
" }}}

" Formatting {{{
" There is some formatting capability in the LSP servers, but that's not
" really what we need all the time, and most often formatting is nice to
" have separate from any diagnostics or analysis tool.
packadd! neoformat
" NeoFormat uses other programs to do the formatting:
" npm install --global prettier
" https://github.com/mvdan/sh

nnoremap <leader>s :Neoformat<CR>:w<CR>
set shortmess+=w

" Even though auto formatting (NeoFormat) will do everything properly,
" while typing it's nice to get the approximate correct behaviour for
" indentation. Since we avoid having to use a bunch of plugins, we try
" to set some decent defaults here, and then let auto-formatting take
" care of the rest when saving the file.
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 expandtab
" }}}

" Filetypes {{{
au BufRead,BufNewFile *.bicep set filetype=bicep
" }}}

" Special tweaks {{{

" When working with yarn2, jumping to definitions will open a zip file
" with a path similar to: `.yarn/cache/@package.zip/node_modules/.../file.js`,
" which can be opened by neovim if the string is massaged a little bit.
function! OpenZippedFile(f)
  " get number of new (empty) buffer
  let l:b = bufnr('%')
  " construct full path
  let l:f = substitute(a:f, '.zip/', '.zip::', '')
  let l:f = substitute(l:f, '.yarn/.*/cache/', '.yarn/cache/', '')
  let l:f = substitute(l:f, '^', 'zipfile:', '')

  " swap back to original buffer
  b #
  " delete new one
  exe 'bd! ' . l:b
  " open buffer with correct path
  sil exe 'e ' . l:f
  " read in zip data
  call zip#Read(l:f, 1)
endfunction
au BufReadCmd *.yarn/*cache/*.zip/* call OpenZippedFile(expand('<afile>'))

" }}}

" Grepping {{{
" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
" }}}

" Vim {{{
augroup SVC_VIM
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"""
""" Customization
"""

" Global {{{

filetype plugin indent on

set title               " use filename to set titlebar
set nobackup            " don't keep a backup file
set noswapfile

set noruler             " show the cursor position all the time

set number              " number lines
set relativenumber      " use relative numbers
set scrolloff=999       " leave some lines of 'border' at top and bottom (999 = always middle cursor)
set scroll=20           " how much to scroll with Ctrl-d/Ctrl-u

set list
set listchars=tab:➝\ ,

set tabstop=8
set ignorecase          " make vim case insensitive
set smartcase           " be case sensitive if need be

set textwidth=80
"set colorcolumn=80	" mark position as column
set formatoptions-=t	" do not automatically wrap text when typing

set hidden
set nohlsearch

" easier escape (avoid timeout)
set ttimeoutlen=10

" alternatives for escape
noremap <C-l> <Esc>
inoremap <C-l> <Esc>
noremap <leader>x :xa<CR>

" copy to / paste from clipboard in visual mode
noremap  <leader>y "+y
noremap  <leader>p "+p

" }}}

" window shortcuts {{{
" switch windows
nnoremap <leader><Space> <C-w>w
" keep current window (close all others)
nnoremap <leader>k <C-w><C-o>
" close current window
nnoremap <leader>c <C-w>c
" }}}

" quickfix list {{{
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
" }}}

" Deactivate arrow keys {{{
noremap  <down>  <Nop>
noremap  <up>    <Nop>
noremap  <left>  <Nop>
noremap  <right> <Nop>
inoremap <left>  <Nop>
inoremap <right> <Nop>
inoremap <down>  <Nop>
inoremap <up>    <Nop>
" }}}

" reload init
command Reload :source ~/.config/nvim/init.vim