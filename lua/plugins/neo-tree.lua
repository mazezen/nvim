return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle left<cr>", desc = "Toggle Neo-Tree" },
    { "<leader>o", "<cmd>Neotree focus left<cr>", desc = "Focus Neo-Tree" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        hijack_netrw_behavior = "open_current",
        follow_current_file = { enabled = true, leave_dirs_open = false },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { ".git" },
        },
        use_libuv_file_watcher = true,
      },
      win = {
        position = "left",
        width = 35,
      },
    })

    -- === 启动时自动打开左侧目录树（完美兼容 nvim .）===
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("Neotree reveal left")
      end,
    })
  end,
}