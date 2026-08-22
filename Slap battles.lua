local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local queue = queueonteleport or queue_on_teleport

local targetPlace = 122902713960550

if game.PlaceId ~= targetPlace then
	TeleportService:Teleport(targetPlace)
	if queue then
		queue([[
			if not game:IsLoaded() then
		       game.Loaded:Wait()
		    end
			if game.PlaceId ~= 122902713960550 then return end
			local Players = game:GetService("Players")
			local LocalPlayer = Players.LocalPlayer
			local Workspace = game:GetService("Workspace")
			local Camera = Workspace.CurrentCamera
			
			repeat task.wait() until Workspace:FindFirstChild("Island") and Workspace.Island:FindFirstChild("John Surfboard")
			
			LocalPlayer.Character:PivotTo(Workspace.Island["John Surfboard"].Head:GetPivot())
			task.wait(.3)
			fireproximityprompt(Workspace.Island["John Surfboard"].Head:FindFirstChildWhichIsA("ProximityPrompt"))
			wait(.1)
			for i = 1,20 do
				local args = {
				    [1] = 0
				}
				game:GetService("ReplicatedStorage").Modules.Common.Dialogue.Remotes.ResondToDialogue:FireServer(unpack(args))
				wait()
			end
			
			task.wait(1)
			Camera.CameraType = Enum.CameraType.Custom
			Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			
			while wait() do
				for i,v in pairs(workspace.ObjectSpawner_Objects:GetChildren()) do
					v:Destroy()
				end
			end
		]])
	end
	return
end

repeat task.wait() until Workspace:FindFirstChild("Island") and Workspace.Island:FindFirstChild("John Surfboard")

LocalPlayer.Character:PivotTo(Workspace.Island["John Surfboard"].Head:GetPivot())
task.wait(.3)
fireproximityprompt(Workspace.Island["John Surfboard"].Head:FindFirstChildWhichIsA("ProximityPrompt"))
wait(.1)
for i = 1,20 do
	local args = {
	    [1] = 0
	}
	
	game:GetService("ReplicatedStorage").Modules.Common.Dialogue.Remotes.ResondToDialogue:FireServer(unpack(args))
	wait()
end

task.wait(1)
Camera.CameraType = Enum.CameraType.Custom
Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

while wait() do
	for i,v in pairs(workspace.ObjectSpawner_Objects:GetChildren()) do
		v:Destroy()
	end
end
