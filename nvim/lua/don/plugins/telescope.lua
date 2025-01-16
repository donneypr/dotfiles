return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons", -- Add file type icons
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    -- or create your custom action
    local custom_actions = transform_mod({
      open_qflist = function(prompt_bufnr)
        actions.send_selected_to_qflist(prompt_bufnr)
        vim.cmd("copen")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" }, -- Show smartly shortened paths
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- Move to previous result
            ["<C-j>"] = actions.move_selection_next, -- Move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_qflist, -- Send results to quickfix list and open it
          },
        },
        layout_strategy = "center", -- Center the Telescope window
        layout_config = {
          width = 0.8, -- Set width to 80% of the screen
          height = 0.6, -- Set height to 60% of the screen
        },
      },
      pickers = {
        find_files = {
          theme = "ivy", -- Keep 'ivy' theme for find_files picker
        },
      },
      extensions = {
        fzf = {}, -- Enable fzf extension
      },
    })

    telescope.load_extension("fzf")

    -- Key mappings
    local keymap = vim.keymap -- For conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end,
}
