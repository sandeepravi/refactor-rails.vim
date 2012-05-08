" Support functions

" Synopsis:
"   Returns the input given by the user
function! common#get_input(message, error_message)
  let name = input(a:message)
  if name == ''
    throw a:error_message
  endif
  return name
endfunction

" Synopsis:
"   Return a file input given by the user and prepopulates with current path
function! common#get_file_input(message, error_message)
  let name = input(a:message, common#get_file_path(), "file")
  if name == ''
    throw a:error_message
  endif
  return name
endfunction

" Synopsis:
"   Param: Optional parameter of '1' dictates cut, rather than copy
"   Returns the text that was selected when the function was invoked
"   without clobbering any registers
function! common#get_visual_selection(...) 
  try
    let a_save = @a
    if a:0 >= 1 && a:1 == 1
      normal! gv"ad
    else
      normal! gv"ay
    endif
    return @a
  finally
    let @a = a_save
  endtry
endfunction

" Synopsis:
"   Find pattern to matching end, flags as per :h search()
function! common#get_range_for_block(pattern_start, flags)
  " matchit.vim required 
  if !exists("g:loaded_matchit") 
    throw("matchit.vim (http://www.vim.org/scripts/script.php?script_id=39) required")
  endif

  let cursor_position = getpos(".")

  let block_start = search(a:pattern_start, a:flags)

  if (match(getline("."), "^\\s*it\\s\\+") == 0)
    normal $
  endif

  normal %
  let block_end = line(".")

  " Restore the cursor
  call setpos(".",cursor_position) 

  return [block_start, block_end]
endfunction

" Synopsis:
"   Loop over the line range given, global replace pattern with replace
function! common#gsub_all_in_range(start_line, end_line, pattern, replace)
  let lnum = a:start_line
  while lnum <= a:end_line
    let oldline = getline(lnum)
    let newline = substitute(oldline,a:pattern,a:replace,'g')
    call setline(lnum, newline)
    let lnum = lnum + 1
  endwhile
endfunction!

" Synopsis:
"   Removed duplicates from a target list
function! common#dedupe_list(target)
  call filter(a:target, 'count(a:target,v:val) > 1 ? 0 : 1') 
endfunction

" Synopsis:
"   Copies, removes, then returns the text that was selected when
"   the function was invoked without clobbering any registers
function! common#cut_visual_selection() 
  return common#get_visual_selection(1)
endfunction

" Synopsis:
"   Return the current filename
function! common#get_file_name() 
  return expand('%:t')
endfunction

" Synopsis:
"   Return the current path of filename
function! common#get_path() 
  return expand('%:p:h')."/"
endfunction

" Synopsis:
"   Return filename with path
function! common#get_file_path() 
  return expand('%:p')
endfunction

" Synopsis:
"   Return controller path for the parameter
function! common#get_controller_path()
  return common#get_root_path()."app/controllers/"
endfunction

" Synopsis:
"   Return helper path for the parameter
function! common#get_helper_path()
  return common#get_root_path()."app/helpers/"
endfunction

" Synopsis:
"   Return view path for the parameter
function! common#get_view_path()
  return common#get_root_path()."app/views/"
endfunction

" Synopsis:
"   Return the current method name
function! common#get_method_name() 
  let BEGIN_PATTERN = '\C'.'^\s*'.'def\>'.'\s\+'.'\('.'[^(]\+'.'\)'.'\%('.'\s*'.'('.'\=\)'
  let NONE = 0

  if search(BEGIN_PATTERN, 'bW') == 0
    return NONE
  endif

  let m = matchlist(getline('.'), BEGIN_PATTERN)

  if empty(m)
    return NONE
  endif

  echo m[1]
endfunction

" Synopsis:
"   Return the current class name
function! common#get_class_name(word) 
  return common#mixedcase(a:word)
endfunction

" Synopsis:
"   Return the view for the method name
function! common#get_method_view() 
  let name = common#get_method_name().".html.erb"
  let rootpath = common#get_path()
  let path = rootpath."/".name
  return path
endfunction

" Synopsis:
"   Returns the root path for the project
function! common#get_root_path() 
  return split(common#get_path(), "app")[0]
endfunction

" Synopsis:
"   Return the view root for the controller
function! common#get_controller_views() 
  let name = split(common#get_file_name(), "_controller.rb")[0]."/"
  let rootpath = join(split(common#get_path(),"controllers"), "views")
  let path = rootpath.name
  return path."*"
endfunction

" Synopsis:
"   Moves a file from one location to another
function! common#move(source, destination)
  call system("mv ".a:source." ".a:destination)
  return a:destination
endfunction

" Synopsis:
"   Moves a folder from one location to another
function! common#movefolder(source, destination)
  call system("mv -r ".a:source." ".a:destination)
  return a:destination
endfunction

" Synopsis:
"   Copies a file from one location to another
function! common#copy(source, destination)
  call system("cp ".a:source." ".a:destination)
  return a:destination
endfunction

" Synopsis:
"   Convert word to mixedcase
function! common#mixedcase(word)
  return substitute(common#camelcase(a:word),'^.','\u&','')
endfunction

" Synopsis:
"   Convert word to camelcase
function! common#camelcase(word)
  let word = substitute(a:word, '-', '_', 'g')
  if word !~# '_' && word =~# '\l'
    return substitute(word,'^.','\l&','')
  else
    return substitute(word,'\C\(_\)\=\(.\)','\=submatch(1)==""?tolower(submatch(2)) : toupper(submatch(2))','g')
  endif
endfunction

" Synopsis:
"   Convert word to snakecase
function! common#snakecase(word)
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'-','_','g')
  let word = tolower(word)
  return word
endfunction

" Synopsis:
"   Convert snakecase to controller_name
function! common#controller(word)
  let word = common#snakecase(a:word)
  let word = word."_controller.rb"
  return word
endfunction

" Synopsis:
"   Convert snakecase to helper_name
function! common#helper(word)
  let word = common#snakecase(a:word)
  let word = word."_helper.rb"
  return word
endfunction

" Synopsis:
"   Convert snakecase to views folder
function! common#view(word)
  let word = common#snakecase(a:word)
  return word
endfunction
