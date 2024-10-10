local ibl_status, ibl = pcall(require, "ibl")
if not ibl_status then
  return
end

ibl.setup()
