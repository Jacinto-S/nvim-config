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
        local opts = {buffer = event.buf, noremap = true}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', vim.tbl_extend('force', opts, { desc = 'Show hover information' }))
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', vim.tbl_extend('force', opts, { desc = 'Go to desclaration' }))
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', vim.tbl_extend('force', opts, { desc = 'Go to type definition' }))
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', vim.tbl_extend('force', opts, { desc = 'Find references' }))
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', vim.tbl_extend('force', opts, { desc = 'Show signature help' }))
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', vim.tbl_extend('force', opts, { desc = 'Format document' }))
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', vim.tbl_extend('force', opts, { desc = 'Show code actions' }))
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
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})

-- Disable spell checks:
require('lspconfig').harper_ls.setup {
    settings = {
        ["harper-ls"] = {
            linters = {
                spell_check = false,
                spelled_numbers = false,
                an_a = true,
                sentence_capitalization = false,
                unclosed_quotes = true,
                wrong_quotes = false,
                long_sentences = false,
                repeated_words = true,
                spaces = true,
                matcher = true,
                correct_number_suffix = true,
                number_suffix_capitalization = true,
                multiple_sequential_pronouns = true,
                linking_verbs = false,
                avoid_curses = false,
                terminating_conjunctions = true
            }
        }
    },
}
require('lspconfig').ltex.setup{
    settings = {
        ltex = {
            disabledRules = {
              ["en"]    = { "MORFOLOGIK_RULE_EN",    "UPPERCASE_SENTENCE_START" },
              ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU", "UPPERCASE_SENTENCE_START" },
              ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA", "UPPERCASE_SENTENCE_START" },
              ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB", "UPPERCASE_SENTENCE_START" },
              ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ", "UPPERCASE_SENTENCE_START" },
              ["en-US"] = { "MORFOLOGIK_RULE_EN_US", "UPPERCASE_SENTENCE_START" },
              ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA", "UPPERCASE_SENTENCE_START" },
              ["es"]    = { "MORFOLOGIK_RULE_ES",    "UPPERCASE_SENTENCE_START" },
              ["it"]    = { "MORFOLOGIK_RULE_IT_IT", "UPPERCASE_SENTENCE_START" },
              ["de"]    = { "MORFOLOGIK_RULE_DE_DE", "UPPERCASE_SENTENCE_START" },
            }
        }
    }
}
