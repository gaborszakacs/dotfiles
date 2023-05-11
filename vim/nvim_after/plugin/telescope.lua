local actions = require("telescope.actions")
require('telescope').setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.99,
        preview_cutoff = 40,
        prompt_position = "bottom",
        width = 0.99,
        results_height = 15,
      }
    },
    mappings = {
      i = {
        -- otherwise two esc needed (firs quitting insert mode)
        ["<esc>"] = actions.close,
      },
    },
  },
})
require('telescope').load_extension('fzf')
