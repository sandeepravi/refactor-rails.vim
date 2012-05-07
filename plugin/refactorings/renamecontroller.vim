" Synopsis:
"   Rename current controller along with corresponding files
function! RenameController()
  try

    let newcontroller = common#get_input("Controller name: ", "ERROR:: Enter a controller name." )
  catch
    echo v:exception
    return
  endtry

  " Rename Rails Controller

  " Rename controller filename
  let path = common#get_controller_path()
  let newcontrollerpath = path.common#controller(newcontroller)
  let oldcontrollerpath = path.common#controller(split(common#get_file_name(), ".rb")[0])
  call common#move(oldcontrollerpath, newcontrollerpath)

  " Rename helper filename
  let path = common#get_helper_path()
  let newhelperpath = path.common#helper(newcontroller)
  let oldhelperpath = path.common#helper(split(common#get_file_name(), ".rb")[0])
  call common#move(oldcontrollerpath, newcontrollerpath)
  "
  " Rename views folder
  "
  " Rename helper Classname
  "
  " Rename Controller Classname

endfunction
