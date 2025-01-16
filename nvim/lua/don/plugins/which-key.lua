return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Lazy-load on a specific event
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- Custom configuration or leave it empty for defaults
    plugins = {
      spelling = {
        enabled = true,
      },
    },
    window = {
      border = "rounded",
    },
  },
  config = function()
    -- Empty config function to satisfy Lazy.nvim
  end,
}

