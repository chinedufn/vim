"""""""""""""""""""""""""""""""""""""""""""""""""
" Vi Compatibility
""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove vi compatibility so that more things work as expected.
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""
" Preserve undo buffers
""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""
" Working dir as current file
""""""""""""""""""""""""""""""""""""""""""""""""""
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Key
""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic text editing
" https://nvie.com/posts/how-i-boosted-my-vim/
""""""""""""""""""""""""""""""""""""""""""""""""""


set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title

set belloff=all   " Prevent the screen from flashing

""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy yanked text to clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard^=unnamed


""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent undo
""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.chinedufn-vim/.vim/undodir
set undolevels=1000

""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl-[H,J,K,L] for window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Splits open below and right instead of above and left
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Backups
""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""
" File types
""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""
" Packages
""""""""""""""""""""""""""""""""""""""""""""""""""
set packpath=~/.chinedufn-vim/.vim

""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
" https://github.com/ctrlpvim/ctrlp.vim
""""""""""""""""""""""""""""""""""""""""""""""""""

" Choosing the root search directory
" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
let g:ctrlp_working_path_mode = 'ra'

" Ignore .gitignore'd files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
" https://github.com/preservim/nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl + E to toggle sidebar
map <C-e> :NERDTreeToggle<CR>

" , + e to open sidebar to current file
map <leader>e :NERDTreeFind<CR>

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('rs', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust.vim
" https://github.com/rust-lang/rust.vim
""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic rustfmt on save
let g:rustfmt_autosave = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" TagBar
" https://github.com/majutsushi/tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""
" Press s to toggle sidebar
map s :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC
" https://github.com/neoclide/coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
