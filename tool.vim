"判断文件或者文件夹是否存在
func g:IsExists(path)
  if empty(glob(a:path))
    return 0
  else 
    return 1
  endif
endfunction

"判断是否启用了行号
function IsEnableNum()
  if &number
    set nonumber
    set norelativenumber
  else
    set number
    set relativenumber
  endif
endfunction
