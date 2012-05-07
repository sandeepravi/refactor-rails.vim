"
" Author: Sandeep Ravichandran
"
" Load all refactoring recipes
exec 'runtime ' . expand('<sfile>:p:h') . '/refactorings/*.vim'

" Commands:
"

command! -range RenameInstanceVariable    call RenameInstanceVariable()
command! -range RenameLocalVariable       call RenameLocalVariable()
command! -range IndentFile                call IndentProject()
command! -range MoveCurrentFile           call MoveCurrentFile()
command! -range CopyCurrentFile           call CopyCurrentFile()
command! -range ExtractMethod             call ExtractMethod()
command! -range RenameController          call RenameController()

" Mappings:

if !exists('g:ruby_refactoring_map_keys')
  let g:ruby_refactoring_map_keys = 1
endif

if g:ruby_refactoring_map_keys
  vnoremap <leader>riv :RenameInstanceVariable<cr>
  vnoremap <leader>rv  :RenameLocalVariable<cr>
  noremap  <leader>ic  :IndentFile<cr>
  noremap  <leader>mf  :MoveCurrentFile<cr>
  noremap  <leader>cf  :CopyCurrentFile<cr>
  vnoremap <leader>rv  :RenameLocalVariable<cr>
  noremap  <leader>rc  :RenameController<cr>
endif
