StarterGui
└── ScreenGui
    └── TextButton (ชื่อว่า MarcoButton)
        └── LocalScript
local button = script.Parent
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local isActive = false
local looping = false

button.Text = "Marco"

-- ฟังก์ชันสำหรับกด shift รัว ๆ
local function pressShiftLoop()
	while isActive do
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
		wait(0.1)  -- ปรับความเร็วได้ เช่น 0.05 = เร็วขึ้น
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
		wait(0.1)
	end
end

-- เมื่อปุ่มถูกคลิก
button.MouseButton1Click:Connect(function()
	isActive = not isActive
	
	if isActive then
		button.Text = "Marco ON"
		if not looping then
			looping = true
			task.spawn(function()
				pressShiftLoop()
				looping = false
			end)
		end
	else
		button.Text = "Marco OFF"
	end
end)
