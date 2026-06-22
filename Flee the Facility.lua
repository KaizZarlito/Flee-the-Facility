-- [[ FLEE THE FACILITY EXPLOIT HUB v8.0 - PART 1 ]]
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

local defaults = {
	StandSpeed = 16,
	CrouchSpeed = 8,
	SilentHack = false,
	PlayerEsp = false,
	BeastEsp = false,
	ComputerEsp = false
}

local current = {
	StandSpeed = 16,
	CrouchSpeed = 8,
	SilentHack = false,
	PlayerEsp = false,
	BeastEsp = false,
	ComputerEsp = false
}

local connections = {}
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FTF_Premium_Menu_V8"
ScreenGui.Parent = CoreGui or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 260)
MainFrame.Position = UDim2.new(0.5, -240, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = false
MainFrame.Parent = ScreenGui

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "FTF HUB - PREMIUM v8.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 14
Title.Parent = TopBar

local ExitBtn = Instance.new("TextButton")
ExitBtn.Size = UDim2.new(0, 25, 0, 25)
ExitBtn.Position = UDim2.new(1, -30, 0, 2.5)
ExitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ExitBtn.Text = "X"
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.Font = Enum.Font.SourceSansBold
ExitBtn.TextSize = 14
ExitBtn.Parent = TopBar

local MiniBtn = Instance.new("TextButton")
MiniBtn.Size = UDim2.new(0, 25, 0, 25)
MiniBtn.Position = UDim2.new(1, -60, 0, 2.5)
MiniBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MiniBtn.Text = "-"
MiniBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniBtn.Font = Enum.Font.SourceSansBold
MiniBtn.TextSize = 14
MiniBtn.Parent = TopBar

local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 90, 0, 30)
OpenBtn.Position = UDim2.new(0, 15, 0, 15) 
OpenBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 100)
OpenBtn.Text = "OPEN MENU"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.TextSize = 12
OpenBtn.Visible = false
OpenBtn.Parent = ScreenGui

-- [[ FLEE THE FACILITY EXPLOIT HUB v8.0 - PART 2 ]]
local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Size = UDim2.new(0, 260, 0, 120)
ConfirmFrame.Position = UDim2.new(0.5, -130, 0.5, -60)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ConfirmFrame.BorderSizePixel = 1
ConfirmFrame.BorderColor3 = Color3.fromRGB(200, 50, 50)
ConfirmFrame.Visible = false
ConfirmFrame.ZIndex = 10
ConfirmFrame.Parent = ScreenGui

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Size = UDim2.new(1, 0, 0, 50)
ConfirmText.Position = UDim2.new(0, 0, 0, 10)
ConfirmText.Text = "Apakah kamu yakin ingin\nkeluar dari script sepenuhnya?"
ConfirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmText.BackgroundTransparency = 1
ConfirmText.Font = Enum.Font.SourceSansBold
ConfirmText.TextSize = 14
ConfirmText.ZIndex = 10
ConfirmText.Parent = ConfirmFrame

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0, 100, 0, 30)
SubmitBtn.Position = UDim2.new(0, 20, 0, 70)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
SubmitBtn.Text = "Submit"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.TextSize = 13
SubmitBtn.ZIndex = 10
SubmitBtn.Parent = ConfirmFrame

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0, 100, 0, 30)
NoBtn.Position = UDim2.new(1, -120, 0, 70)
NoBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
NoBtn.Text = "No"
NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoBtn.Font = Enum.Font.SourceSansBold
NoBtn.TextSize = 13
NoBtn.ZIndex = 10
NoBtn.Parent = ConfirmFrame

local function round(obj)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 5)
	c.Parent = obj
end
round(MainFrame) round(TopBar) round(ExitBtn) round(MiniBtn) round(OpenBtn) round(ConfirmFrame) round(SubmitBtn) round(NoBtn)

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 1, -45)
Content.Position = UDim2.new(0, 10, 0, 40)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local function createSlider(name, min, max, default, pos, callback)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0, 210, 0, 15)
	label.Position = pos
	label.Text = name .. ": " .. default
	label.TextColor3 = Color3.fromRGB(200, 200, 200)
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Font = Enum.Font.SourceSans
	label.TextSize = 13
	label.Parent = Content

	local bg = Instance.new("Frame")
	bg.Size = UDim2.new(0, 210, 0, 10)
	bg.Position = pos + UDim2.new(0, 0, 0, 18)
	bg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	bg.Parent = Content
	round(bg)

	local fill = Instance.new("Frame")
	fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
	fill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
	fill.Parent = bg
	round(fill)

	local trigger = Instance.new("TextButton")
	trigger.Size = UDim2.new(1, 0, 1, 0)
	trigger.BackgroundTransparency = 1
	trigger.Text = ""
	trigger.Parent = bg

	local function update(input)
		local inputX = input.Position.X
		local bgX = bg.AbsolutePosition.X
		local bgWidth = bg.AbsoluteSize.X
		local posPercent = math.clamp((inputX - bgX) / bgWidth, 0, 1)
		fill.Size = UDim2.new(posPercent, 0, 1, 0)
		local val = math.floor(min + (posPercent * (max - min)))
		label.Text = name .. ": " .. val
		callback(val)
	end

	local dragging = false
	trigger.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
			dragging = true 
			update(input) 
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then 
			update(input) 
		end
	end)
	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
			dragging = false 
		end
	end)
	return {Label = label, Fill = fill, Min = min, Max = max}
end

-- [[ FLEE THE FACILITY EXPLOIT HUB v8.0 - PART 3 ]]
local standSlider = createSlider("Speed Berdiri", 16, 45, current.StandSpeed, UDim2.new(0, 0, 0, 5), function(v) current.StandSpeed = v end)
local crouchSlider = createSlider("Speed Jongkok", 8, 30, current.CrouchSpeed, UDim2.new(0, 0, 0, 45), function(v) current.CrouchSpeed = v end)

local ResetBtn = Instance.new("TextButton")
ResetBtn.Size = UDim2.new(0, 210, 0, 35)
ResetBtn.Position = UDim2.new(0, 0, 0, 95)
ResetBtn.BackgroundColor3 = Color3.fromRGB(210, 130, 20)
ResetBtn.Text = "Reset Setelan ke Normal"
ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetBtn.Font = Enum.Font.SourceSansBold
ResetBtn.TextSize = 13
ResetBtn.Parent = Content
round(ResetBtn)

local function createToggle(name, default, pos, callback)
	local state = default
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 20, 0, 20)
	btn.Position = pos
	btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(80, 80, 80)
	btn.Text = state and "✓" or ""
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 14
	btn.Parent = Content
	round(btn)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(0, 190, 0, 20)
	lbl.Position = pos + UDim2.new(0, 30, 0, 0)
	lbl.Text = name
	lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
	lbl.BackgroundTransparency = 1
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Font = Enum.Font.SourceSans
	lbl.TextSize = 14
	lbl.Parent = Content

	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(80, 80, 80)
		btn.Text = state and "✓" or ""
		callback(state)
	end)
	return btn
end

local silentTgl = createToggle("Silent Hack (No Fail)", current.SilentHack, UDim2.new(0, 240, 0, 5), function(v) current.SilentHack = v end)
local pEspTgl = createToggle("Player ESP", current.PlayerEsp, UDim2.new(0, 240, 0, 35), function(v) current.PlayerEsp = v end)
local bEspTgl = createToggle("Beast ESP", current.BeastEsp, UDim2.new(0, 240, 0, 65), function(v) current.BeastEsp = v end)
local cEspTgl = createToggle("Computer ESP", current.ComputerEsp, UDim2.new(0, 240, 0, 95), function(v) current.ComputerEsp = v end)

MiniBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	OpenBtn.Visible = false
end)

ExitBtn.MouseButton1Click:Connect(function()
	ConfirmFrame.Visible = true
end)

NoBtn.MouseButton1Click:Connect(function()
	ConfirmFrame.Visible = false
end)

SubmitBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

ResetBtn.MouseButton1Click:Connect(function()
	current.StandSpeed = defaults.StandSpeed
	current.CrouchSpeed = defaults.CrouchSpeed
	standSlider.Fill.Size = UDim2.new((defaults.StandSpeed - standSlider.Min) / (standSlider.Max - standSlider.Min), 0, 1, 0)
	standSlider.Label.Text = "Speed Berdiri: " .. defaults.StandSpeed
	crouchSlider.Fill.Size = UDim2.new((defaults.CrouchSpeed - crouchSlider.Min) / (crouchSlider.Max - crouchSlider.Min), 0, 1, 0)
	crouchSlider.Label.Text = "Speed Jongkok: " .. defaults.CrouchSpeed
end)
