Rio = Rio or {}
Rio.SurrenderSpam = true

while Rio.SurrenderSpam do
	for i = 1, 10 do
		game:GetService("ReplicatedStorage").ACS_Zeph.Events.Surrender:FireServer(i % 2 ~= 0 and true or nil)
	end

	task.wait(1)
end
