-- https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  branch = "master",  -- 使用最新 master 分支（telescope 很少发 release tag，推荐这样）
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- 可选：添加 fzf 扩展，大幅提升模糊搜索速度（强烈推荐）
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",  -- 如果你是 macOS/Linux；Windows 用户可能需要 cmake
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",     -- 好看的提示前缀
        selection_caret = " ",   -- 选中项前缀
        path_display = { "smart" },  -- 智能显示路径
        sorting_strategy = "ascending",  -- 从上到下排序
        layout_config = {
          horizontal = {
            prompt_position = "top",  -- 提示在上方
          },
        },
      },
      pickers = {
        -- 这里可以自定义特定 picker 的行为（可选）
        find_files = {
          hidden = true,  -- 显示隐藏文件（但仍尊重 .gitignore）
        },
        live_grep = {
          additional_args = { "--hidden" },  -- grep 时也搜索隐藏文件
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- 如果安装了 fzf 扩展，自动加载它
    pcall(telescope.load_extension, "fzf")
  end,

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  },
}
