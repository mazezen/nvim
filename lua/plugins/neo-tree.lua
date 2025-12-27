return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>fe", "<cmd>Neotree toggle left<cr>", desc = "Toggle Neo-Tree" },
    { "<leader>fo", "<cmd>Neotree focus left<cr>", desc = "Focus Neo-Tree" },
  },
  init = function()
    -- 只在启动时传入目录参数时，提前加载 Neo-Tree（让 hijack 生效）
    if vim.fn.argc(-1) == 1 then
      local arg = vim.fn.argv(0)
      local stat = vim.loop.fs_stat(arg)
      if stat and stat.type == "directory" then
        require("lazy").load({ plugins = { "neo-tree.nvim" } })
      end
    end
  end,
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
      window = {
        position = "left",
        width = 35,
      },
    })
  end,
}