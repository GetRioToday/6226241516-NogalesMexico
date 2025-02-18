local World = game:GetService("Workspace")
local ClientManager = game:GetService("Players")

local LocalClient = ClientManager.LocalPlayer
local LocalCharacter = LocalClient.Character

local ActionTexts = {"beretta", "FN Five Seven", "Galil ACE", "FX-05", "FX-05 MOD", "M4A1", "M4A1 MOD", "Expedite 12"}
local OriginalPosition = LocalCharacter.HumanoidRootPart.CFrame

for _, Object in ipairs (World:GetDescendants()) do
	if Object:IsA("ProximityPrompt") then
		local Index = table.find(ActionTexts, Object.ActionText)

		if Index then
			table.remove(ActionTexts, Index)

			local ProxPart = Object.Parent
			LocalCharacter.HumanoidRootPart.CFrame = ProxPart.CFrame

			task.wait(0.25)
			fireproximityprompt(Object, 0)
		end
	end
end

LocalCharacter.HumanoidRootPart.CFrame = OriginalPosition
