# Rails Refactoring Tool for Vim

This plugin will help you to refactor your code in Rails using some
simple commands.

Here are the features currently supported:

* :RenameInstanceVariable - <leader>riv

This command will help to Rename the Instance variable which is
currently highlighted.
Select the variable using the Visual Mode (V) and then enter the above
command to rename.

* :RenameLocalVariable - <leader>rv

This command will rename the local variable which is selected using the
Visual Mode.

* IndentFile - <leader>ic

This will indent the code in the current file. This command depends
upon ruby.vim

* MoveCurrentFile - <leader>mf

This will move the current file to another location which you will be
propmted to enter.

* CopyCurrentFile - <leader>cf

This will copy the current file to another location which you will be
prompted to enter.

* Rename Controller - <leader>rc

This command will rename the current controller and all the associated
files like helpers / test cases etc.

* Extract Method - <leader>em

This command helps to extract a portion of code selected using visual
mode (V) into another method.

* Inline Variable - <leader>iv

This command will replace any occurrence of a local variable that is not
necessary by selecting the code that needs to be replaced.
