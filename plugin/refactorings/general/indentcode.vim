" Synopsis:
"   Indent current file 
function! IndentProject()
  try
    :execute 'normal gg=G'
  catch
    echo v:exception
    return
  endtry
endfunction
