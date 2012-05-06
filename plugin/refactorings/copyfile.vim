" Synopsis:
"   Copy current file
function! CopyCurrentFile()
  try
    let currentpath = common#get_file_path()

    let destination = common#get_input("Destination: ", "Enter destination path" )
  catch
    echo v:exception
    return
  endtry

  " Move file to destination path
  let newpath = common#move(currentpath, destination)

  " Open file in new location
  execute "e ".newpath
endfunction
