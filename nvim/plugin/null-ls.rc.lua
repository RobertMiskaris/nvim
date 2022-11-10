local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS

local overrides = {
    severities = {
        error = h.diagnostics.severities["error"],
        warning = h.diagnostics.severities["warning"],
        note = h.diagnostics.severities["information"],
    },
}

local my_mypy = {
    name = "my_mypy",
    meta = {
        url = "https://github.com/python/mypy",
        description = [[Mypy is an optional static type checker for Python that aims to combine the
benefits of dynamic (or "duck") typing and static typing.]],
    },
    method = DIAGNOSTICS,
    filetypes = { "python" },
    generator_opts = {
        command = "mypy",
        args = function(params)
            return {
                "--hide-error-codes",
                "--hide-error-context",
                "--no-color-output",
                "--show-column-numbers",
                "--show-error-codes",
                "--no-error-summary",
                "--no-pretty",
                "--shadow-file",
                params.bufname,
                params.temp_path,
                params.bufname,
            }
        end,
        to_temp_file = true,
        format = "line",
        check_exit_code = function(code)
            return code <= 2
        end,
        multiple_files = true,
        on_output = h.diagnostics.from_patterns({
            -- see spec for pattern examples
            {
                pattern = "([^:]+):(%d+):(%d+): (%a+): (.*)  %[([%a-]+)%]",
                groups = { "filename", "row", "col", "severity", "message", "code" },
                overrides = overrides,
            },
            -- no error code
            {
                pattern = "([^:]+):(%d+):(%d+): (%a+): (.*)",
                groups = { "filename", "row", "col", "severity", "message" },
                overrides = overrides,
            },
            -- no column or error code
            {
                pattern = "([^:]+):(%d+): (%a+): (.*)",
                groups = { "filename", "row", "severity", "message" },
                overrides = overrides,
            },
        }),
        cwd = h.cache.by_bufnr(function(params)
            return u.root_pattern(
                -- https://mypy.readthedocs.io/en/stable/config_file.html
                "mypy.ini",
                ".mypy.ini",
                "pyproject.toml",
                "setup.cfg"
            )(params.bufname)
        end),
    },
    factory = h.generator_factory,
	id = 1,
}


local query = {
    name = "my_mypy", -- string
	method = null_ls.methods.DIAGNOSTICS,
	id = 1
}



-- null_ls.register(my_mypy)


local sources = {
	null_ls.builtins.diagnostics.flake8.with({
		prefer_local = "venv/bin",
		filetypes = { "python" },
		args = { "--format", "default", "--stdin-display-name", "$FILENAME", "-" },
		diagnostics_format = "[flake8] #{m}\n(#{c})",
	}),
	null_ls.builtins.diagnostics.mypy.with({
		prefer_local = "venv/bin",
		filetypes = { "python" },
		diagnostics_format = "[mypy] #{m}\n(#{c})",
		id = 1,
		method = null_ls.methods.DIAGNOSTICS,
		condition = function(utils)
			return utils.root_has_file({ "pyproject.toml" })
		end,
        check_exit_code = function(code)
            return true
        end,

	}),
	null_ls.builtins.diagnostics.zsh,
}

null_ls.setup({
	sources = sources,
	debug=true
})

vim.api.nvim_create_user_command("NullLsToggle", function()
	-- you can also create commands to disable or enable sources
	null_ls.toggle(query)
	print(null_ls.get(query))
end, {})
