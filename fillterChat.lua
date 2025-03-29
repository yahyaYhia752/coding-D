
-- //mainValue\\ -- 
--[[
objects:

INSTANCES: 26
SCRIPTS: 1 
MODULES: 0 

]]
-- Start script here
parent = game.Players.LocalPlayer.PlayerGui
if _G.FillterChatV2 then
	parent['fixText']:Destroy()
end
_G.FillterChatV2 = true
local UI = {}

-- // StarterGui.fixText \\ --
UI["1"] = Instance.new("ScreenGui", parent)
UI["1"]["Name"] = [[fixText]]
UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
UI["1"]["ResetOnSpawn"] = false

-- // StarterGui.fixText.topbar \\ --
UI["2"] = Instance.new("Frame", UI["1"])
UI["2"]["BorderSizePixel"] = 0
UI["2"]["BackgroundColor3"] = Color3.fromRGB(23, 23, 23)
UI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["2"]["Size"] = UDim2.new(0.19904, 0, 0.34771, 0)
UI["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
UI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2"]["Name"] = [[topbar]]

-- // StarterGui.fixText.topbar.LocalScript \\ --
UI["3"] = Instance.new("LocalScript", UI["2"])


-- // StarterGui.fixText.topbar.UICorner \\ --
UI["4"] = Instance.new("UICorner", UI["2"])


-- // StarterGui.fixText.topbar.moveFrame \\ --
UI["5"] = Instance.new("TextButton", UI["2"])
UI["5"]["BorderSizePixel"] = 0
UI["5"]["TextTransparency"] = 1
UI["5"]["TextSize"] = 14
UI["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["5"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["5"]["BackgroundTransparency"] = 1
UI["5"]["Name"] = [[moveFrame]]
UI["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
------------------------------------------------------
-- // StarterGui.fixText.topbar.Frame \\ --
UI["6"] = Instance.new("Frame", UI["2"])
UI["6"]["BorderSizePixel"] = 0
UI["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["6"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["6"]["BackgroundTransparency"] = 1
-- // StarterGui.fixText.topbar.Frame.UIListLayout \\ --
UI["10"] = Instance.new("UIListLayout", UI["6"])
UI["10"]["Padding"] = UDim.new(0.05, 0)
UI["10"]["SortOrder"] = Enum.SortOrder.LayoutOrder


-- // StarterGui.fixText.topbar.Frame.text2 \\ --
UI["7"] = Instance.new("TextLabel", UI["6"])
UI["7"]["TextWrapped"] = true
UI["7"]["BorderSizePixel"] = 0
UI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["7"]["TextScaled"] = true
UI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7"]["TextSize"] = 20
UI["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["7"]["TextColor3"] = Color3.fromRGB(167, 167, 167)
UI["7"]["BackgroundTransparency"] = 1
UI["7"]["Size"] = UDim2.new(1, 0, 0.1, 0)
UI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7"]["Text"] = [[copy this text:]]
UI["7"]["Name"] = [[text2]]

-- // StarterGui.fixText.topbar.Frame.textbox2 \\ --
UI["8"] = Instance.new("Frame", UI["6"])
UI["8"]["BorderSizePixel"] = 0
UI["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["8"]["Size"] = UDim2.new(1, 0, 0.3, 0)
UI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["8"]["Name"] = [[textbox2]]
UI["8"]["BackgroundTransparency"] = 0.9

-- // StarterGui.fixText.topbar.Frame.textbox2.TextBox \\ --
UI["9"] = Instance.new("TextBox", UI["8"])
UI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["9"]["BorderSizePixel"] = 0
UI["9"]["TextEditable"] = false
UI["9"]["TextWrapped"] = true
UI["9"]["TextSize"] = 14
UI["9"]["TextScaled"] = true
UI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["9"]["ClearTextOnFocus"] = false
UI["9"]["Size"] = UDim2.new(0.9, 0, 0.9, 0)
UI["9"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
UI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["9"]["Text"] = [[ٴtٴuٴpٴnٴiٴ]]
UI["9"]["BackgroundTransparency"] = 1

-- // StarterGui.fixText.topbar.Frame.textbox2.UICorner \\ --
UI["a"] = Instance.new("UICorner", UI["8"])


-- // StarterGui.fixText.topbar.Frame.text1 \\ --
UI["b"] = Instance.new("TextLabel", UI["6"])
UI["b"]["TextWrapped"] = true
UI["b"]["BorderSizePixel"] = 0
UI["b"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["b"]["TextScaled"] = true
UI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["b"]["TextSize"] = 20
UI["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["b"]["TextColor3"] = Color3.fromRGB(167, 167, 167)
UI["b"]["BackgroundTransparency"] = 1
UI["b"]["Size"] = UDim2.new(1, 0, 0.1, 0)
UI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["b"]["Text"] = [[add text here:]]
UI["b"]["Name"] = [[text1]]

-- // StarterGui.fixText.topbar.Frame.textbox1 \\ --
UI["c"] = Instance.new("Frame", UI["6"])
UI["c"]["BorderSizePixel"] = 0
UI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["c"]["Size"] = UDim2.new(1, 0, 0.3, 0)
UI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["c"]["Name"] = [[textbox1]]
UI["c"]["BackgroundTransparency"] = 0.9

-- // StarterGui.fixText.topbar.Frame.textbox1.TextBox \\ --
UI["d"] = Instance.new("TextBox", UI["c"])
UI["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["d"]["BorderSizePixel"] = 0
UI["d"]["TextWrapped"] = true
UI["d"]["TextSize"] = 14
UI["d"]["TextScaled"] = true
UI["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["d"]["ClearTextOnFocus"] = false
UI["d"]["Size"] = UDim2.new(0.9, 0, 0.9, 0)
UI["d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
UI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["d"]["Text"] = [[input]]
UI["d"]["BackgroundTransparency"] = 1

-- // StarterGui.fixText.topbar.Frame.textbox1.UICorner \\ --
UI["e"] = Instance.new("UICorner", UI["c"])


-- // StarterGui.fixText.topbar.Frame.UIPadding \\ --
UI["f"] = Instance.new("UIPadding", UI["6"])
UI["f"]["PaddingTop"] = UDim.new(0.1, 0)
UI["f"]["PaddingRight"] = UDim.new(0.1, 0)
UI["f"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["f"]["PaddingBottom"] = UDim.new(0.1, 0)


-- // StarterGui.fixText.topbar.UIAspectRatioConstraint \\ --
UI["11"] = Instance.new("UIAspectRatioConstraint", UI["2"])


-- // StarterGui.fixText.topbar.close \\ --
UI["12"] = Instance.new("Frame", UI["2"])
UI["12"]["BorderSizePixel"] = 0
UI["12"]["BackgroundColor3"] = Color3.fromRGB(181, 70, 70)
UI["12"]["AnchorPoint"] = Vector2.new(1, 0)
UI["12"]["Size"] = UDim2.new(0.13, 0, 0.13, 0)
UI["12"]["Position"] = UDim2.new(1, 0, 0, 0)
UI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["12"]["Name"] = [[close]]

-- // StarterGui.fixText.topbar.close.UICorner \\ --
UI["13"] = Instance.new("UICorner", UI["12"])


-- // StarterGui.fixText.topbar.close.TextButton \\ --
UI["14"] = Instance.new("TextButton", UI["12"])
UI["14"]["TextWrapped"] = true
UI["14"]["BorderSizePixel"] = 0
UI["14"]["TextSize"] = 14
UI["14"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["14"]["TextScaled"] = true
UI["14"]["BackgroundColor3"] = Color3.fromRGB(181, 70, 70)
UI["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["14"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["14"]["BackgroundTransparency"] = 1
UI["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["14"]["Text"] = [[x]]

-- // StarterGui.fixText.topbar.close.TextButton.UICorner \\ --
UI["15"] = Instance.new("UICorner", UI["14"])


-- // StarterGui.fixText.Frame \\ --
UI["16"] = Instance.new("Frame", UI["1"])
UI["16"]["BorderSizePixel"] = 0
UI["16"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35)
UI["16"]["Size"] = UDim2.new(0.07, 0, 0.07, 0)
UI["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["16"]["BackgroundTransparency"] = 1

-- // StarterGui.fixText.Frame.UIAspectRatioConstraint \\ --
UI["17"] = Instance.new("UIAspectRatioConstraint", UI["16"])


-- // StarterGui.fixText.Frame.TextButton \\ --
UI["18"] = Instance.new("TextButton", UI["16"])
UI["18"]["BorderSizePixel"] = 0
UI["18"]["TextSize"] = 14
UI["18"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["18"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["18"]["BackgroundTransparency"] = 1
UI["18"]["TextTransparency"] = 1
UI["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["18"]["Text"] = [[FChat]]

-- // StarterGui.fixText.Frame.TextButton.UICorner \\ --
UI["19"] = Instance.new("UICorner", UI["18"])


-- // StarterGui.fixText.Frame.UICorner \\ --
UI["1a"] = Instance.new("UICorner", UI["16"])


-- // StarterGui.fixText.topbar.LocalScript \\ --
local function SCRIPT_3()
	local script = UI["3"]


	ti = TweenInfo.new(.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	ti2 = TweenInfo.new(_G.timeToHide,ti.EasingStyle,ti.EasingDirection)
	local arabicForms = {
		["ا"] = { isolated = "ا", final = "ـا", initial = "", medial = "" },
		["ب"] = { isolated = "ب", final = "ـب", initial = "بـ", medial = "ـبـ" },
		["ت"] = { isolated = "ت", final = "ـت", initial = "تـ", medial = "ـتـ" },
		["ث"] = { isolated = "ث", final = "ـث", initial = "ثـ", medial = "ـثـ" },
		["ج"] = { isolated = "ج", final = "ـج", initial = "جـ", medial = "ـجـ" },
		["ح"] = { isolated = "ح", final = "ـح", initial = "حـ", medial = "ـحـ" },
		["خ"] = { isolated = "خ", final = "ـخ", initial = "خـ", medial = "ـخـ" },
		["د"] = { isolated = "د", final = "ـد", initial = "", medial = "" },
		["ذ"] = { isolated = "ذ", final = "ـذ", initial = "", medial = "" },
		["ر"] = { isolated = "ر", final = "ـر", initial = "", medial = "" },
		["ز"] = { isolated = "ز", final = "ـز", initial = "", medial = "" },
		["س"] = { isolated = "س", final = "ـس", initial = "سـ", medial = "ـسـ" },
		["ش"] = { isolated = "ش", final = "ـش", initial = "شـ", medial = "ـشـ" },
		["ص"] = { isolated = "ص", final = "ـص", initial = "صـ", medial = "ـصـ" },
		["ض"] = { isolated = "ض", final = "ـض", initial = "ضـ", medial = "ـضـ" },
		["ط"] = { isolated = "ط", final = "ـط", initial = "طـ", medial = "ـطـ" },
		["ظ"] = { isolated = "ظ", final = "ـظ", initial = "ظـ", medial = "ـظـ" },
		["ع"] = { isolated = "ع", final = "ـع", initial = "عـ", medial = "ـعـ" },
		["غ"] = { isolated = "غ", final = "ـغ", initial = "غـ", medial = "ـغـ" },
		["ف"] = { isolated = "ف", final = "ـف", initial = "فـ", medial = "ـفـ" },
		["ق"] = { isolated = "ق", final = "ـق", initial = "قـ", medial = "ـقـ" },
		["ك"] = { isolated = "ك", final = "ـك", initial = "كـ", medial = "ـكـ" },
		["ل"] = { isolated = "ل", final = "ـل", initial = "لـ", medial = "ـلـ" },
		["م"] = { isolated = "م", final = "ـم", initial = "مـ", medial = "ـمـ" },
		["ن"] = { isolated = "ن", final = "ـن", initial = "نـ", medial = "ـنـ" },
		["ه"] = { isolated = "ه", final = "ـه", initial = "هـ", medial = "ـهـ" },
		["و"] = { isolated = "و", final = "ـو", initial = "", medial = "" },
		["ي"] = { isolated = "ي", final = "ـي", initial = "يـ", medial = "ـيـ" },
		["ء"] = { isolated = "ء", final = "ء", initial = "ء", medial = "ء" },
		["ى"] = { isolated = "ى", final = "ـى", initial = "", medial = "" },
		["ة"] = { isolated = "ة", final = "ـة", initial = "", medial = "" },
	}

	local nonConnecting = {
		["ا"] = true, ["د"] = true, ["ذ"] = true, ["ر"] = true, ["ز"] = true, ["و"] = true
	}
	hidden = false
	function hide(boolean)
		if boolean then
			game.TweenService:Create(script.Parent,ti2,{Position = script.Parent.Position + UDim2.new(0,0,-1.2,0)}):Play()
			game.TweenService:Create(script.Parent.Parent.Frame,ti2,{Transparency = 0}):Play()
			game.TweenService:Create(script.Parent.Parent.Frame.TextButton,ti2,{TextTransparency = 0}):Play()
		else
			script.Parent.Position = UDim2.new(.5,0,-.5,0)
			game.TweenService:Create(script.Parent,ti2,{Position = UDim2.new(.5,0,.5,0)}):Play()
			game.TweenService:Create(script.Parent.Parent.Frame,ti2,{Transparency = 1}):Play()
			game.TweenService:Create(script.Parent.Parent.Frame.TextButton,ti2,{TextTransparency = 1}):Play()
		end
		task.wait(_G.timeToHide)
		--script.Parent.Visible = not boolean
		--script.Parent.Frame.Visible = boolean
		hidden = boolean
	end
	function stylizeArabic(text, separator)
		separator = separator or " "

		local chars = splitToChars(text)
		local result = {}

		for i = 1, #chars do
			local curr = chars[i]
			local prev = chars[i - 1]
			local nextChar = chars[i + 1]

			local form = arabicForms[curr]
			if not form then
				table.insert(result, curr)
			else
				local connectBefore = prev and arabicForms[prev] and not nonConnecting[prev]
				local connectAfter = nextChar and arabicForms[nextChar] and not nonConnecting[curr]

				if form.medial ~= "" and connectBefore and connectAfter then
					table.insert(result, form.medial)
				elseif form.final ~= "" and connectBefore then
					table.insert(result, form.final)
				elseif form.initial ~= "" and connectAfter then
					table.insert(result, form.initial)
				else
					table.insert(result, form.isolated)
				end

			end
		end

		return table.concat(result, separator)
	end

	function splitToChars(str)
		local chars = {}
		for char in string.gmatch(str, "[%z\1-\127\194-\244][\128-\191]*") do
			table.insert(chars, char)
		end
		return chars
	end
	function detectLanguage(text)
		local hasArabic = false
		local hasLatin = false

		for char in string.gmatch(text, "[%z\1-\127\194-\244][\128-\191]*") do
			local byte = utf8.codepoint(char)
			if byte >= 0x0600 and byte <= 0x06FF then
				hasArabic = true
			elseif (byte >= 0x0041 and byte <= 0x005A) or (byte >= 0x0061 and byte <= 0x007A) then
				hasLatin = true
			end
		end

		if hasArabic and hasLatin then
			return "Mixed"
		elseif hasArabic then
			return "Arabic"
		elseif hasLatin then
			return "English"
		else
			return "Other"
		end
	end

	local function disableboxs(txt:string)
		local letter = _G.letter
		local language = detectLanguage(txt)
		realText = ""
		split = splitToChars(txt)
		newtxt = ""
		if language == "English" then
			for i=#split,1,-1 do
				newtxt = newtxt..letter..split[i]
			end
			realText = newtxt..letter
		elseif language == "Arabic" then
			realText = stylizeArabic(txt,_G.letter)
		else
			realText = txt
		end
		return realText
	end
	-- set size
	task.spawn(function()
		while wait(1) do
			script.Parent["Size"] = UDim2.new(0.19904*_G.SizeFillterScreen, 0, 0.34771*_G.SizeFillterScreen, 0)
			script.Parent.Parent.Frame["Size"] = UDim2.new(0.07*_G.SizeFillterScreen, 0, 0.07*_G.SizeFillterScreen, 0)
		end
	end)
	--moveFrame
	task.spawn(function()
		move = false
		IsDown = false
		pos = nil
		script.Parent.moveFrame.MouseButton1Down:Connect(function()
			if hidden then return end
			IsDown = true
			pos = UDim2.new(0,game.Players.LocalPlayer:GetMouse().X,0,game.Players.LocalPlayer:GetMouse().Y) - script.Parent.Position
			task.wait(_G.hold)
			if IsDown == true then
				move = true
			end
		end)
		script.Parent.moveFrame.MouseButton1Up:Connect(function()
			IsDown = false
			move = false
		end)
		game.Players.LocalPlayer:GetMouse().Button1Up:Connect(function()
			IsDown = false
			move = false
		end)
		while wait() do
			if move then
				goal = {}
				goal.Position = UDim2.new(0, game.Players.LocalPlayer:GetMouse().X, 0, game.Players.LocalPlayer:GetMouse().Y) - pos
				game.TweenService:Create(script.Parent,ti,goal):Play()
			end
		end
	end)
	-- close and open buttons 
	task.spawn(function()
		script.Parent.close.TextButton.MouseButton1Down:Connect(function()
			hide(true)
		end)
		--script.Parent.Parent.Frame.TextButton.MouseButton1Down:Connect(function()
		--	hide(false)
		--end)
		-- used in moveFrame Button task
	end)

	--moveFrame Button
	task.spawn(function()
		move_2 = false
		IsDown_2 = false
		pos_2 = nil

		script.Parent.Parent.Frame.TextButton.MouseButton1Down:Connect(function()
			if not hidden then return end
			IsDown_2 = true
			pos_2 = UDim2.new(0,game.Players.LocalPlayer:GetMouse().X,0,game.Players.LocalPlayer:GetMouse().Y) - script.Parent.Parent.Frame.Position
			task.wait(_G.hold)
			if IsDown_2 == true then
				move_2 = true
			else
				hide(false)
			end
		end)
		script.Parent.Parent.Frame.TextButton.MouseButton1Up:Connect(function()
			IsDown_2 = false
			move_2 = false
		end)
		game.Players.LocalPlayer:GetMouse().Button1Up:Connect(function()
			IsDown_2 = false
			move_2 = false
		end)
		while wait() do
			if move_2 then
				goal = {}
				goal.Position = UDim2.new(0, game.Players.LocalPlayer:GetMouse().X, 0, game.Players.LocalPlayer:GetMouse().Y) - pos_2
				game.TweenService:Create(script.Parent.Parent.Frame,ti,goal):Play()
			end
		end
	end)

	script.Parent.Frame.textbox1.TextBox.Changed:Connect(function()
		
	end)
	script.Parent.Frame.textbox1.TextBox.FocusLost:Connect(function()
		everyClipboard(script.Parent.Frame.textbox2.TextBox.Text)
	end)
	script.Parent.Frame.textbox1.TextBox.Changed:Connect(function()
		script.Parent.Frame.textbox2.TextBox.Text = disableboxs(script.Parent.Frame.textbox1.TextBox.Text)
	end)
end
task.spawn(SCRIPT_3)

return UI["1"], require;
