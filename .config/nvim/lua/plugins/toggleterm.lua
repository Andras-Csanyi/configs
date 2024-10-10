return {
  "akinsho/toggleterm.nvim",
  config = true,
  cmd = "ToggleTerm",
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
  },
  opts = {
    direction = "float",
    insert_mappings = true,
    terminal_mappings = true,
    start_in_insert = true,
    close_on_exit = true,
  },
}
