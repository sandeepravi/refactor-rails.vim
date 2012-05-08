" Synopsis:
"   Rename current controller along with corresponding files
function! RenameController()
  try
    let newcontroller = common#get_input("Controller name: ", "ERROR:: Enter a controller name." )
  catch
    echo v:exception
    return
  endtry

  let file_name = common#get_file_name()

  " Rename Rails Controller

  " Rename Controller Classname
  "
  let controllername = common#get_class_name(split(file_name, ".rb")[0])
  let controllername = common#mixedcase(controllername)
  let newcname = common#controller(newcontroller)
  let newcname = common#mixedcase(split(newcname, ".rb")[0])
  let path = common#get_controller_path()
  let arg = 'args '.path."*"
  execute arg
  let arg = "argdo %s/".controllername."/".newcname."/ig"
  execute arg.' | update'
  "
  " Rename Helper Classname
  "
  let helpername = common#get_class_name(split(common#helper(split(file_name, "_controller.rb")[0]), ".rb")[0])
  let newhname = common#helper(newcontroller)
  let newhname = common#mixedcase(split(newhname, ".rb")[0])
  let path = common#get_controller_path()
  let arg = 'args '.common#get_helper_path()."*"
  execute arg
  let arg = "argdo %s/".helpername."/".newhname."/ig"
  execute arg.' | update'
  "
  " Rename controller filename
  let path = common#get_controller_path()
  let newcontrollerpath = path.common#controller(newcontroller)
  let oldcontrollerpath = path.common#controller(split(file_name, "_controller.rb")[0])
  call common#move(oldcontrollerpath, newcontrollerpath)
  exec 'e '.newcontrollerpath
  "
  " Rename helper filename
  "
  let path = common#get_helper_path()
  let newhelperpath = path.common#helper(newcontroller)
  let oldhelperpath = path.common#helper(split(file_name, "_controller.rb")[0])
  call common#move(oldhelperpath, newhelperpath)
  "
  " Rename views folder
  "
  let path = common#get_view_path()
  let newviewpath = path.common#view(newcontroller)
  let oldviewpath = path.common#view(split(file_name, "_controller")[0])
  call common#move(oldviewpath, newviewpath)
  "
  " Rename resource in routes
  "

endfunction
