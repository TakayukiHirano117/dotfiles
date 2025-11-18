let mapleader = ","

" カラーコード設定
if has('termguicolors')
  set termguicolors
  let g:terminal_color_0  = '#073642'
  let g:terminal_color_1  = '#dc322f'
  let g:terminal_color_2  = '#859900'
  let g:terminal_color_3  = '#b58900'
  let g:terminal_color_4  = '#268bd2'
  let g:terminal_color_5  = '#d33682'
  let g:terminal_color_6  = '#2aa198'
  let g:terminal_color_7  = '#eee8d5'
  let g:terminal_color_8  = '#002b36'
  let g:terminal_color_9  = '#cb4b16'
  let g:terminal_color_10 = '#586e75'
  let g:terminal_color_11 = '#657b83'
  let g:terminal_color_12 = '#839496'
  let g:terminal_color_13 = '#6c71c4'
  let g:terminal_color_14 = '#93a1a1'
  let g:terminal_color_15 = '#fdf6e3'
endif

" ─────────────────────────────────────────────
" 基本設定
" ─────────────────────────────────────────────
set mouse=
set clipboard=unnamedplus
set fenc=utf-8
set shell=/bin/zsh
set nobackup
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set textwidth=0
set hlsearch
set number
syntax on
set noswapfile
set autoread
set background=dark
set cursorline

" ─────────────────────────────────────────────
" プラグイン（vim-plug）
" ─────────────────────────────────────────────
call plug#begin()
" Plug 't9md/vim-quickhl'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ixru/nvim-markdown'
Plug 'stevearc/aerial.nvim'
" Plug 'shellRaining/hlchunk.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'monaqa/dial.nvim'
Plug 'Wansmer/treesj'
Plug 'psliwka/vim-smoothie'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'matze/vim-move'
Plug 'kshenoy/vim-signature'
Plug 'romkatv/powerlevel10k'
Plug 'ntk148v/vim-horizon'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-rails'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'airblade/vim-gitgutter'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'tpope/vim-projectionist'
Plug 'vim-test/vim-test'
Plug 'liuchengxu/vim-which-key'
" Plug 'folke/trouble.nvim'
" Plug 'rcarriga/nvim-notify'
" Plug 'klen/nvim-test'
Plug 'michaelb/sniprun'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" ─────────────────────────────────────────────
" カラースキーム＆ハイライト
" ─────────────────────────────────────────────
colorscheme codedark
highlight Normal guifg=White guibg=Black
highlight Search guibg=#FFD700 guifg=Black ctermbg=Yellow ctermfg=Black

" カーソル（半透明をやめて安定表示）
highlight Cursor guibg=White guifg=Black

" カーソル形状とハイライト紐付け
if exists('&guicursor')
  set guicursor=n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20
endif

" easymotion
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
let g:move_key_modifier = 'M'

" vim-airline設定
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], ['z'] ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_theme = 'codedark'

" Ctrl-n で fern を開閉
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle<CR>
let g:fern#renderer = 'nerdfont'

" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" gitgutter
nnoremap g[ :GitGutterPrevHunk<CR>
nnoremap g] :GitGutterNextHunk<CR>
nnoremap gh :GitGutterLineHighlightsToggle<CR>
nnoremap gp :GitGutterPreviewHunk<CR>
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

" 更新間隔を短く
set updatetime=250

lua require("noice").setup()

" ----------------------------------------
" dial.nvim 設定（Luaを init.vim 内で呼び出す）
" ----------------------------------------
lua << EOF
local augend = require("dial.augend")
require("dial.config").augends:register_group({
  default = {
    augend.constant.alias.bool,  -- true/false をトグル
  },
})

-- キーマッピング
vim.api.nvim_set_keymap("n", "<C-a>", "<Plug>(dial-increment)", {})
vim.api.nvim_set_keymap("n", "<C-x>", "<Plug>(dial-decrement)", {})
vim.api.nvim_set_keymap("v", "<C-a>", "<Plug>(dial-increment)", {})
vim.api.nvim_set_keymap("v", "<C-x>", "<Plug>(dial-decrement)", {})
EOF

" lua << EOF
" require('hlchunk').setup({
"     chunk = {
"         enable = true,
"         style = {
"             { fg = "#806d9c" }, -- ブロックスコープ色
"         },
"         delay = 50,    -- ハイライト遅延(ms)
"         duration = 300 -- アニメーション時間(ms)
"     },
"     indent = {
"         enable = true,
"         chars = { "│" }, -- インデントガイドの文字
"         style = {
"             { fg = "#444444" }, -- インデント線の色
"         },
"     },
"     line_num = {
"         enable = true,
"         style = "#806d9c",
"     },
" })
" EOF

nnoremap <leader>m :TSJToggle<CR>

" quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

hi Cursor guifg=black guibg=#ffffff

let g:projectionist_heuristics = {
      \ 'api/domain/*.rb': {
      \   'alternate': 'spec/domain/{}_spec.rb',
      \   'type': 'source'
      \ },
      \ 'api/usecase/*.rb': {
      \   'alternate': 'spec/usecase/{}_spec.rb',
      \   'type': 'source'
      \ },
      \ 'api/infrastructure/*.rb': {
      \   'alternate': 'spec/infrastructure/{}_spec.rb',
      \   'type': 'source'
      \ },
      \ 'api/presentation/*.rb': {
      \   'alternate': 'spec/presentation/{}_spec.rb',
      \   'type': 'source'
      \ },
      \ 'spec/domain/*_spec.rb': {
      \   'alternate': 'api/domain/{}.rb',
      \   'type': 'test'
      \ },
      \ 'spec/usecase/*_spec.rb': {
      \   'alternate': 'api/usecase/{}.rb',
      \   'type': 'test'
      \ },
      \ 'spec/infrastructure/*_spec.rb': {
      \   'alternate': 'api/infrastructure/{}.rb',
      \   'type': 'test'
      \ },
      \ 'spec/presentation/*_spec.rb': {
      \   'alternate': 'api/presentation/{}.rb',
      \   'type': 'test'
      \ }
      \ }

" === キーマッピング ===
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>
