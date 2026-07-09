return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- only starts tracking once you open an actual file
  opts = {
    -- default options are sensible, but explicit for clarity
    dir = vim.fn.stdpath("state") .. "/sessions/", -- where sessions are stored
  },
  keys = {
    {
      "<leader>qs",
      function() require("persistence").load() end,
      desc = "Restore last session for current dir",
    },
    {
      "<leader>ql",
      function() require("persistence").load({ last = true }) end,
      desc = "Restore last session (any dir)",
    },
    {
      "<leader>qd",
      function() require("persistence").stop() end,
      desc = "Don't save session on exit",
    },
  },
}
