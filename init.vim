call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'markvincze/panda-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'PProvost/vim-ps1'
Plug 'lervag/vimtex'
Plug 'rakr/vim-two-firewatch'
Plug 'AndrewRadev/linediff.vim'
call plug#end()

color two-firewatch
let g:two_firewatch_italics=1
set background=dark
set termguicolors
set number
set cursorline
" set relativenumber
set undofile
set undodir=~/AppData/Local/nvim/undodir
set tabstop=4
set shiftwidth=4
set clipboard=unnamed
set scrolloff=5

function ToggleScrolloff()
	if &scrolloff == 100
		set scrolloff=5
	else
		set scrolloff=100
	endif
endfunction

nmap <C-k> :call ToggleScrolloff()<CR>

let s:istextfile=0
set spelllang=en_us
function ToggleTextFile()
	if s:istextfile
		let s:istextfile=0
		set tw&
		set spell&
	else
		let s:istextfile=1
		set tw=80
		set spell
	endif
endfunction

nmap GQ :call ToggleTextFile()<CR>

let g:latex_to_unicode_auto = 1
let s:l2u_esc_sequence = "\u0006"

imap jj <Esc>
imap kk <Esc>
vnoremap . :normal .<CR>

" Turning off some features for latex performance
au BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nornu |
    \ set number |
    \ set tw=80 |
	\ set spell spelllang=en_us

" To bring the cursor back to where it was last
autocmd BufReadPost *
	\ if line("'\"") >= 1 && line ("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g'\""
	\ | endif

noremap <leader>ldt :Linediff<CR>
noremap <leader>ldo :LinediffReset<CR>

" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

nnoremap <esc> :noh<return><esc>

set nojoinspaces
