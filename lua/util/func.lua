-- 遍历文件夹下的所有文件，并返回路径列表
function GetAllFile(path)
  local file_paths = {}                              -- 文件路径列表
  local cmd = string.format('find %q -type f', path) -- shell 命令
  local handle = io.popen(cmd)                       -- 执行 shell 命令并获取输出
  local result = handle:read("*a")                   -- 读取输出
  handle:close()
  for file_path in result:gmatch("[^\n]+") do
    table.insert(file_paths, file_path)
  end
  return file_paths
end

--判断文件或者文件夹是否存在
IsExists = function(path)
  local file = io.open(path, "rb")
  if file then
    io.close(file)
    return true
  else
    return false
  end
end

IsEnableNum = function()
  if vim.o.number == true then
    vim.o.relativenumber = false
    vim.o.number = false
  else
    vim.o.number = true
    vim.o.relativenumber = true
  end
end
