-- https://github.com/catppuccin/nvim

return {
  "catppuccin/nvim",
  name = "catppuccin", -- 可选，但推荐（便于引用）
  priority = 1000,     -- 颜色主题优先加载，避免闪烁
  config = function()
    require("catppuccin").setup({
      -- 这里可以自定义配置，默认就很好看
      flavour = "macchiato", -- 可选: latte, frappe, macchiato, mocha（默认 auto）
      transparent_background = false, -- 是否透明背景
      integrations = {
        rainbow_delimiters = true,  -- 加这行
        -- 自动集成常见插件，如果你安装了这些就会生效
        treesitter = true,
        native_lsp = true,
        gitsigns = true,
        telescope = true,
      },

      highlight_overrides = {
        all = function(colors)
          return {
            -- 关键字更亮（mauve 是紫色）
            ["@keyword"] = { fg = colors.mauve, style = { "bold" } },
            ["@function"] = { fg = colors.blue, style = { "bold" } },
            ["@variable"] = { fg = colors.text },
            ["@string"] = { fg = colors.green },
            -- 加更多见 :h treesitter-highlight-groups
          }
        end,
      },

    })

    -- 设置颜色主题（必须在 setup 之后）
    -- vim.cmd.colorscheme("catppuccin")
  end,
}
