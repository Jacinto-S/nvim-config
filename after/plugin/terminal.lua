local terminal_buf = nil

function ToggleTerminal()
  if terminal_buf and vim.fn.bufexists(terminal_buf) == 1 then
    local win_id = vim.fn.bufwinnr(terminal_buf)
    if win_id ~= -1 then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
      vim.cmd(win_id .. "wincmd c")
    else
      vim.cmd("sbuffer " .. terminal_buf)
      vim.cmd("startinsert")
    end
  else
    vim.cmd("new | terminal")
    terminal_buf = vim.fn.bufnr("%")
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end
end
