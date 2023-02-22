:set number
:set relativenumber
:set tabstop=2
:set shiftwidth=2
:set mouse=a
:set ruler


call plug#begin()

	Plug 'vim-airline/vim-airline'
	Plug 'nanotech/jellybeans.vim'
	Plug 'morhetz/gruvbox'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'terryma/vim-multiple-cursors'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/vim-easy-align'
	Plug 'tpope/vim-fugitive'

	Plug 'prettier/vim-prettier', {
 	 \ 'do': 'npm install --frozen-lockfile --production',
 	 \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

	Plug 'mustache/vim-mustache-handlebars'
	Plug 'tpope/vim-commentary'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'ap/vim-css-color'

	Plug 'psf/black', {'branch': 'stable'}


	Plug 'evanleck/vim-svelte', {'branch': 'main'}
	Plug 'pangloss/vim-javascript'
	Plug 'HerringtonDarkholme/yats.vim'

	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-notes'


call plug#end()

:let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git  -o -name .next \) -prune -o -print'

:set backupcopy=yes

nmap <silent> gd <Plug>(coc-definition)

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

xmap ga <Plug>(EasyAlign)

set background=dark
colorscheme jellybeans

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

autocmd FileType go nmap <C-x> :!go run . <enter>
autocmd FileType python nmap <C-x> :!python3 main.py <enter>

nmap <C-p> :Files<Cr>
nmap <C-n> :Explore <enter>
inoremap <silent><expr> <C-N>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#refresh()

nnoremap n nzz
nnoremap N Nzz

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-h> <C-w><C-h>
tnoremap <C-l> <C-w><C-l>

"Black configurations
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

