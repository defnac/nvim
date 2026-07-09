return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { '<leader>gb', function() require('gitsigns').blame_line({ full = true }) end, desc = 'Git blame line' },
    { '<leader>gp', function() require('gitsigns').preview_hunk() end, desc = 'Preview git hunk (diff)' },
    { ']c', function() require('gitsigns').next_hunk() end, desc = 'Next git hunk' },
    { '[c', function() require('gitsigns').prev_hunk() end, desc = 'Previous git hunk' },
  },
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
  },
}
