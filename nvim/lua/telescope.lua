local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

require'telescope'.setup( {
  defaults = {
	  file_ignore_patterns = {
		  'node_modules/.*',
		  'venv/.*',
		  '__pycache__/.*',
		  '.git/.*',
		  'client/.*',
		  'data/.*',
		  'dist/.*'
	  },

  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },

})
