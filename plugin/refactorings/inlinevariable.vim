function! InlineVariable()
  " Copy Variable into 'a' register
  " TODO: Copy without polluting register
  :normal "ayiw
  :normal 4diw
  " Delete into 'b' register
  :normal "bd$
  :normal dd
  :normal k$
  " Find next occurrence of variable
  exec '/\<'.@a.'\>'
  " Replace the occurrence with text
  exec ':.s/\<'.@a.'\>/'.@b
endfunction
