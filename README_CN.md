# Logitech G Hub 鼠标手势

[**English**](README.md)

一个 Lua 脚本，让你在 macOS 上通过 Logitech G Hub 使用鼠标手势，为任何罗技游戏鼠标带来 Master 系列的功能。

本脚本借鉴了 Mark van den Berg 的 [g-hub-mouse-gestures] 项目，并在此基础上进行了修改，实现了类似罗技 Master 系列鼠标的浏览导航功能。

## 功能特性

- 🖱️ **多任务手势**: 按住手势键并滑动鼠标触发 macOS 手势操作
  - **向上**: 调度中心 Mission Control（Ctrl + 上箭头）
  - **向下**: 应用程序窗口（Ctrl + 下箭头）
  - **向左**: 向右移动一个空间（Ctrl + 右箭头）
  - **向右**: 向左移动一个空间（Ctrl + 左箭头）

- 🌐 **浏览器导航**: 专用按钮实现快速页面前进后退
  - **按钮 4**: 上一页（Ctrl + Cmd + 左）
  - **按钮 5**: 下一页（Ctrl + Cmd + 右）

- ⚙️ **高度可定制**: 轻松配置按键映射、手势灵敏度和快捷键组合

## 使用要求

- macOS 操作系统
- Logitech G Hub 软件
- 带有可编程按键的罗技鼠标

### 兼容鼠标列表

本脚本适用于 **所有能被 G Hub 识别的罗技鼠标**，包括但不限于：

✅ **完全支持（原生 G Hub 鼠标）**：
- G 系列游戏鼠标：G502、G304、G Pro、G403、G604、G703、G903 等
- 所有带可编程按键的罗技游戏鼠标

✅ **可能支持（需确认 G Hub 兼容性）**：
- 部分支持 G Hub 的 MX 系列鼠标（如 MX Master 3、MX Anywhere 3）
- 较新的支持 G Hub 的生产力鼠标

❌ **不兼容**：
- 仅支持 Logitech Options（非 G Hub）的鼠标
- 没有可编程按键的基础鼠标

**如何确认**：打开 G Hub，如果你的鼠标出现在设备列表中，就可以使用本脚本！

## 安装步骤

1. **下载并安装 Logitech G Hub**
   - 访问 [罗技 G Hub 下载页面](https://www.logitechg.com/zh-cn/innovation/g-hub.html)
   - 下载并安装软件
   - 启动 G Hub 并连接你的鼠标

2. **下载脚本文件**
   - 从本仓库下载 `MouseGestures.lua` 文件
   - 保存到 Mac 上任意方便的位置

3. **导入脚本到 G Hub**
   - 打开 Logitech G Hub
   - 选择你的鼠标设备
   - 进入 **配置** 标签页
   - 点击 **系统** → **脚本**
   - 点击 **编辑脚本** 按钮（或创建新的脚本槽位）
   - 复制并粘贴 `MouseGestures.lua` 的内容
   - 保存脚本

4. **启用脚本**
   - 确保脚本在 G Hub 中已启用
   - 脚本将在 G Hub 运行时自动执行

## 配置说明

你可以通过编辑 `MouseGestures.lua` 顶部的配置变量来自定义脚本：

### 按键映射
```lua
-- 手势按键映射（G1 = 1, G2 = 2, G3 = 3，以此类推）
gestureButtonNumber = 3;

-- 导航按键映射（G4 = 4, G5 = 5，以此类推）
navigationNextButtonNumber = 5;  -- 前进导航
navigationPreButtonNumber = 4;   -- 后退导航
```

### 手势灵敏度
```lua
-- 鼠标移动多少像素才能识别为手势
minimalHorizontalMovement = 100;  -- 水平最小移动距离
minimalVerticalMovement = 100;    -- 垂直最小移动距离
```

### 功能开关
```lua
missionControlEnabled = true          -- 调度中心（向上滑动）
applicationWindowsEnabled = true      -- 应用程序窗口（向下滑动）
moveBetweenSpacesEnabled = true      -- 切换空间（左右滑动）
browserNavigationEnabled = true       -- 浏览器导航按钮
```

### 调试模式
```lua
debuggingEnabeld = false  -- 设置为 true 可在 G Hub 控制台查看调试信息
```

## 使用方法

1. **手势模式**: 按住手势按键（默认 G3），向任意方向移动鼠标，然后松开
   - 脚本会根据移动方向触发相应的操作

2. **浏览器导航**: 直接点击导航按钮（默认 G4/G5）实现快速前进后退

## 自定义技巧

### 修改快捷键组合

要修改手势对应的快捷键，可以编辑相应的函数：

```lua
-- 示例：将调度中心从 Ctrl+Up 改为 Cmd+F3
function performMissionControlGesture()
    firstKey = "lgui"  -- lgui = 左 Command 键
    secondKey = "f3"
    pressTwoKeys(firstKey, secondKey)
end
```

### 按键名称参考
- `lctrl` / `rctrl` - 左/右 Control
- `lgui` / `rgui` - 左/右 Command (⌘)
- `lalt` / `ralt` - 左/右 Option (⌥)
- `lshift` / `rshift` - 左/右 Shift
- `up`, `down`, `left`, `right` - 方向键
- `f1` - `f12` - 功能键

## 常见问题

**脚本无法工作：**
- 确保 G Hub 正在运行
- 验证脚本已在 G Hub 中启用
- 检查按键编号是否与你的鼠标配置匹配
- 启用调试模式查看控制台输出

**手势过于灵敏/不灵敏：**
- 调整 `minimalHorizontalMovement` 和 `minimalVerticalMovement` 的值
- 增大数值降低灵敏度，减小数值提高灵敏度

**按下了错误的按键：**
- 确认按键名称与 Logitech 脚本 API 匹配
- 检查调试控制台的错误信息

## 致谢

- 原始灵感和 Windows 实现: [LogitechMouseGestures](https://github.com/wookiefriseur/LogitechMouseGestures) by wookiefriseur
- macOS 适配版本: [g-hub-mouse-gestures] by Mark van den Berg
- 浏览器导航增强: 本仓库

## 开源协议

你可以自由使用、修改和分发此脚本。

## 贡献

欢迎提交 Issue 和 Pull Request！如果你有改进建议或发现 bug，请告诉我。

---

## 更多

- [作者博客](https://www.jianshu.com/u/e1fee33c72bc)

---

**享受你增强版的罗技鼠标吧！🎯**

<!-- external links -->
[g-hub-mouse-gestures]: https://github.com/mark-vandenberg/g-hub-mouse-gestures
