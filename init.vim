call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'markvincze/panda-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'PProvost/vim-ps1'
Plug 'lervag/vimtex'
Plug 'rakr/vim-two-firewatch'
Plug 'AndrewRadev/linediff.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'rickhowe/diffchar.vim'
Plug 'vim-python/python-syntax'
call plug#end()

let g:vimtex_view_general_viewer = "SumatraPDF"

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
" let g:seoul256_background = 233
" color seoul256

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
let g:seoul256_background = 256
color seoul256

" color two-firewatch
" let g:two_firewatch_italics=1
set background=light
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
		set tw=100
		set spell
	endif
endfunction

nmap GQ :call ToggleTextFile()<CR>

let g:latex_to_unicode_auto = 1
let s:l2u_esc_sequence = "\u0006"

imap jj <Esc>
imap kk <Esc>
vnoremap . :normal .<CR>

" Ensures word-wrap does not split words
set lbr
" Indents word-wrapped lines as much as the 'parent' line
set breakindent

" Turning off some features for latex performance
au BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nornu |
    \ set number |
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

" set nojoinspaces

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:goyo_width=110
nnoremap <C-j> :Goyo<CR>

filetype plugin on

function RunScript()
	if &filetype ==# 'julia'
		write
		belowright split
		term julia %
	elseif &filetype ==# 'python'
		write
		belowright split
		term python %
	elseif &filetype ==# ''
		quit
	endif
endfunction

nnoremap <C-return> :call RunScript()<CR>

" Adds --shell-escape to vimtex/latexmk
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
    \}

let g:python_highlight_all = 1



