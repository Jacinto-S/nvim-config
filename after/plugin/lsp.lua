-- Add Mason for automatic LSP installation
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',        -- Bash
        'clangd',        -- C
        'tailwindcss',   -- CSS
        'gradle_ls',     -- Gradle
        'html',          -- HTML
        'jdtls',         -- Java
        'eslint',        -- JavaScript / TypeScript
        'ltex',          -- Latex   
        'lua_ls',        -- Lua
        'marksman',      -- Markdown
        'pyright',       -- Python
        'rust_analyzer', -- Rust
    }
})

-- Reserve a space in the gutter (left of screen)
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp (provides basic default LSP config)
-- Configure before configuring language servers so 
-- extended capabilities are always applied.
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- Enable features that work if a language server is active in the loaded file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- Configure LSP servers using Mason
local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
    -- Default for all installed servers
    function(server_name)
        lspconfig[server_name].setup({})
    end,
    ['lua_ls'] = function()
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                },
            },
        })
    end,
})

-- Enable code completions
local cmp = require('cmp')

cmp.setup({
    sources = {
        {name = 'nvim_lsp'}, -- interface between cmp and LSP
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})
