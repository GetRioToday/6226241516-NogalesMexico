Rio = Rio or {}
Rio.NoJumpDelay = true

local ClientManager = game:GetService("Players")
local SharedStorage = game:GetService("ReplicatedStorage")

local LocalClient = ClientManager.LocalPlayer
local LocalCharacter = LocalClient.Character

local Module = require(SharedStorage.ACS_Zeph.GameRules.Config)
Module.AntiBunnyHop = not Rio.NoJumpDelay

LocalCharacter.ACS_Client.ACS_Framework.Enabled = false
LocalCharacter.ACS_Client.ACS_Framework.Enabled = true
