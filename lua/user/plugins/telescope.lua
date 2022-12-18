-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    prompt_prefix = "  ",
    -- layout_config = {
    --   horizontal = {
    --     prompt_position = "top",
    --   },
    --   vertical = {
    --     mirror = false,
    --   },
    --   width = 0.7,
    --   height = 0.50,
    --   preview_cutoff = 120,
    -- },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    preview = {
      -- disable preview window
      hide_on_startup = true,
    },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        ["<esc>"] = actions.close,
      },
    },
  },
})

telescope.load_extension("fzf")
