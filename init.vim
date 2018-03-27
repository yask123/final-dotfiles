"""""""""""""""""""""""""""""
"""""	  Yask Srivastava	      """""
"""""	  Nvim Dotfile	  """""
"""""""""""""""""""""""""""""

source ~/.config/nvim/plugins.vim

" General
set clipboard=unnamed		        	    	"System register to be same as unnamed
set ma                                  "Allow jump to quickfix files
set autowrite                           "write content itself ex. build 
set undofile
set wildignore=*.git	                  "Wild menu to ignore compiled files

"Spacing and tabs
set backspace=2                         "Make backspace work like most other apps
set tabstop=2 			       	            "Existing tabs to be shown with 2 spaces
set shiftwidth=2                      	"Size of indent
set softtabstop=2                     	"Backspace tab
set expandtab														"Tabs to spaces

"""VISUAL"""
"Settings
set showmatch	                          "Matching braces/brackets
set number		                          "Show absolute number on current line
set relativenumber                      "Relative numbering
set scrolloff=5                         "Always 5 lines before or after cusor
set cursorline                          "highlight current line slightly
set nohlsearch                        	"Don't continue to highlight searched phrases.

"Colours
if has("termguicolors")
  set termguicolors
endif

"""KEY MAPPINGS"""
"rg search
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
command! -bang -nargs=* Find call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep
nnoremap <C-f> :Find<space>
vnoremap <C-f> y:Find<space><C-R>"<CR>

"Vimgrep 
vnoremap <C-g> y:grep<space><C-R>"<CR>

"Search and replace
vnoremap <C-s> y::%s/<C-R>"/<C-R>"/g<C-F>F/;l

"Enter to enter new line
nnoremap <CR> i<CR><ESC>

"I do :W all the time
command! W w
command! Wq wq


" =========================================
" Keyboard config
" =========================================
let g:mapleader=';'  "Leader Key
noremap <leader>w :w<CR>
noremap <leader>ml :!mac lock<CR>
noremap <leader>t :TestNearest<CR>
noremap <leader>T :TestFile<CR>

"Navigation in :terminal pls
tnoremap <C-h> <C-\><C-n><C-h>
tnoremap <C-j> <C-\><C-n><C-j>
tnoremap <C-k> <C-\><C-n><C-k>
tnoremap <C-l> <C-\><C-n><C-l>

"Faster screen resizes
nnoremap <C-w>> 20<C-w>>
nnoremap <C-w>< 20<C-w><
nnoremap <C-w>+ 20<C-w>+
nnoremap <C-w>- 20<C-w>

"Quickfix window 
function! QuickfixToggle()
  let windowCount = winnr("$")
  copen
  " check for if a new window openned
  if windowCount == winnr("$")
    cclose
  endif
endfunction
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <C-c> :call QuickfixToggle()<CR>
hi! link QuickFixLine Normal
"Quickfix to always open on bottom
au FileType qf wincmd J

"""FILE SPECIFIC"""
"Spellcheck for these files
au FileType gitcommit setlocal spell
au FileType markdown setlocal spell

"EJSON
au BufRead,BufNewFile  *.ejson setfiletype json
set ai " Auto indent
set wildmenu " visual autocomplete for command menu
set expandtab " tabs are spaces"
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"indentline guide
let g:indentLine_faster = 1

set secure                              "Disable unsafe commands in project vimrcs
