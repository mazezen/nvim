return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",  -- 插入模式加载
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",   -- LSP 来源
    "hrsh7th/cmp-buffer",     -- 缓冲区单词
    "hrsh7th/cmp-path",       -- 路径
    "saadparwaiz1/cmp_luasnip",  -- 片段（可选）
    "L3MON4D3/LuaSnip",       -- 片段引擎（可选但推荐）
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),  -- 手动触发补全
        ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- 回车确认
        ["<Tab>"] = cmp.mapping.select_next_item(),  -- Tab 选下一个
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),  -- Shift+Tab 上一个
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- LSP 最重要
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      win = {
        completion = cmp.config.window.bordered(),  -- 美化边框
        documentation = cmp.config.window.bordered(),
      },
    })
  end,
}
