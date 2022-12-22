" plugins
call plug#begin('~/.vim/plugged')

" theme
Plug 'morhetz/gruvbox'

" coc code complete
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" lsp & autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'mhinz/vim-startify'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" snippet
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'


" go extension
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" file navigate
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" code extension
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/gomodifytags'

" file tree
Plug 'preservim/nerdtree'

" code comment
Plug 'tpope/vim-commentary'

call plug#end()

" import my setup
lua require('super')

" settings
"
syntax on

set number relativenumber
set nu rnu
set nobackup
set noswapfile
set nowrap
set undodir=~/.vim/undodir
set undofile
set incsearch
set smartindent
set laststatus=2
set cursorline
lang en_US.UTF-8

" Go mapping
" disable vim-go :GoDef short cut (gd)
" let g:go_def_mapping_enabled = 0

let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_highlight_build_contrainst=1
let g:go_fmt_autosave=1
let g:go_imports_autosave=1
let g:go_doc_popup_window=1
let g:go_echo_command_info=1

let g:fzf_buffers_jump = 1

let g:airline_stl_path_style = 'short'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 20
let g:airline#extensions#branch#sha1_len = 20
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' '

" let g:airline_theme='night_owl'

let g:airline_theme='gruvbox'

let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1
let g:go_gopls_enabled = 0

" vim-startify
"
let g:startify_bookmarks = [ {'a': '~/Documents/projs/stampless_backend'}, {'b': '~/Documents/projs/stampless_import'}, {'c': '~/.config/nvim/init.vim'}, {'d': '~/.zshrc'} ]
let g:startify_change_to_vcs_root = 1
let g:startify_padding_left = 10

" fzf configured
let $FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l ""'
let $FZF_DEFAULT_OPTS="--preview-window 'right:57%'
\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
\shift-up:half-page-up,shift-down:half-page-down"

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-l> :Files<Cr>
nnoremap <leader>sb :G<Cr>
nnoremap <leader>st :GFiles?<Cr>
nnoremap <leader>sd :Gdiffsplit<Cr>
nnoremap <leader>g :Rg<Cr>
nnoremap <leader>w :Rg <C-R><C-W><Cr>
nnoremap <leader>q :ccl<Cr>

nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>go :Git log --oneline<CR>

" //3 get from our side, //2 get from origin
nnoremap <leader>gr :diffget //3<CR>
nnoremap <leader>gl :diffget //2<CR>

" delete but not write to buffer
nnoremap <leader>d "_dd<CR>

nnoremap <leader>s :Startify<CR>

nnoremap <leader><TAB> <C-^>
nnoremap <leader>l :Buffers<Cr>
nnoremap <leader>bd :%bd<bar>e#<bar>bd#<Cr>
nnoremap <leader>nh :noh<Cr>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

nnoremap <TAB>f :NERDTreeFind<CR>
nnoremap <TAB>n :NERDTreeFocus<CR>
nnoremap <TAB>t :NERDTreeToggle<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" " Copy to clipboard
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

tnoremap <Esc> <C-\><C-n>

" Navigation commands
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

" Alternate commands
au FileType go nmap <Leader>ae <Plug>(go-alternate-edit)
au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

" Common Go commands
au FileType go nmap <leader>c :GoCoverageToggle<cr>
au FileType go nmap <leader>t :GoTestFunc<cr>
au FileType go nmap gie <Plug>(go-iferr)
au FileType go nmap gfs :GoFillStruct<cr>
au FileType go nmap gat :GoAddTags<cr>


" colors
"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme gruvbox

" transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Diagnostic colors
"
hi DiagnosticError ctermfg=167 guifg=#fb4934
hi DiagnosticWarn ctermfg=214 guifg=#fabd2f
hi DiagnosticInfo ctermfg=109 guifg=#83a598

