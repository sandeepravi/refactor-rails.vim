" Synopsis:
"   Copy current file
function! CopyCurrentFile()
  try
    let currentpath = common#get_file_path()

    let destination = common#get_file_input("Destination: ", "Enter destination path" )
  catch
    echo v:exception
    return
  endtry

  " Copy file to destination path
  let newpath = common#copy(currentpath, destination)

  " Open file in new location
  execute "e ".newpath
endfunction
