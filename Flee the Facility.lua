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

-- Layout Utama: Pendek & Lebar Kesamping (Horizontal)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 260)
MainFrame.Position = UDim2.new(0.5, -240, 0.1, 0) -- Statis di atas tengah layar
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = false -- DINONAKTIFKAN SEPERTI PERMINTAANMU AGAR SPEED WORK
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

-- Tombol Open Hijau Dikembalikan ke Kiri Atas Layar
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

-- ==================== POP-UP PANEL KONFIRMASI TOMBOL X ====================
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
	lbl.Position = pos + UDim2.new(0, 28, 0, 0)
	lbl.Text = name
	lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.BackgroundTransparency = 1
	lbl.Font = Enum.Font.SourceSans
	lbl.TextSize = 13
	lbl.Parent = Content

	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(80, 80, 80)
		btn.Text = state and "✓" or ""
		callback(state)
	end)

	return {Button = btn, SetState = function(newState)
		state = newState
		btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(80, 80, 80)
		btn.Text = state and "✓" or ""
	end}
end

local togglePlayer = createToggle("ESP Survivor", current.PlayerEsp, UDim2.new(0, 240, 0, 5), function(v) current.PlayerEsp = v end)
local toggleBeast = createToggle("ESP Beast", current.BeastEsp, UDim2.new(0, 240, 0, 35), function(v) current.BeastEsp = v end)
local togglePC = createToggle("ESP Computer", current.ComputerEsp, UDim2.new(0, 240, 0, 65), function(v) current.ComputerEsp = v end)
local toggleSilent = createToggle("Silent Hack (PC Anti-Bunyi)", current.SilentHack, UDim2.new(0, 240, 0, 95), function(v) current.SilentHack = v end)

local inp = Instance.new("TextBox")
inp.Name = "inp"
inp.Size = UDim2.new(1, 0, 0, 32)
inp.Position = UDim2.new(0, 0, 0, 145)
inp.BackgroundColor3 = Color3.fromRGB(18, 46, 68)
inp.PlaceholderText = " Masukkan sebagian nama / Display name target..."
inp.Text = ""
inp.TextColor3 = Color3.fromRGB(255, 255, 255)
inp.TextXAlignment = Enum.TextXAlignment.Left
inp.Font = Enum.Font.SourceSans
inp.TextSize = 13
inp.Parent = Content
round(inp)

local but = Instance.new("TextButton")
but.Name = "but"
but.Size = UDim2.new(1, 0, 0, 32)
but.Position = UDim2.new(0, 0, 0, 182)
but.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
but.Text = "Teleport Sekarang"
but.TextColor3 = Color3.fromRGB(255, 255, 255)
but.Font = Enum.Font.SourceSansBoldbut.TextSize = 13
but.Parent = Contentround(but)

### Bagian 2: Logika Loop Konparasi Sistem ESP, Silent Hack, dan Tombol Konfirmasi

```lua
-- [[ FLEE THE FACILITY EXPLOIT HUB v8.0 - PART 2 ]]

local function clearESP(tag)
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj.Name == "FTF_ESP" and obj:GetAttribute("ESP_Type") == tag then
			obj:Destroy()
		elseif obj.Name == "FTF_Label" and obj:GetAttribute("ESP_Type") == tag then
			obj:Destroy()
		end
	end
end

local function clearAllESP()
	clearESP("Player")
	clearESP("Beast")
	clearESP("Computer")
end

but.MouseButton1Click:Connect(function()
	local inputText = inp.Text:lower()
	if inputText == "" then return end
	local targetPlayer = nil

	for _, player in pairs(Players:GetPlayers()) do
		local uname = player.Name:lower()
		local dname = player.DisplayName:lower()
		if uname:find(inputText) or dname:find(inputText) then
			targetPlayer = player
			break
		end
	end

	if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local myChar = LocalPlayer.Character
		if myChar and myChar:FindFirstChild("HumanoidRootPart") then
			myChar.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(3, 0, 0)
		end
	end
end)

ResetBtn.MouseButton1Click:Connect(function()
	current.StandSpeed = defaults.StandSpeed
	current.CrouchSpeed = defaults.CrouchSpeed
	current.SilentHack = defaults.SilentHack
	current.PlayerEsp = defaults.PlayerEsp
	current.BeastEsp = defaults.BeastEsp
	current.ComputerEsp = defaults.ComputerEsp
	
	togglePlayer.SetState(defaults.PlayerEsp)
	toggleBeast.SetState(defaults.BeastEsp)
	togglePC.SetState(defaults.ComputerEsp)
	toggleSilent.SetState(defaults.SilentHack)
	
	inp.Text = ""
	clearAllESP()
	
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = defaults.StandSpeed
	end
	
	standSlider.Label.Text = "Speed Berdiri: " .. current.StandSpeed
	standSlider.Fill.Size = UDim2.new((current.StandSpeed - standSlider.Min) / (standSlider.Max - standSlider.Min), 0, 1, 0)
	
	crouchSlider.Label.Text = "Speed Jongkok: " .. current.CrouchSpeed
	crouchSlider.Fill.Size = UDim2.new((current.CrouchSpeed - crouchSlider.Min) / (crouchSlider.Max - crouchSlider.Min), 0, 1, 0)
end)

local remoteHook = ReplicatedStorage:WaitForChild("RemoteEvent")
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
	local method = getnamecallmethod()
	local args = {...}
	if current.SilentHack and self == remoteHook and method == "FireServer" then
		if args == "SetComputerProgress" and args == true then 
			args = false 
			return oldNamecall(self, unpack(args))
		end
	end
	return oldNamecall(self, unpack(args))
end)

connections.SpeedLoop = RunService.Heartbeat:Connect(function()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		local isCrouching = LocalPlayer.Character:GetAttribute("Crouching") or (hum.WalkSpeed < 10 and hum.WalkSpeed > 0)
		if isCrouching then
			hum.WalkSpeed = current.CrouchSpeed
		else
			if hum.WalkSpeed > 0 then hum.WalkSpeed = current.StandSpeed end
		end
	end
end)

local function applyESP(part, color, textName, tag)
	if part:FindFirstChild("FTF_ESP") then return end
	
	local box = Instance.new("BoxHandleAdornment")
	box.Name = "FTF_ESP"
	box.Size = part.Size + Vector3.new(0.1, 0.1, 0.1)
	box.AlwaysOnTop = true
	box.ZIndex = 5
	box.Adornee = part
	box.Color3 = color
	box.Transparency = 0.5
	box:SetAttribute("ESP_Type", tag)
	box.Parent = part
	
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "FTF_Label"
	billboard.Size = UDim2.new(0, 100, 0, 30)
	billboard.AlwaysOnTop = true
	billboard.Adornee = part
	billboard.Parent = part
	billboard:SetAttribute("ESP_Type", tag)
	
	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1, 0, 1, 0)
	text.BackgroundTransparency = 1
	text.Text = textName
	text.TextColor3 = color
	text.Font = Enum.Font.SourceSansBold
	text.TextSize = 12
	text.Parent = billboard
end

connections.ESPLoop = RunService.Heartbeat:Connect(function()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = p.Character.HumanoidRootPart
			local isBeast = p.Character:FindFirstChild("BeastWeapon") or p:GetAttribute("IsBeast")
			
			if isBeast then
				if current.BeastEsp then
					applyESP(hrp, Color3.fromRGB(255, 0, 0), "[ BEAST ] " .. p.Name, "Beast")
				else
					if hrp:FindFirstChild("FTF_ESP") and hrp.FTF_ESP:GetAttribute("ESP_Type") == "Beast" then clearESP("Beast") end
				end
			else
				if current.PlayerEsp then
					applyESP(hrp, Color3.fromRGB(0, 255, 100), p.Name, "Player")
				else
					if hrp:FindFirstChild("FTF_ESP") and hrp.FTF_ESP:GetAttribute("ESP_Type") == "Player" then clearESP("Player") end
				end
			end
		end
	end
	
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj.Name == "ComputerTable" and obj:FindFirstChild("Screen") then
			if current.ComputerEsp then
				applyESP(obj.Screen, Color3.fromRGB(0, 200, 255), "💻 PC", "Computer")
			else
				if obj.Screen:FindFirstChild("FTF_ESP") then clearESP("Computer") end
			end
		end
	end
end)

-- Tombol Minimize (-)
MiniBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	OpenBtn.Visible = true
end)

-- Tombol Open Hijau
OpenBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	OpenBtn.Visible = false
end)

-- ==================== LOGIKA POP-UP TOMBOL X (PEYAKIN KELUAR) ====================
ExitBtn.MouseButton1Click:Connect(function()
	ConfirmFrame.Visible = true -- Tampilkan kotak peyakin
end)

NoBtn.MouseButton1Click:Connect(function()
	ConfirmFrame.Visible = false -- Tutup kotak peyakin dan kembali bermain
end)

SubmitBtn.MouseButton1Click:Connect(function()
	-- Hancurkan skrip secara total hanya jika menekan "Submit"
	current.SilentHack = false
	for _, conn in pairs(connections) do if conn then conn:Disconnect() end end
	clearAllESP()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = defaults.StandSpeed
	end
	ScreenGui:Destroy()
end)
