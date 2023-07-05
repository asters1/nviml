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
