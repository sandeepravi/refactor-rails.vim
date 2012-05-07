# Rails Refactoring Tool for Vim


This is a simple vim plugin which helps in refactoring ruby on rails code.

I have been using vim for quite sometime now and I was quite happy with
using rails.vim plug a few other plugins for by Ruby and Rails based
projects until I tried out Redmine. Although, it hogs a lot of memory
and is quite slow, it's features are quite impressive; especially the
"refactor" features. And I like vim and wasn't ready to move to Redmine,
it decided to write the plugin which will help in refactoring Rails
applications.


Existing Features
=================

  vnoremap <leader>riv :RenameInstanceVariable<cr>
  vnoremap <leader>rv  :RenameLocalVariable<cr>
  noremap  <leader>ic  :IndentFile<cr>
  noremap  <leader>mf  :MoveCurrentFile<cr>
  noremap  <leader>cf  :CopyCurrentFile<cr>
  vnoremap <leader>em  :ExtractMethod<cr> 

Any of you having a doubt here, _vnoremap_ corresponds to mapping in the
visual mode and the rest are in normal mode. You can map these to any
other keys as per your needs.


Upcoming Features
=================

* Renaming Controllers
* Renaming Models
* Move code to callbacks

and quite a few others.


Contributing
============

Feel free to fork this project and contribute any features. Also, leave
a not in issues in case you have suggestions for any features, bugs etc.


Licencing
=========

Copyright &copy; 2012 [Sandeep Ravichandran](http://delusionalcode.wordpress.com), released under [MIT](http://github.com/jquery/jquery/blob/master/MIT-LICENSE.txt) license.
