--判断文件或者文件夹是否存在
IsExists=function(path)
  local file = io.open(path, "rb")
  if file then
    io.close(file)
    return true
  else
    return false
  end
end

IsEnableNum=function()

  if vim.o.number == true then
    vim.o.relativenumber=false
    vim.o.number = false
  else
    vim.o.number = true
    vim.o.relativenumber=true
  end
end

