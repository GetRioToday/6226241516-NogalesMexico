Rio = Rio or {}
Rio.NoDrowning = true

local ClientManager = game:GetService("Players")
local SharedStorage = game:GetService("ReplicatedStorage")

local LocalClient = ClientManager.LocalPlayer
local LocalCharacter = LocalClient.Character

local Module = require(SharedStorage.ACS_Zeph.GameRules.Config)
Module.CanDrown = not Rio.NoDrowning

LocalCharacter.ACS_Client.ACS_Framework.Enabled = false
LocalCharacter.ACS_Client.ACS_Framework.Enabled = true
