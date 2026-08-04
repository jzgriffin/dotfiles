vim.api.nvim_create_user_command("VG",
  function(args)
    local cmd = "vertical Git"
    if args["args"] then
      cmd = cmd .. " " .. args["args"]
    end
    vim.cmd(cmd)
  end,
  { desc = "Open Git vertically", nargs = "*" })

vim.api.nvim_create_user_command("VGS",
  function(args)
    local cmd = "VG show"
    if args["args"] then
      cmd = cmd .. " " .. args["args"]
    end
    vim.cmd(cmd)
  end,
  { desc = "Open Git show vertically", nargs = "*" })
