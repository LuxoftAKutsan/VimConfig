set nocompatible
execute pathogen#infect()
filetype off
filetype plugin indent on

set exrc
set secure
set noexpandtab
set colorcolumn=80
set guifont=SourceCodePro\ 12
syntax on
set t_Co=256
set cindent
"set equalprg=astyle
set background=dark
highlight ColorColumn ctermbg=darkgray
set showcmd

" чтобы курсор не прыгал, а вёл себя так, как kwrite и т.п.
"nnoremap j gj
"nnoremap k gk
"vnoremap j gj
"vnoremap k gk
"nnoremap <Down> gj
"nnoremap <Up> gk
"vnoremap <Down> gj
"vnoremap <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk

" файлы автоматом делаются исполняемыми
function ModeChange()
	if getline(1) =~ "^#!"
	if getline(1) =~ "/bin/"
	silent !chmod a+x <afile>
	endif
	endif
endfunction
au BufWritePost * call ModeChange()
nmap <C-F3> :w<cr>
nmap <F10> :q<cr>

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
set wildmenu
set wcm=<Tab>
menu Encoding.CP1251 :e ++enc=cp1251<CR>
menu Encoding.CP866 :e ++enc=cp866<CR>
menu Encoding.KOI8-U :e ++enc=koi8-u<CR>
menu Encoding.UTF-8 :e ++enc=utf-8<CR>
map <F8> :emenu Encoding.<TAB>
set fileencodings=utf-8,cp1251,cp866,koi8-r
set is
imap <F4> <Esc>:browse tabnew<CR>
map <F4> <Esc>:browse tabnew<CR>

nnoremap <A-k> :m-2<CR>==
nnoremap <A-j> :m+<CR>==

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

