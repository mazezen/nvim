return {
  "mbbill/undotree",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },  -- 空格 u 打开/关闭
  },
  config = function()
    -- 可选美化设置
    vim.g.undotree_WindowLayout = 2          -- 布局：历史树在左，diff 在下
    vim.g.undotree_ShortIndicators = 1       -- 用简短时间显示（如 1s ago）
    vim.g.undotree_SetFocusWhenToggle = 1    -- 打开时自动聚焦到 undotree 窗口
    vim.g.undotree_HelpLine = 0              -- 关闭顶部帮助行（更简洁）
  end,
}