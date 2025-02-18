Rio = Rio or {}
Rio.InfiniteAmmo = true

local ClientManager = game:GetService("Players")

local LocalClient = ClientManager.LocalPlayer
local LocalCharacter = LocalClient.Character

local WeaponCache = {}

local function RegisterWeapon(Child: Instance)
	if Child:IsA("ModuleScript") and Child.Name == "ACS_Setup" then
		local Weapon = Child.Parent

		if not WeaponCache[Weapon] and WeaponCache[Weapon] ~= false then
			WeaponCache[Weapon] = false
		end
	end
end

LocalClient.Backpack.DescendantAdded:Connect(RegisterWeapon)

while task.wait(1.17) do
	for Weapon, State in pairs (WeaponCache) do
		if Weapon ~= nil and (Weapon.Parent == LocalCharacter or Weapon.Parent == LocalClient.Backpack) then
			local Settings = require(Weapon["ACS_Setup"])

			if State == false and Rio.InfiniteAmmo then
				WeaponCache[Weapon] = Settings.Ammo

				Settings.Ammo = math.huge
				Settings.AmmoInGun = math.huge
				Settings.StoredAmmo = math.huge
				Settings.MaxStoredAmmo = math.huge

			elseif State and not Rio.InfiniteAmmo then
				WeaponCache[Weapon] = false

				Settings.Ammo = State
				Settings.AmmoInGun = State
				Settings.StoredAmmo = 1e999
				Settings.MaxStoredAmmo = 1e999
			end

		else
			WeaponCache[Weapon] = nil
		end
	end
end
