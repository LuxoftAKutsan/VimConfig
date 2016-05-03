set nocompatible
execute pathogen#infect()
call pathogen#helptags()
filetype off
filetype plugin indent on

set exrc
set secure
set noexpandtab
set colorcolumn=80
set guifont=SourceCodePro\ 12
colorscheme solarized

syntax on
set t_Co=256
set cindent
"set equalprg=astyle
set background=dark
hi ColorColumn guibg=#2d2d2d ctermbg=246
set showcmd

" чтобы курсор не прыгал, а вёл себя так, как kwrite и т.п.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" файлы автоматом делаются исполняемыми
function ModeChange()
	if getline(1) =~ "^#!"
	if getline(1) =~ "/bin/"
	silent !chmod a+x <afile>
	endif
	endif
endfunction
au BufWritePost * call ModeChange()

" вкладки
set tabpagemax=99
nmap <C-a> :tabnew<cr>
imap <C-a> <ESC>:tabnew<cr>
map <C-x> :tabnext<cr>
nmap <C-x> :tabnext<cr>
imap <C-x> :tabnext<cr>
map <C-z> :tabprev<cr>
nmap <C-z> :tabprev<cr>
imap <C-z> :tabprev<cr>


" кириллица
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:⤇⥰,trail:˽,eol:¬
set list
set showcmd

function! Clear_whitespaces()
  ma a
  :%s/\s\+$//e
  'a
endfunction
autocmd BufWritePre * :call Clear_whitespaces()

map <F3> :NERDTreeToggle<CR>
let g:airline_powerline_fonts = 1

" Python mode

let g:pymode_rope = 1
let g:pymode_doc = 1 "Documentation
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1 "Linting
let g:syntastic_python_checkers=['flake8']
let g:pymode_lint_write = 1 "Auto check on save
let g:pymode_virtualenv = 1 "Support virtualenv
let g:pymode_breakpoint = 1 " Enable breakpoints plugin
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_syntax = 1 "syntax highlightin
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 1 "0:Don't autofold code 1:enable python folding
