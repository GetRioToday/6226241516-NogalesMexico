Rio = Rio or {}
Rio.TimeLock = true
Rio.TimeLock_Time = 12.0

local Lighting = game:GetService("Lighting")

local function TimeLock()
	if Rio.TimeLock then
		Lighting.ClockTime = Rio.TimeLock_Time
	end
end

Lighting.ClockTime = Rio.TimeLock_Time
Lighting:GetPropertyChangedSignal("ClockTime"):Connect(TimeLock)
