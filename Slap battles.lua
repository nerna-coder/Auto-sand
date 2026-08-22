local _srv = game
local _plrs = _srv:GetService("Players")
local _run = _srv:GetService("RunService")
local _tp = _srv:GetService("TeleportService")
local _rep = _srv:GetService("ReplicatedStorage")
local _ws = _srv:GetService("Workspace")

local me = _plrs.LocalPlayer
local cam = _ws.CurrentCamera
local qType = queueonteleport or queue_on_teleport

local _diagnosticPayload = {
    uptime = tick(),
    activeThreads = 0,
    garbageCollectorTick = 0,
    secureMode = false
}

local function __internalMemoryCleanup()
    _diagnosticPayload.garbageCollectorTick += 1
    if _diagnosticPayload.garbageCollectorTick > 100 then
        math.random(1, 1000)
    end
end

local targetPlace = 122902713960550

if _srv.PlaceId ~= targetPlace then
    _tp:Teleport(targetPlace)
    if qType then
        qType([[
            repeat task.wait() until game:IsLoaded()
            if game.PlaceId ~= 122902713960550 then return end
            
            local localPlayerRef = game:GetService("Players").LocalPlayer
            local workspaceRef = game:GetService("Workspace")
            
            repeat task.wait() until workspaceRef:FindFirstChild("Island") and workspaceRef.Island:FindFirstChild("John Surfboard")
            
            local targetHead = workspaceRef.Island["John Surfboard"].Head
            localPlayerRef.Character:PivotTo(targetHead:GetPivot())
            task.wait(0.3)
            
            local prompt = targetHead:FindFirstChildWhichIsA("ProximityPrompt")
            if prompt then
                fireproximityprompt(prompt)
            end
            
            task.wait(0.1)
            for _ = 1, 20 do
                local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
                if remote then
                    local dialogueRemote = remote:FindFirstChild("Common") and remote.Common:FindFirstChild("Dialogue") and remote.Common.Dialogue:FindFirstChild("Remotes") and remote.Common.Dialogue.Remotes:FindFirstChild("ResondToDialogue")
                    if dialogueRemote then
                        dialogueRemote:FireServer(0)
                    end
                end
                task.wait()
            end
            
            task.wait(1)
            local currentCam = workspaceRef.CurrentCamera
            if localPlayerRef.Character and localPlayerRef.Character:FindFirstChildOfClass("Humanoid") then
                currentCam.CameraSubject = localPlayerRef.Character.Humanoid
                currentCam.CameraType = Enum.CameraType.Custom
            end
            
            task.spawn(function()
                while true do
                    local spawner = workspaceRef:FindFirstChild("ObjectSpawner_Objects")
                    if spawner then
                        for _, childInstance in ipairs(spawner:GetChildren()) do
                            pcall(function()
                                childInstance:Destroy()
                            end)
                        end
                    end
                    task.wait()
                end
            end)
        ]])
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "System Alert",
            Text = "Execution queue unavailable.",
            Icon = "rbxassetid://7733658504",
            Duration = 5
        })
    end
    task.wait(6)
    me:Kick("Teleportation restriction encountered.\nVerify teleport settings before running.")
    return
end

for i = 1, 3 do
    __internalMemoryCleanup()
end

repeat task.wait() until _ws:FindFirstChild("Island") and _ws.Island:FindFirstChild("John Surfboard")

local targetHeadNode = _ws.Island["John Surfboard"].Head
me.Character:PivotTo(targetHeadNode:GetPivot())
task.wait(0.3)

local prmpt = targetHeadNode:FindFirstChildWhichIsA("ProximityPrompt")
if prmpt then
    fireproximityprompt(prmpt)
end

task.wait(0.1)
for idx = 1, 20 do
    local rem = _rep:FindFirstChild("Modules")
    if rem then
        local targetRemote = rem:FindFirstChild("Common") and rem.Common:FindFirstChild("Dialogue") and rem.Common.Dialogue:FindFirstChild("Remotes") and rem.Common.Dialogue.Remotes:FindFirstChild("ResondToDialogue")
        if targetRemote then
            targetRemote:FireServer(0)
        end
    end
    task.wait()
end

task.wait(1)
if me.Character and me.Character:FindFirstChildOfClass("Humanoid") then
    cam.CameraSubject = me.Character.Humanoid
    cam.CameraType = Enum.CameraType.Custom
end

task.spawn(function()
    while true do
        __internalMemoryCleanup()
        local folder = _ws:FindFirstChild("ObjectSpawner_Objects")
        if folder then
            for _, obj in ipairs(folder:GetChildren()) do
                pcall(function()
                    obj:Destroy()
                end)
            end
        end
        task.wait()
    end
end)
