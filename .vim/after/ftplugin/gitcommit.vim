" Displays the currently selected line and column.
" This helps us see whether the commit title is longer than our conventional 50 character limit.
setlocal ruler

" Set the text width for Git commit messages to 72 characters,
" a common convention for readability in `git log` output.
setlocal textwidth=72

" Use ';' as the comment character.
" This lets us use "#" to type markdown headers in our commit messages.
setlocal commentstring=;\ %s
