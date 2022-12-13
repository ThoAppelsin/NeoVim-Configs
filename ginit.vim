let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

call AdjustFontSize(0)

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

" In normal mode, pressing numpad's+ increases the font
noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a

" For keyboards without numpad
noremap <C--> :call AdjustFontSize(-1)<CR>
noremap <C-=> :call AdjustFontSize(1)<CR>

" Resizes the initially opened panes to be equal
autocmd VimResized * :execute "normal \<C-w>="


function ChangeTint(amount)
	if (g:seoul256_background < 256 || a:amount < 0) && (g:seoul256_background > 233 || a:amount > 0)
		let g:seoul256_background = g:seoul256_background+a:amount
		if g:seoul256_background > 256
			let g:seoul256_background = 256
		elseif g:seoul256_background < 233
			let g:seoul256_background = 233
		elseif 239 < g:seoul256_background && g:seoul256_background < 252
			if a:amount < 0
				let g:seoul256_background = 239
			else
				let g:seoul256_background = 252
			end
		end
		color seoul256
	end
endfunction

noremap <C-9> :call ChangeTint(-1)<CR>
noremap <C-0> :call ChangeTint(1)<CR>

