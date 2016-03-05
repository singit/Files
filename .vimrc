"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "Intro
"Ctrl+p : complete the word
"Ctrl+] : find the definition of an element, such as variable, function
"Ctrl+t : return
"
"in minibuf you can use Tab to switch window
"
"Find something among multiple files, :Rgrep strings which are found
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置leader为
let mapleader=","
let g:mapleader=","

set fdm=indent
set nu
set nocp
set ru
syntax on
set hls
set backspace=indent,eol,start 
set whichwrap=b,s,<,>,[,]
colo desert
filetype on
filetype plugin indent on
set completeopt=longest,menu
"set mouse=a
set ttymouse=xterm2
set fileencodings=utf-8,cp936,gb18030,gbk
set nobomb
set encoding=utf-8
set termencoding=utf-8
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=2           " 使得按退格键时可以一次删掉 4 个空格

" set nobackup                " 覆盖文件时不备份
set nowb
" set autochdir               " 自动切换当前目录为当前文件所在的目录
" set backupcopy=yes          " 设置备份时的行为为覆盖
" set autoread                " set to auto read when a file changed from the outside
set noignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
" set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
" set nowrap                  " 不自动换行
set magic                  " 显示括号配对情况
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=1            " 显示状态栏 (默认值为 1, 无法显示状态栏)
" set foldenable              " 开始折叠
" set foldmethod=syntax       " 设置语法折叠
" set foldcolumn=0            " 设置折叠区域的宽度
" setlocal foldlevel=1        " 设置折叠层数为
" set foldclose=all           " 设置为自动关闭折叠
" colorscheme colorzone       " 设定配色方案
set background=dark
" colorscheme solarized         " 设定配色方案
colorscheme desert        " 设定配色方案
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)\ 
                            " 设置在状态行显示的信息
" 显示Tab符
set nolist
set listchars=tab:>-,trail:-


nnoremap ; :

"set shortcut keys for splitted window switching
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

"编辑vim配置文件
set fileformats=unix,dos,mac
nmap <Leader>e :tabnew $HOME/.vimrc<CR>
let $VIMFILES = $HOME.'/.vim'


map <F7> :call MakeFile()<CR>
func! MakeFile()
    exec ":wall"
    exec ":make"
endfunc

"save all opened files
"map <F3> :wall<CR>
"map <F4> :quitall<CR>

" back to previous position when open the file
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Editting setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set expandtab

"不同文件类型的缩进
au FileType html,python,vim,javascript,py setl shiftwidth=4
au FileType html,python,vim,javascript,py setl tabstop=4
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4

"set sts=4 
"set tw=100
"set sw=4
"set noet "??ת??tab Ϊ
"set lbr "???ڵ????м?????
set fo+=mB
set sm "??ʾ��??????????
set cin "C/C++?Զ???????ע?⣺ճ??????ʱ??:set paste ???Թر????????????ǵã:set nopaste
set cino=:0g0t0(sus
set ai
set cursorline

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i


func ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunc


:inoremap <F1> <C-P>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Doxygen setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2>h :DoxyFILEHeader<cr>
map <F2>f :DoxyFunction<cr>
map <F2>l :DoxyBlockLong<cr>
map <F2>s :DoxyBlockShort<cr>
map <F2>c :DoxyClass<cr>
map <F2>b :DoxyBriefAfterMember<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-

"if has("cscope")
"   set csprg=/usr/bin/cscope
"   set csto=1
"   set cst
"   " add any database in current dir
"   if filereadable("cscope.out")
"       cs add cscope.out
"   endif
"   set csverb
"endif



"move the cursor to the word which you want to find, then press <F6>
"+s|g|c|t|e|f|i|d
"s: find symbol
"g: find definition
"c: find functions which call the function pointed by the cursor
"t: find string
"e:
"f: find file
"i: find files including the file pointed by the cursor
"d: find functions called by the function pointed by the cursor
nmap <F6>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F6>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F6>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F6>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <F6>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <F6>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <F6>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap gx yiw/^\(sub\<Bar>function\)\s\+<C-R>"<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist and ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('/opt/local/bin/ctags')
    let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
endif

" Taglist plugin
map <F5> :TlistToggle<CR>
let Tlist_WinWidth = 30
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=0

"items in tags are sorted by name
let Tlist_Sort_Type = "name"

"make tag
map <F10> :call MakeTag()<CR><CR>
func! MakeTag()
    exec ":wall"
    exec "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q"
    exec "!cscope -Rbq"
    cs add cscope.out
endfunc

set tags=tags,../tags,../../tags,../../../tags,../../../../tags,~/.vim/tags/,~/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRU
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :MRU<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree plugin
"map <F2> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
" au VimEnter * NERDTree


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"winmanager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWidth = 30
"nmap <silent> <F8> :WMToggle<CR>
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
nmap WM :WMToggle<cr>

let g:AutoOpenWinManager = 1

"let g:winManagerWindowLayout = "BufExplorer|minibufexpl,Taglist"

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"BurExplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"A
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"can swift from cpp to h or from h to cpp
map <F9> :A<CR>


"move to top window
"map <F5> <C-w>t

"set the size of a window to 8 lines
"map <F2>8 8<C-w>_

"maximum the size of a window
"map <F2>m <C-w>_

"you can change tags to your source code
"if filereadable("tags")
"    set tags=tags,
"elseif filereadable("../tags")
"    set tags=../tags,
"else
"    "echo "no tags"
"endif
