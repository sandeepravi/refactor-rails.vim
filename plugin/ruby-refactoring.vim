"
" Author: Sandeep Ravichandran
"
" Acknowledgements:
"
" Load all refactoring recipes
exec 'runtime ' . expand('<sfile>:p:h') . '/refactorings/general/*.vim'

" Commands:
"

command! -range RenameInstanceVariable    call RenameInstanceVariable()
command! -range RenameLocalVariable    call RenameLocalVariable()
command! -range IndentFile    call IndentProject()

" Mappings:
"
" Default mappings are <leader>r followed by an acronym of the pattern's name
" E.g. Extract Method is mapped to <leader>rem

if !exists('g:ruby_refactoring_map_keys')
  let g:ruby_refactoring_map_keys = 1
endif

if g:ruby_refactoring_map_keys
  vnoremap <leader>riv :RenameInstanceVariable<cr>
  vnoremap <leader>rv :RenameLocalVariable<cr>
  noremap <leader>ic :IndentFile<cr>
endif
