"------------- vundle setting
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-Tree'
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

call vundle#end()
"----------------------------

filetype plugin indent on " filetype에 따른 plugin, indetation을 켠다.
syntax enable

set nocompatible
set fencs=utf-8,euc-kr,cp949,cp932
set bg=dark " background를 dark로 설정한다
set ai "set autoindent
set sta
set visualbell "no beep
set nobackup
set tabstop=4
set shiftwidth=4 " tab 관련 설정
set softtabstop=4
set expandtab
set sts=4
"set nu  show line number
set nobackup "do not make backup files
set title " windows title을 현재 편집중인 파일이름으로 한다.
set incsearch "incremental search
set hlsearch "search를 할때 highlight를 해준다.
set smartcase "소문자로 검색시 대소문자 무시, 대문자로 검색시 대문자만 검색
set showmatch "match brakets
set autowrite "auto save when :make or :next
set foldmethod=syntax " syntax에 따라 folding을 한다.
set foldlevel=9999999 "open all fold
set km-=stopsel " ctrl+f & ctrl+b don't stop visual mode
set showcmd
set complete-=i
set smarttab
set dy+=uhex "show unprintable characters as a hex number
set laststatus=2
set scrolloff=3  " 커서의 위아래로 항상 세줄의 여유가 있게끔.
set completeopt=menu,menuone,longest " do not show preview window on omnicompletion
command! W w " :W로 저장
command! E Explore

"vertical split & show git diff when git commit
autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd p

let g:ctrlp_root_markers = ['Gemfile','Makefile','Rakefile']
let g:EasyMotion_leader_key = '<Leader>'

" from github.com/astrails/dotvim
" ignore these files when completing names and in explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc
set shell=/bin/bash     " use bash for shell commands
set autowriteall        " Automatically save before commands like :next and :make
set hidden              " enable multiple modified buffers
set history=1000
set autoread            " automatically read file that has been changed on disk and doesn't have changes in vim


" center display after searching
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#z

" show red bg for extra whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

noremap <F1> <Esc>
noremap <C-n> :noh<CR>
vnoremap <backspace> "_d

set encoding=utf-8
set fileencodings=utf-8
command! NE NERDTree
