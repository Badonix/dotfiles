local M = {
  filetype = {
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  command = "FormatWriteLock"
})

return M
