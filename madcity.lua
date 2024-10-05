-- mute sounds
for i,v in pairs(game:GetDescendants()) do
	if v:IsA("Sound") then
		v:Stop()
	end
end
-- doing task
if _G.ShiftLock then
	retrun nil
end
_G.ShiftLock = true

local function SCRIPT_2()
    local script = Instance.new("LocalScript")
    script.Parent = game.CoreGui
    script.Name = "shift lock"

	local blackListTools = {
		"Phone";
	}
	local offest = Vector3.new(1.75,1,0)
	local Button2offest = Vector3.new(-.75,0,0)
	
	local cam = workspace.CurrentCamera
	local plr = game.Players.LocalPlayer
	local char = plr.Character
	local uis = game.UserInputService
	local h:Humanoid = char:WaitForChild("Humanoid")
	local hrp:Part = char:WaitForChild("HumanoidRootPart")
	local ShiftLockCFrame = Instance.new("CFrameValue")
	ShiftLockCFrame.Parent = script
	ShiftLockCFrame.Name = "ShiftLockCFrame"
	boolValue = false
	zoom = false
	input = Enum.KeyCode.LeftShift
	ti = TweenInfo.new(.75,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
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
	end
	
	char.ChildAdded:Connect(function(child)
		if child:IsA("Tool") then
			if table.find(blackListTools,child.Name) then return nil end
			boolValue = true
			shift(boolValue)
		end
	end)
	char.ChildRemoved:Connect(function(child)
		if child:IsA("Tool") then
			if table.find(blackListTools,child.Name) then return nil end
			boolValue = false
			shift(boolValue)
		end
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
    plr:WaitForChild("Humanoid").Died:Connect(function()
        boolValue = false
        zoom = false
        shift(boolValue)
    end)
	game["Run Service"].RenderStepped:Connect(function()
		cam.CFrame = cam.CFrame * ShiftLockCFrame.Value
		-- character rotate
		h.AutoRotate = not boolValue
		if boolValue then
			hrp.CFrame = CFrame.new(hrp.Position,hrp.Position + cam.CFrame.LookVector * Vector3.new(1,0,1))
			-- uis.MouseBehavior = Enum.MouseBehavior.LockCenter
		else
			-- uis.MouseBehavior = Enum.MouseBehavior.Default
		end
	end)
end
task.spawn(SCRIPT_2)
