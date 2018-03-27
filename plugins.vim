
"""PLUGINS """
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'       "Vim-Tmux navigation
Plug 'tmux-plugins/vim-tmux-focus-events'   "Improve autoread in tmux!
Plug '/usr/local/opt/fzf'                   "Fuzzy finder
Plug 'junegunn/fzf.vim'                     "fzf vim funcs
Plug 'sheerun/vim-polyglot', { 'tag': 'v3.3.1' }                 "Better syntax highlighting
Plug 'itchyny/lightline.vim'                "Powerline (lighter version)
Plug 'airblade/vim-gitgutter'               "Git additions and removals
Plug 'tpope/vim-surround'                   "Easy brace and quote changes
Plug 'tpope/vim-fugitive'                   "Git wrapper for vim
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Linter
Plug 'w0rp/ale', { 'for': ['js', 'ruby'] }
"Javascript/Typescript
Plug 'carlitux/deoplete-ternjs', { 'for': 'js', 'do': 'npm install -g tern' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'js' }
"Rubies
Plug 'tpope/vim-rails',  { 'for': 'ruby' }
Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' } " TODO: go to github page and download py package for this
"Live preview
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown', 'for': 'markdown' }
"Themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs' "MANY features, but mostly closes ([{' etc
Plug 'vim-ruby/vim-ruby'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/matchit.zip' " % also matches HTML tags / words / etc
Plug 'docunext/closetag.vim'
Plug 'scrooloose/nerdtree'
Plug 'danro/rename.vim'
call plug#end()

"Colours
let g:nord_italic = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
colorscheme onedark

"Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

"Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"FZF
nnoremap <C-t> :FZF<CR>
let g:fzf_buffers_jump = 1              "[Buffers] Jump to the existing window if possible

"Lightline (copy pasta material)
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ] ,
      \   'right': [ ['path'], ['filetype'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename',
      \   'path': 'LightLinePath'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
set noshowmode                                         "Don't repeat vim modes in indicator

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightLinePath()
  return winwidth(0) > 70 ? expand('%:p:~:h') : ''
endfunction
