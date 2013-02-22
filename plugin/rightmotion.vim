" Right Motion - Use the motion, Luke!
"--------------------------------------------

" function! MoveRight(direction)

" endfunction
function! UpDown(direction)
  if !Includes(['j', 'k'], a:direction) | return | endif
  call add(g:motion_counts[a:direction], localtime())
  execute "normal g" . a:direction
endfunction

function! LeftRight(direction)
  if !Includes(['h', 'l'], a:direction) | return | endif
  " call UpdateTimestamps(a:direction)
  call add(g:motion_counts[a:direction], localtime())
  " if len(g:motion_counts[a:direction]) > 5
    " echoerr "Improper use of Vim motion"
    " " let g:motion_counts[a:direction] = []
    " return
  " endif
  let pos = NormalizedPos()
  if a:direction == 'h'
    let pos[1] -= 1
  elseif a:direction == 'l'
    let pos[1] += 1
  endif
  call cursor(pos)
endfunction

" function!

function! Includes(list, value)
  return index(a:list, a:value) != -1
endfunction

function! NormalizedPos()
  let pos=getpos('.')
  call remove(pos, 0)
  return pos
endfunction

let g:motion_counts = {'h': [], 'j': [], 'k': [], 'l': []}

nnoremap j :silent call UpDown('j')<cr>
nnoremap k :silent call UpDown('k')<cr>
nnoremap h :silent call LeftRight('h')<cr>
nnoremap l :silent call LeftRight('l')<cr>

" vim:ft=vim
