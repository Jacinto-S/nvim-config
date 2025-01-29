local autosession = require("auto-session")

if autosession.session_exists_for_cwd() then
    vim.cmd("SessionRestore")
    vim.cmd("NvimTreeOpen")
end

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
