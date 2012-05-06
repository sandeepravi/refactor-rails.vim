" Synopsis:
"   Extract selection to a method
function! ExtractMethod()
  try
    let selection = common#get_visual_selection(1)

    let methodname = common#get_input("Enter method name: ", "No method name given!" )
  catch
    echo v:exception
    return
  endtry
  execute "normal c$".methodname
  execute "?def"
  execute "normal! Odef ".methodname."\n  ".selection."\nend\n"
  call IndentProject()
endfunction
