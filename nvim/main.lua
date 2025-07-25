local header_art2 =
[[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

local header_art =
[[
 ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
 ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
 ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
 ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
 ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
 ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
]]

-- using the mini plugins

-- require("mason").setup()
-- require("mason-nvim-dap").setup()

require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
require('dap-python').test_runner = 'pytest'
--

require("dapui").setup()

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
--    require("neotest-plenary"),
--    require("neotest-vim-test")({
--      ignore_file_types = { "python", "vim", "lua" },
--    }),
  },
})



-- local null_ls = require("null-ls")

--null_ls.setup({
--    sources = {
--        null_ls.builtins.formatting.stylua,
--        null_ls.builtins.completion.spell,
--        require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
--    },
--})
--
--local no_really = {
--    method = null_ls.methods.DIAGNOSTICS,
--    filetypes = { "markdown", "text" },
--    generator = {
--        fn = function(params)
--            local diagnostics = {}
--            -- sources have access to a params object
--            -- containing info about the current file and editor state
--            for i, line in ipairs(params.content) do
--                local col, end_col = line:find("really")
--                if col and end_col then
--                    -- null-ls fills in undefined positions
--                    -- and converts source diagnostics into the required format
--                    table.insert(diagnostics, {
--                        row = i,
--                        col = col,
--                        end_col = end_col + 1,
--                        source = "no-really",
--                        message = "Don't use 'really!'",
--                        severity = vim.diagnostic.severity.WARN,
--                    })
--                end
--            end
--            return diagnostics
--        end,
--    },
--}
--
--null_ls.register(no_really)


-- Utilities for creating configurations
require('mini.sessions').setup({
  -- Whether to read latest session if Neovim opened without file arguments
  autoread = false,
  -- Whether to write current session before quitting Neovim
  autowrite = false,
  -- Directory where global sessions are stored (use `''` to disable)
  directory =  '~/.vim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
  -- File for local session (use `''` to disable)
  file = '' -- 'Session.vim',
})

local starter = require('mini.starter')
starter.setup({
  -- evaluate_single = true,
  items = {
    starter.sections.sessions(77, true),
    starter.sections.builtin_actions(),
  },
  content_hooks = {
    function(content)
      local blank_content_line = { { type = 'empty', string = '' } }
      local section_coords = starter.content_coords(content, 'section')
      -- Insert backwards to not affect coordinates
      for i = #section_coords, 1, -1 do
        table.insert(content, section_coords[i].line + 1, blank_content_line)
      end
      return content
    end,
    starter.gen_hook.adding_bullet("» "),
    starter.gen_hook.aligning('center', 'center'),
  },
  header = header_art,
  footer = '',
})

local DEFAULT_SETTINGS = {

    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,

    ui = {
        -- Whether to automatically check for outdated servers when opening the UI window.
        check_outdated_servers_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",

        icons = {
            -- The list icon to use for installed servers.
            server_installed = "◍",
            -- The list icon to use for servers that are pending installation.
            server_pending = "◍",
            -- The list icon to use for servers that are not installed.
            server_uninstalled = "◍",
        },
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install the server under the current cursor position
            install_server = "i",
            -- Keymap to reinstall/update the server under the current cursor position
            update_server = "u",
            -- Keymap to check for new version for the server under the current cursor position
            check_server_version = "c",
            -- Keymap to update all installed servers
            update_all_servers = "U",
            -- Keymap to check which installed servers are outdated
            check_outdated_servers = "C",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    },

    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with server installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
    -- servers that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,

    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
}


vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Показать диагностику" })


--vim.o.updatetime = 250
--vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--  callback = function()
--    vim.diagnostic.open_float(nil, { focus = false })
--  end,
--})

