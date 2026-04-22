--[[
  罗技鼠标手势脚本 v0.8
  作者：Mark van den Berg（原作者）
  修改：添加浏览器导航功能
  
  功能：
  1. 手势控制 macOS 多任务（Mission Control、应用窗口、切换空间）
  2. 侧键快速浏览器前进后退
  3. 完全自定义配置
]]--

-- ==================== 配置区 ==================== 


-- 按键映射（G1 = 1, G2 = 2, G3 = 3，以此类推）
gestureButtonNumber = 3;   -- 手势按键
navigationNextButtonNumber = 5;   -- 前进按键
navigationPreButtonNumber = 4;   -- 后退按键

-- 手势灵敏度（像素）
minimalHorizontalMovement = 100;   -- 水平最小移动距离
minimalVerticalMovement = 100;   -- 垂直最小移动距离

-- 默认值（用于计算鼠标移动距离）
horizontalStartingPosistion = 0;   -- 水平起始位置
verticalStartingPosistion = 0;   -- 垂直起始位置
horizontalEndingPosistion = 0;   -- 水平结束位置
verticalEndingPosistion = 0;   -- 垂直结束位置

-- 按键延迟（毫秒）
delay = 20;

-- 功能开关
missionControlEnabled = true   -- 调度中心
applicationWindowsEnabled = true   -- 应用窗口
moveBetweenSpacesEnabled = true   -- 切换空间
browserNavigationEnabled = true   -- 浏览器导航

-- 调试开关
debuggingEnabeld = false

-- ==================== 事件检测 ====================


function OnEvent(event, arg, family)
	-- 鼠标按键按下事件检测
	if event == "MOUSE_BUTTON_PRESSED" and (arg == gestureButtonNumber or arg == navigationNextButtonNumber or arg == navigationPreButtonNumber) then
		if debuggingEnabeld then OutputLogMessage("\nEvent: " .. event .. " for button: " .. arg .. "\n") end
		-- 处理浏览器导航
		if arg == navigationNextButtonNumber and browserNavigationEnabled then 
		       performNextPageGesture()
	       end
	       
	       if arg == navigationPreButtonNumber and browserNavigationEnabled then 
		       performPreviousPageGesture()
	       end
		
		
		-- 获取鼠标起始位置
		horizontalStartingPosistion, verticalStartingPosistion = GetMousePosition()
		
		if debuggingEnabeld then 
			OutputLogMessage("Horizontal starting posistion: " .. horizontalStartingPosistion .. "\n") 
			OutputLogMessage("Vertical starting posistion: " .. verticalStartingPosistion .. "\n") 
		end
	end

	-- 鼠标按键释放事件检测
	if event == "MOUSE_BUTTON_RELEASED" and (arg == gestureButtonNumber) then
		if debuggingEnabeld then OutputLogMessage("\nEvent: " .. event .. " for button: " .. arg .. "\n") end
		
		-- 获取鼠标结束位置
		horizontalEndingPosistion, verticalEndingPosistion = GetMousePosition()
		
		if debuggingEnabeld then 
			OutputLogMessage("Horizontal ending posistion: " .. horizontalEndingPosistion .. "\n") 
			OutputLogMessage("Vertical ending posistion: " .. verticalEndingPosistion .. "\n") 
		end

		-- 计算起始位置和结束位置的差值
		horizontalDifference = horizontalStartingPosistion - horizontalEndingPosistion
		verticalDifference = verticalStartingPosistion - verticalEndingPosistion

		-- 判断鼠标移动方向和移动距离是否足够
		if horizontalDifference > minimalHorizontalMovement then mouseMovedLeft(arg) end
		if horizontalDifference < -minimalHorizontalMovement then mouseMovedRight(arg) end
		if verticalDifference > minimalVerticalMovement then mouseMovedDown(arg) end
		if verticalDifference < -minimalVerticalMovement then mouseMovedUp(arg) end
	end
end

-- ==================== 方向处理函数 ====================

-- 鼠标向上移动事件处理函数
function mouseMovedUp(buttonNumber)
	if debuggingEnabeld then OutputLogMessage("mouseMovedUp\n") end
	
	if buttonNumber == gestureButtonNumber and missionControlEnabled then 
		performMissionControlGesture()
	end
end

-- 鼠标向下移动事件处理函数
function mouseMovedDown(buttonNumber)
	if debuggingEnabeld then OutputLogMessage("mouseMovedDown\n") end
	
	if buttonNumber == gestureButtonNumber and applicationWindowsEnabled then 
		performApplicationWindowsGesture()
	end
end

-- 鼠标向左移动事件处理函数
function mouseMovedLeft(buttonNumber)
	if debuggingEnabeld then OutputLogMessage("mouseMovedLeft\n") end
	
	if buttonNumber == gestureButtonNumber and moveBetweenSpacesEnabled then 
		performSwipeRightGesture()
	end
end

-- 鼠标向右移动事件处理函数
function mouseMovedRight(buttonNumber)
	if debuggingEnabeld then OutputLogMessage("mouseMovedRight\n") end
	
	if buttonNumber == gestureButtonNumber and moveBetweenSpacesEnabled then 
	       performSwipeLeftGesture()
	end
end

-- ==================== 手势功能实现 ====================

-- Mission Control（Ctrl + Up）
function performMissionControlGesture()
	if debuggingEnabeld then OutputLogMessage("performMissionControlGesture\n") end
	firstKey = "lctrl"
	secondKey = "up"
	pressTwoKeys(firstKey, secondKey)
end

-- 应用程序窗口（Ctrl + Down）
function performApplicationWindowsGesture()
	if debuggingEnabeld then OutputLogMessage("performApplicationWindowsGesture\n") end
	firstKey = "lctrl"
	secondKey = "down"
	pressTwoKeys(firstKey, secondKey)
end

-- 向左切换空间（Ctrl + Right）
function performSwipeLeftGesture()
	if debuggingEnabeld then OutputLogMessage("performSwipeLeftGesture\n") end
	firstKey = "lctrl"
	secondKey = "right"
	pressTwoKeys(firstKey, secondKey)
end

-- 向右切换空间（Ctrl + Left）
function performSwipeRightGesture()
	if debuggingEnabeld then OutputLogMessage("performSwipeRightGesture\n") end
	firstKey = "lctrl"
	secondKey = "left"
	pressTwoKeys(firstKey, secondKey)
end

-- ==================== 浏览器导航 ====================

-- 前进手势（Ctrl + Command + Right）
function performNextPageGesture()
	if debuggingEnabeld then OutputLogMessage("performNextPageGesture\n") end
	firstKey = "lctrl"
	secondKey = "lgui"
	thirdKey = "right"
	pressThreeKeys(firstKey, secondKey, thirdKey)
end

-- 后退手势（Ctrl + Command + Left）
function performPreviousPageGesture()
	if debuggingEnabeld then OutputLogMessage("performPreviousPageGesture\n") end
	firstKey = "lctrl"
	secondKey = "lgui"
	thirdKey = "left"
	pressThreeKeys(firstKey, secondKey, thirdKey)
end

-- ==================== 辅助函数 ====================

-- 按下两个按键
function pressTwoKeys(firstKey, secondKey)
	PressKey(firstKey)
	Sleep(delay)
	PressKey(secondKey)
	Sleep(delay)
	ReleaseKey(firstKey)
	ReleaseKey(secondKey)
end

-- 按下三个按键
function pressThreeKeys(firstKey, secondKey, thirdKey)
    PressKey(firstKey)
	Sleep(delay)
	PressKey(secondKey)
	Sleep(delay)
	PressKey(thirdKey)
	Sleep(delay)
	ReleaseKey(firstKey)
	ReleaseKey(secondKey)
	ReleaseKey(thirdKey)
end
