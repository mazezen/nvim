# Neovim

## 安装

> brew install neovim
>
> cd ~/.config && git clone repo

## 效果
[!./xg.png](./xg.png)

完成了一个 Neovim 配置，具备以下核心功能：

- Catppuccin 主题（macchiato 口味）
- Treesitter 高亮 + 缩进
- Telescope 模糊搜索
- Neo-Tree 左侧目录树（带图标）
- LSP 智能补全 + 诊断 + 跳转
- nvim-cmp 补全菜单
- nvim-autopairs 自动括号
- Undotree 可视化撤回历史
- Delve + nvim-dap-go Go 程序调试
- 常用快捷键统一以 `<leader>`（空格键）开头

---

## 基础设置

- **Leader 键**：`空格键`（所有 `<leader>` 快捷键都以空格开头）
- **行号**：已开启绝对 + 相对行号混合模式
- **缩进**：2 个空格（expandtab, shiftwidth=2）
- **字体要求**：终端必须使用 **Nerd Font**（推荐 JetBrainsMono Nerd Font）以显示图标

---

## 核心快捷键一览表

### 通用操作

| 快捷键     | 功能                             | 说明                            |
| ---------- | -------------------------------- | ------------------------------- |
| `u`        | 撤回（Undo）                     | 连续按多次撤回多步              |
| `Ctrl + r` | 重做（Redo）                     | 撤回过头时恢复                  |
| `yy` / `Y` | 复制当前行                       | 然后 `p` 粘贴下方，`P` 粘贴上方 |
| `yyp`      | 快速复制当前行到下方             | 最常用组合                      |
| `gd`       | 跳转到定义（Go to Definition）   | LSP 支持语言有效                |
| `gr`       | 查找所有引用（Go to References） | Telescope 列表显示              |
| `gi`       | 跳转到实现                       |                                 |
| `K`        | Hover 查看文档/签名              | 光标在符号上按 K                |
| `Ctrl + o` | 返回上一个跳转位置               | 跳转后必备！                    |
| `Ctrl + i` | 前进到下一个跳转位置             |                                 |

### Leader 快捷键（空格 + ...）

| 快捷键       | 功能                            | 说明                                   |
| ------------ | ------------------------------- | -------------------------------------- |
| `<leader>e`  | 开关左侧目录树（Neo-Tree）      | 启动时默认打开，再按关闭               |
| `<leader>o`  | 聚焦到左侧目录树                | 光标跳到树上，便于浏览                 |
| `<leader>f`  | 格式化当前文件（LSP formatter） | Go 用 gofmt，Lua 用 lua_ls 等          |
| `<leader>r`  | 运行当前文件（自定义）          | 支持 Go/Python/JS/Lua 等（见下方说明） |
| `<leader>b`  | 设置/取消断点（调试用）         |                                        |
| `<leader>du` | 开关调试 UI（dap-ui）           |                                        |
| `<leader>dt` | 调试最近的测试函数（Go）        | 光标在测试函数附近                     |
| `<leader>rn` | 重命名符号（LSP）               |                                        |
| `<leader>ca` | Code Action（快速修复）         | 报错处使用                             |
| `<leader>u`  | 打开 Undotree（可视化撤回历史） | 用 j/k 移动，回车恢复到该版本          |
| `<leader>e`  | 显示当前行诊断详情（浮窗）      | 报错行使用                             |
| `<leader>q`  | 把所有诊断放入 location list    |                                        |

### 调试快捷键（F 键）

| 快捷键 | 功能              |
| ------ | ----------------- |
| `F5`   | 开始/继续调试     |
| `F10`  | 步过（Step Over） |
| `F11`  | 步入（Step Into） |
| `F12`  | 步出（Step Out）  |

### 窗口切换

| 快捷键       | 功能                   |
| ------------ | ---------------------- |
| `Ctrl + h`   | 跳到左侧窗口（目录树） |
| `Ctrl + l`   | 跳到右侧窗口（编辑区） |
| `Ctrl + w w` | 在所有窗口间循环切换   |

### Telescope 搜索（强大模糊查找）

| 快捷键       | 功能                      |
| ------------ | ------------------------- |
| `<leader>ff` | 查找文件（find files）    |
| `<leader>fg` | 全局搜索文本（live grep） |
| `<leader>fb` | 切换 Buffer               |
| `<leader>fh` | 帮助标签                  |
| `<leader>fr` | 最近文件                  |
| `<leader>fk` | 查看所有快捷键            |

---

## 功能模块使用技巧

### 1. 目录树（Neo-Tree）

- 启动时自动打开左侧树，带文件类型图标（需 Nerd Font）
- 操作：
  - `j/k`：上下移动
  - `h`：折叠/返回上级
  - `l` / 回车：展开目录 / 打开文件
  - `a`：新建文件/目录
  - `d`：删除
  - `r`：重命名
  - `y`：复制路径

### 2. 代码补全（nvim-cmp + LSP）

- 输入时自动弹出补全菜单
- 上下箭头或 `Tab` / `Shift+Tab` 选择
- 回车确认
- `<C-Space>` 手动触发补全

### 3. Go 程序调试（Delve + dap-go）

1. 在想停的地方按 `<leader>b` 设置断点（左侧出现标记）
2. 按 `F5` 开始调试（或 `<leader>dt` 调试测试）
3. 程序停在断点：
   - `F10` 步过
   - `F11` 步入
   - `F12` 步出
   - 按 `<leader>du` 打开变量/栈/监视面板
4. Hover 变量查看值

### 4. Undotree 可视化撤回

- 按 `<leader>u` 打开左侧历史树
- `j/k` 移动到某个历史节点
- 按回车恢复到该版本
- 再按 `<leader>u` 关闭

### 5. 运行当前文件（自定义 <leader>r）

支持语言：

- Go → `go run %`
- Python → `python %`
- JavaScript/TypeScript → `node %`
- Lua → `lua %`
- Shell → `bash %`

---

## 常见问题排查

- **图标不显示** → 确认终端字体为 **JetBrainsMono Nerd Font**，并设置 Non-ASCII Font 相同
- **LSP 不工作** → `:LspInfo` 检查是否 attached
- **Treesitter 报错** → `:checkhealth nvim-treesitter`
- **调试不工作** → 确认已安装 `dlv`（`dlv version`）

---

## 结语

Neovim 现在已经是一个功能完整、体验优秀的现代编辑器，比很多 IDE 更轻更快！

常用组合推荐：

- 写代码 → `<leader>e` 看目录 → `gd` 跳转定义 → `K` 查看文档 → `<leader>b` + `F5` 调试
- 改错代码 → `u` 撤回 → `<leader>u` 用 Undotree 找回历史版本
- 搜索 → `<leader>ff` / `<leader>fg`
