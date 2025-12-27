return {
  "echasnovski/mini.icons",
  version = false,  -- 用最新版
  config = function()
    require("mini.icons").setup()
    -- 可选：模拟 nvim-web-devicons（让老插件兼容）
    MiniIcons.mock_nvim_web_devicons()
  end,
}