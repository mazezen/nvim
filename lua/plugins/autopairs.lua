return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",  -- 进入插入模式时加载
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,               -- 使用 Treesitter 
      disable_filetype = { "TelescopePrompt", "vim" },  -- 在这些文件类型禁用
      fast_wrap = {},                -- 快速包裹选中文字：输入 ( 后按 <M-e>（Alt+e）
      map_cr = true,                 -- 回车时自动补全括号内换行
      map_bs = true,                 -- 退格智能删除成对括号
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
