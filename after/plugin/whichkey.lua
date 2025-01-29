local wk = require("which-key")

wk.add({
    { "<leader>d", group = "Debugger"},
    { "<leader>g", group = "Git"},
    { "<leader>p", group = "Project Search"},
    { "<leader>r", group = "Remove", icon = { icon = "⌫", color = "red"} },
    { "<leader>t", group = "Toggle"},
    { "<leader>_", group = "Comment", icon = { icon="//", color = "orange"}},
    { "<leader>v", icon = { icon = "", color="yellow" } },
    { "<leader>h", icon = { icon = "", color = "grey" } },
    { "<leader>c", icon = { icon = "", color = "orange"} },
    { "<leader>a", icon = { icon = "", color = "green"} },
    { "<leader>n", icon = { icon = "󱏒", color = "azure"} },
    { "<leader>s", icon = { icon = "󰛔", color = "azure"} },
    { "<leader>x", icon = { icon = "⌫", color = "red"} },
    { "<leader>rm", icon = { icon = "⌫", color = "red"} },
})

-- Color Reference: azure, blue, cyan, green, grey, orange, purple, red, yellow

