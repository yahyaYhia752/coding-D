-- mute sounds
_G.RunShiftFixGlitches = false
for i,v in pairs(game:GetDescendants()) do
	if v:IsA("Sound") then
		v:Stop()
	end
end
-- doing task
-- waiting other loading

if _G.ShiftLock then
	return nil
end
_G.ShiftLock = true
print("script Start")
repeat wait() until
game.Players.LocalPlayer
	and game.Players.LocalPlayer.Character
	and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
	and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")


--script = Instance.new("LocalScript")
--script.Parent = game.CoreGui
--script.Name = "shift lock"

local blackListTools = {
	"Phone";
}
local offest = Vector3.new(1.75,1,0)
local Button2offest = Vector3.new(-.75,0,0)
local dataFolder = Instance.new("Folder",game.ReplicatedStorage)
dataFolder.Name = tostring((math.random(1,9999)*math.random(1,9999))/9999)
local cam = workspace.CurrentCamera
local plr = game.Players.LocalPlayer
local char = plr.Character
local uis = game.UserInputService
local h:Humanoid = char:WaitForChild("Humanoid")
local hrp:Part = char:WaitForChild("HumanoidRootPart")
local ShiftLockCFrame = Instance.new("CFrameValue")
ShiftLockCFrame.Parent = dataFolder
ShiftLockCFrame.Name = "ShiftLockCFrame"
boolValue = false
zoom = false
input = Enum.KeyCode.LeftShift
ti = TweenInfo.new(.75,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
theScript = nil
local function shift(boolean)
	local upv_cframe
	if zoom then
		upv_cframe = CFrame.new(offest+ Button2offest)
	else
		upv_cframe = CFrame.new(offest)
	end
	if boolean then
		game.TweenService:Create(ShiftLockCFrame,ti,{Value = upv_cframe}):Play()
	else
		game.TweenService:Create(ShiftLockCFrame,ti,{Value = CFrame.new(Vector3.new(0,0,0))}):Play()
	end
	print(zoom)
	print(boolValue)
end

local function SCRIPT(code:LocalScript)
	char.ChildAdded:Connect(function(child)
		if code == nil then return end
		if child:IsA("Tool") then
			if table.find(blackListTools,child.Name) then return nil end
			boolValue = true
			shift(boolValue)
		end
	end)
	char.ChildRemoved:Connect(function(child)
		if code == nil then return end
		if child:IsA("Tool") then
			if table.find(blackListTools,child.Name) then return nil end
			boolValue = false
			shift(boolValue)
		end
	end)
	h.Changed:Connect(function()
		if code == nil then return end
		if h.Health <= 0 then -- if player is died already
			boolValue = false
			zoom = false
			--disableScript = true
			return nil 
		end
		if h.Sit == true then
			boolValue = false
			shift(boolValue)
		end
	end)
	h.Died:Connect(function()
		if code == nil then return end
		boolValue = false
		zoom = false
		game.TweenService:Create(ShiftLockCFrame,ti,{Value = CFrame.new(Vector3.new(0,0,0))}):Play()
		code:Destroy()
		--disableScript = true
		--shift(boolValue)
	end)
	return code
end
task.spawn(SCRIPT)
plr.CharacterAdded:Connect(function()
	hack = Instance.new("LocalScript",game.CoreGui)
	hack.Name = "ShiftLock-v.199"
	theScript = SCRIPT(hack)
end)
plr:GetMouse().Button2Up:Connect(function()
	zoom = false
	shift(boolValue)
end)
plr:GetMouse().Button2Down:Connect(function()
	if boolValue then
		zoom = true
	else
		zoom = false
	end
	shift(boolValue)
end)
game["Run Service"].RenderStepped:Connect(function()
	cam.CFrame = cam.CFrame * ShiftLockCFrame.Value -- change position camera
	-- character rotate
	h.AutoRotate = not boolValue
	if boolValue then -- rotate character
		hrp.CFrame = CFrame.new(hrp.Position,hrp.Position + cam.CFrame.LookVector * Vector3.new(1,0,1))
		-- uis.MouseBehavior = Enum.MouseBehavior.LockCenter
	else
		-- uis.MouseBehavior = Enum.MouseBehavior.Default
	end
end)
