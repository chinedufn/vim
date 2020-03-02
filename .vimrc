""""""""""""""""""""""""""""""""""""""""""""""""""
" Vi Compatibility
""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove vi compatibility so that more things work as expected.
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""
set nu

""""""""""""""""""""""""""""""""""""""""""""""""""
" Backspace
""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix backspace not working
" https://vim.fandom.com/wiki/Backspace_and_delete_problems
:set backspace=indent,eol,start

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
