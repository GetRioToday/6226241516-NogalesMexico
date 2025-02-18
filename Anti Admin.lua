local ClientManager = game:GetService("Players")

local function IsAdmin(Client: Player): boolean
    local Rank = Client:GetRankInGroup(35339723)
    local HasAdminRank = Rank >= 254

    if rconsolewarn and HasAdminRank then
        rconsolewarn("Admin " .. Client.Name .. " joined the game.")
    end

    return HasAdminRank
end

local function ClientConnected(Client: Player): nil
	if IsAdmin(Client) then
        ClientManager.LocalPlayer:Kick("\n\nAdmin " .. Client.Name .. " joined the game.")
    end

	return nil
end

for _, Client: Player in pairs (ClientManager:GetPlayers()) do
    ClientConnected(Client)
end

ClientManager.PlayerAdded:Connect(ClientConnected)
