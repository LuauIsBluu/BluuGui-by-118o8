local StarterGui = game:GetService("StarterGui")

-- first notify
StarterGui:SetCore("SendNotification", {
    Title = "BluuGui",
    Text = "BluuGui is executing...",
    Duration = 5
})

-- wait 5 seconds
task.wait(5)

-- second notify
StarterGui:SetCore("SendNotification", {
    Title = "BluuGui",
    Text = "If it didn’t execute, it’s probably broken.",
    Duration = 5
})

--Stars real BluuGui
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "BluuGui",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Coolest Gui ever",
   LoadingSubtitle = "by 118o8",
   ShowText = "BluuGui", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://[Log in to view URL]
 
   ToggleUIKeybind = "B", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)
 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
 
   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
 
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Red guy Sucks?",
      Subtitle = "Say True",
      Note = "Tip: say YesHeSucks", -- Use this to tell the user how to get a key
      FileName = "Question", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"YesHeSucks"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

--Misc tab on top for fix bugs
  local Misc = Window:CreateTab("Misc", 4483362458) -- Title, Image

--Useful moved to tiop for prevent bugs
local Useful = Window:CreateTab("Useful", 4483362458) -- Título y icono

local MainTab = Window:CreateTab("Player", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Movility")
 
Rayfield:Notify({
   Title = "Notification",
   Content = "BluuGui executed,Enjoy my gang >:D.",
   Duration = 3,
   Image = 4483362458,
})

-- 🎵 dead sounds
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SoundIds = {
    72861611511867,
    128811607334302,
    93997080329253
}

-- Función para reproducir sonido aleatorio
local function PlayDeathSound()
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            local randomId = SoundIds[math.random(1, #SoundIds)]
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. randomId
            sound.Volume = 2 -- 🔊 Doble volumen
            sound.Parent = workspace
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 5)
        end)
    end
end

-- Conectar al cargar personaje
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1) -- espera un poco a que cargue
    PlayDeathSound()
end)

-- Si ya tiene personaje
if LocalPlayer.Character then
    PlayDeathSound()
end
 
local Button = MainTab:CreateButton({
   Name = "Inf Jump",
   Callback = function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';
 
_G.JumpHeight = 50;
 
function Action(Object, Function) if Object ~= nil then Function(Object); end end
 
UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
   end,
})
 
        local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

		local Button = MainTab:CreateButton({
   Name = "BluVelosity (q)",
   Callback = function()
   		loadstring(game:HttpGet("https://pastebin.com/raw/VDxFA1Ze"))()
   end,
})
 
        local Button = MainTab:CreateButton({
   Name = "Fly (Press F)",
   Callback = function()
   -- LocalScript dentro de StarterPlayerScripts
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
 
local player = Players.LocalPlayer
local Fly = false -- Estado inicial
local FlySpeed = 50 -- Velocidad de vuelo
 
-- Tecla F para activar/desactivar
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.F then
		Fly = not Fly
	end
end)
 
-- Loop de vuelo
RunService.RenderStepped:Connect(function()
	if Fly then
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			local hrp = char.HumanoidRootPart
			local move = Vector3.new(0,0,0)
			local cam = workspace.CurrentCamera.CFrame
 
			-- Movimiento WASD + SPACE/SHIFT
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cam.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cam.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cam.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cam.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0,1,0) end
 
			if move.Magnitude > 0 then
				hrp.Velocity = move.Unit * FlySpeed
			else
				hrp.Velocity = Vector3.new(0,0,0)
			end
		end
	end
end)
 
   end,
})
 
        local Slider = MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 300},
   Increment = 2,
   Suffix = "Stuts",
   CurrentValue = 50,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
          game.Players.LocalPlayer.Character.Humanoid.JumpPower= (Value)
   end,
})
 
        local Button = MainTab:CreateButton({
   Name = "Tp on click (Press X to tp)",
   Callback = function()
  -- LocalScript dentro de StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
 
-- Tecla X para teleport
local TPKey = Enum.KeyCode.X
 
local UserInputService = game:GetService("UserInputService")
 
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == TPKey then
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp and mouse.Target then
			-- Teleportar ligeramente arriba del punto para no caer dentro del suelo
			hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0,3,0))
		end
	end
end)
 
   end,
})
 
        local Section = Misc:CreateSection("SelfDefense")
 
        local Button = Misc:CreateButton({
   Name = "Loop Health Safe (SemiGod mode)",
   Callback = function()
                    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local godmodeEnabled = false

-- Toggle Godmode with G key
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.G then
        godmodeEnabled = not godmodeEnabled
        if godmodeEnabled then
            print("Godmode: ON")
            -- Auto heal loop
            task.spawn(function()
                while godmodeEnabled and humanoid and humanoid.Health > 0 do
                    if humanoid.Health < humanoid.MaxHealth then
                        humanoid.Health = humanoid.MaxHealth
                    end
                    task.wait(0.2)
                end
            end)
        else
            print("Godmode: OFF")
        end
    end
end)

-- Update references on respawn
player.CharacterAdded:Connect(function(char)
    character = char
    humanoid = character:WaitForChild("Humanoid")
end)

    end,
})

local Button = Misc:CreateButton({
   Name = "ForceField",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local forceFieldEnabled = false
local forceFieldInstance = nil

local function toggleForceField()
    local char = player.Character
    if forceFieldEnabled then
        -- Remove existing ForceField
        if char and char:FindFirstChildOfClass("ForceField") then
            char:FindFirstChildOfClass("ForceField"):Destroy()
        end
        forceFieldInstance = nil
        forceFieldEnabled = false
        print("ForceField: OFF")
    else
        -- Add ForceField
        if char and not char:FindFirstChildOfClass("ForceField") then
            forceFieldInstance = Instance.new("ForceField")
            forceFieldInstance.Parent = char
        end
        forceFieldEnabled = true
        print("ForceField: ON")
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        toggleForceField()
    end
end)

-- Reapply ForceField on respawn if enabled
player.CharacterAdded:Connect(function(char)
    character = char
    if forceFieldEnabled then
        if not char:FindFirstChildOfClass("ForceField") then
            forceFieldInstance = Instance.new("ForceField")
            forceFieldInstance.Parent = char
        end
    end
end)

   end,
})
        
       -- NOCLIP
local noclipEnabled = false
local noclipConnection
local function toggleNoclip(state)
    noclipEnabled = state
    if state then
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if noclipConnection then noclipConnection:Disconnect() end
    end
end

MainTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = toggleNoclip
})
        -- FULL BRIGHT
local fullBrightEnabled = false
local function toggleFullBright(state)
    fullBrightEnabled = state
    if state then
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 12
        game.Lighting.FogEnd = 1e6
        game.Lighting.GlobalShadows = false
        game.Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
    else
        -- Reset Lighting (puedes ajustarlo)
        game.Lighting.Brightness = 1
        game.Lighting.ClockTime = 14
        game.Lighting.FogEnd = 1000
        game.Lighting.GlobalShadows = true
        game.Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
    end
end

Misc:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBrightToggle",
    Callback = toggleFullBright
})
 
                local Button = Misc:CreateButton({
   Name = "Anti Kick (client Sided)",
   Callback = function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Anti-Kick/main/Anti-Kick.lua"))()
   end,
})
 
        local Button = Misc:CreateButton({
   Name = "Unban VC",
   Callback = function()
           voiceChatService = game:GetService("VoiceChatService")
voiceChatService:joinVoice()
   end,
})
 
        local Button = Misc:CreateButton({
   Name = "ESP",
   Callback = function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexDevlpr/Simple-ESP-using-Highlight-Roblox-/main/Minified_ver.lua"))()
   end,
})
 
        local Button = Misc:CreateButton({
   Name = "FE Invisible",
   Callback = function()
 
loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
   end,
})
 
-- Crear la tab Scripts
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)
 
-- Crear sección Hubs dentro de Scripts
local HubsSection = ScriptsTab:CreateSection("Hubs")
 
-- Botones dentro de la sección Hubs
local Button = ScriptsTab:CreateButton({
    Name = "NameLess Admin",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/FilteringEnabled/NamelessAdmin/blob/main/Source?raw=true"))()
    end,
})
 
local Button = ScriptsTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
    end,
})
 
local Button = ScriptsTab:CreateButton({
    Name = "GhostHub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-X-Ghost-Hub-X-7595"))()
    end,
})
 
local Button = ScriptsTab:CreateButton({
    Name = "Aimbot (Not for Mobile)",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/agreed69-scripts/open-src-scripts/refs/heads/main/Universal%20Aimbot.lua",true))()
    end,
})
        local Utility = Misc:CreateSection("Utility")
 
        local Button = Misc:CreateButton({
   Name = "Check FPS and ping",
   Callback = function()
           local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
 
-- Revisar si ya existe el HUD
local existingHUD = gui:FindFirstChild("FPSHUD")
if existingHUD then
    existingHUD:Destroy()
    return
end
 
-- Crear sonido de notificación
local sound = gui:FindFirstChild("FPSNotifySound")
if not sound then
    sound = Instance.new("Sound")
    sound.Name = "FPSNotifySound"
    sound.SoundId = "rbxassetid://911882330" -- Sonido de notificación
    sound.Volume = 1
    sound.Parent = gui
end
sound:Play()
 
-- Crear ScreenGui y TextLabel para HUD
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSHUD"
screenGui.Parent = gui
 
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0,200,0,50)
fpsLabel.Position = UDim2.new(0,10,0,10)
fpsLabel.BackgroundTransparency = 0.5
fpsLabel.BackgroundColor3 = Color3.fromRGB(121,156,208) -- #799CD0
fpsLabel.TextColor3 = Color3.fromRGB(255,255,255)
fpsLabel.TextScaled = true
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.Text = "FPS: 0 | Ping: 0ms"
fpsLabel.Parent = screenGui
 
-- Variables
local fps = 0
local ping = 0
local frames = 0
local lastTime = tick()
 
-- Calcular FPS
RunService.RenderStepped:Connect(function()
    frames = frames + 1
    if tick() - lastTime >= 1 then
        fps = frames
        frames = 0
        lastTime = tick()
    end
end)
 
-- Calcular ping
RunService.Heartbeat:Connect(function(delta)
    ping = math.floor(delta * 1000) -- ms aproximado
end)
 
-- Actualizar HUD cada segundo
task.spawn(function()
    while fpsLabel.Parent do
        fpsLabel.Text = "FPS: "..fps.." | Ping: "..ping.."ms"
        task.wait(1)
    end
end)
 
   end,
})
 
        local Button = Misc:CreateButton({
   Name = "Check Health",
   Callback = function()
           local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local gui = player:WaitForChild("PlayerGui")
 
-- Crear sonido en PlayerGui si no existe
local sound = gui:FindFirstChild("HealthNotifySound")
if not sound then
    sound = Instance.new("Sound")
    sound.Name = "HealthNotifySound"
    sound.SoundId = "rbxassetid://911882330" -- Sonido de notificación
    sound.Volume = 1
    sound.Parent = gui
end
sound:Play()
 
-- Mostrar notificación con salud
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Health Check",
        Text = "Your actualy live is: " .. math.floor(humanoid.Health) .. " / " .. humanoid.MaxHealth,
        Duration = 5
    })
end)
 
   end,
})
local Button = Misc:CreateButton({
   Name = "Esp Npc Tools Models etc...",
   Callback = function()
   -- ESP para Tools y Models con ProximityPrompt
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
 
local ESPEnabled = true -- toggle para activar/desactivar
 
-- Función para crear highlight en un item
local function highlightItem(item)
    if item:IsA("BasePart") or item:IsA("Model") then
        if item:IsA("Model") then
            if not item.PrimaryPart then
                item.PrimaryPart = item:FindFirstChildWhichIsA("BasePart")
            end
            item = item.PrimaryPart
        end
        if not item:FindFirstChild("ESP_Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESP_Highlight"
            highlight.Adornee = item
            highlight.FillColor = Color3.fromRGB(121, 156, 208) -- azul #799CD0
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.Parent = item
        end
    end
end
 
-- Loop de ESP
RunService.RenderStepped:Connect(function()
    if ESPEnabled then
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("Tool") then
                highlightItem(obj.Handle or obj)
            elseif obj:IsA("Model") and obj:FindFirstChildWhichIsA("ProximityPrompt") then
                highlightItem(obj)
            end
        end
    else
        -- Limpiar ESP si se desactiva
        for _, obj in pairs(Workspace:GetDescendants()) do
            local h = obj:FindFirstChild("ESP_Highlight")
            if h then h:Destroy() end
        end
    end
end)
 
-- Notificación al ejecutar
StarterGui:SetCore("SendNotification", {
    Title = "ESP Activated",
    Text = "HighLighting tools",
    Duration = 3
})
 
   end,
})
 
        local Button = Misc:CreateButton({
   Name = "Restore Live",
   Callback = function()
           -- Heal Once Script (para tu simulador de exploits)
-- Solo cura al jugador una vez al ejecutarlo
 
local player = game.Players.LocalPlayer
 
local function healOnce()
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.MaxHealth > 0 then
            hum.Health = hum.MaxHealth
        end
    end
end
 
-- Ejecutar la curación inmediata
healOnce()
 
   end,
})
 
        local Button = Misc:CreateButton({
   Name = "Invisiblity v2 (z toggle)",
   Callback = function()
           --// Script: Invisibility Toggle con tecla Z
-- Tecla: Z
 
local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
sound.SoundId = "rbxassetid://942127495"
sound.Volume = 1
 
-- Estado global para mantener toggle aunque re-ejecutes
if _G.invis_on == nil then
    _G.invis_on = false
end
 
local function setTransparency(character, transparency)
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = transparency
        end
    end
end
 
local function toggleInvisibility()
    _G.invis_on = not _G.invis_on
    sound:Play()
 
    if _G.invis_on then
        local savedpos = player.Character.HumanoidRootPart.CFrame
        task.wait()
        player.Character:MoveTo(Vector3.new(-25.95, 84, 3537.55))
        task.wait(0.15)
 
        local Seat = Instance.new("Seat", workspace)
        Seat.Anchored = false
        Seat.CanCollide = false
        Seat.Name = "invischair"
        Seat.Transparency = 1
        Seat.Position = Vector3.new(-25.95, 84, 3537.55)
 
        local Weld = Instance.new("Weld", Seat)
        Weld.Part0 = Seat
        Weld.Part1 = player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso")
 
        task.wait()
        Seat.CFrame = savedpos
        setTransparency(player.Character, 0.5)
 
        game.StarterGui:SetCore("SendNotification", {
            Title = "Invis ON",
            Duration = 3,
            Text = "Now you are invisible"
        })
    else
        local invisChair = workspace:FindFirstChild("invischair")
        if invisChair then invisChair:Destroy() end
        setTransparency(player.Character, 0)
 
        game.StarterGui:SetCore("SendNotification", {
            Title = "Invis OFF",
            Duration = 3,
            Text = "Now you are visible"
        })
    end
end
 
-- Toggle con tecla Z
userInput.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.Z then
        toggleInvisibility()
    end
end)
 
-- También toggle inmediato al ejecutar
toggleInvisibility()
 
   end,
})

local Button = Misc:CreateButton({
   Name = "Bring all tools and models with PP",
   Callback = function()
           -- 🔹 Script: Traer todos los Tools y Modelos con Handle + ProximityPrompt hacia el jugador
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- Función para traer objetos
local function bringObject(obj)
	if obj:IsA("Tool") or (obj:IsA("Model") and obj:FindFirstChild("Handle")) then
		obj:PivotTo(root.CFrame + Vector3.new(0, 5, 0)) -- Los trae justo arriba tuyo
	elseif obj:IsA("BasePart") and obj:FindFirstChildOfClass("ProximityPrompt") then
		obj.CFrame = root.CFrame + Vector3.new(0, 5, 0)
	end
end

-- Buscar en Workspace
for _, obj in pairs(workspace:GetDescendants()) do
	bringObject(obj)
end

-- 🔁 Auto detectar nuevos objetos
workspace.DescendantAdded:Connect(function(obj)
	task.wait(0.2)
	bringObject(obj)
end)

-- 🔊 Notificación y Sonido
game.StarterGui:SetCore("SendNotification", {
	Title = "Bring Items",
	Text = "All Tools & Prompt Objects have been teleported!",
	Duration = 5
})

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://12222225" -- Sonido simple
sound.Volume = 3
sound.Parent = root
sound:Play()
   end,
})
        
        local Button = MainTab:CreateButton({
   Name = "Velocity Boost (C)",
   Callback = function()
           --// Script: Speed Boost Toggle
-- Tecla: C
 
local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
sound.SoundId = "rbxassetid://942127495"
sound.Volume = 1
 
local defaultSpeed = 16
local boostedSpeed = 48
local isSpeedBoosted = false
 
local function toggleSpeedBoost()
    isSpeedBoosted = not isSpeedBoosted
    sound:Play()
 
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        if isSpeedBoosted then
            humanoid.WalkSpeed = boostedSpeed
            game.StarterGui:SetCore("SendNotification", {
                Title = "Speed ON",
                Duration = 3,
                Text = "Velocidad: " .. boostedSpeed
            })
        else
            humanoid.WalkSpeed = defaultSpeed
            game.StarterGui:SetCore("SendNotification", {
                Title = "Speed OFF",
                Duration = 3,
                Text = "Velocidad: " .. defaultSpeed
            })
        end
    end
end
 
userInput.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.C then
        toggleSpeedBoost()
    end
end)
 
-- Reset al respawn
player.CharacterAdded:Connect(function(character)
    isSpeedBoosted = false
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = defaultSpeed
end)
 
   end,
})
 
        local Trolling = Window:CreateTab("Trolling", 4483362458) -- Title, Image
        local Section = Trolling:CreateSection("Random stuff")
 
        local Button = Trolling:CreateButton({
   Name = "Kill All (need tool)",
   Callback = function()
           -- LocalScript: Kill All en loop sin GUI
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
 
-- Toggle global
if _G.killAllActive == nil then
    _G.killAllActive = false
end
 
-- Función principal para matar a todos usando firetouchinterest
local function killAllLoop()
    while _G.killAllActive do
        local tool = char:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Handle") then
            tool:Activate()
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    local character = plr.Character
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            firetouchinterest(tool.Handle, part, 0)
                            firetouchinterest(tool.Handle, part, 1)
                        end
                    end
                end
            end
        end
        task.wait(0.5) -- espera medio segundo antes de repetir
    end
end
 
-- Toggle al ejecutar
if not _G.killAllActive then
    _G.killAllActive = true
    spawn(killAllLoop) -- ejecuta en loop en un hilo separado
else
    _G.killAllActive = false
    warn("Kill All loop detenido.")
end
 
   end,
})
 
        local Button = Trolling:CreateButton({
   Name = "Fe Kill npc Katana",
   Callback = function()
           loadstring(game:HttpGet("https://pastebin.com/raw/NTNHKeMZ", true))()
   end,
})
 
        local Button = Trolling:CreateButton({
   Name = "Super Ring",
   Callback = function()
           loadstring(game:HttpGet("https://pastebin.com/raw/aZjaAr6F"))()
   end,
})

local Button = Trolling:CreateButton({
   Name = "Forsaken animations (credits to owner)",
   Callback = function()
   		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d1226ca454068d9251732f34884a375e.lua"))()
   end,
})

-- 📌 Create Games Tab
local Games = Window:CreateTab("Games", 4483362458)

-- Get current game PlaceId
local placeId = game.PlaceId

-- Supported games list
local supportedGames = {
    [987654321] = "Guts & Blackpowder",
    [13943975949] = "SharkBite 2",
    [123456789] = "Break in 2",
    [71895508397153] = "Die Of Death",
    [81517697608629] = "Pwned by 14:00", 
    [3851622790] = "Break In", 
    [79546208627805] = "99 Nights in the Forest",
    [17382280326] = "RobloxiaUntilDown", --classic
    [80238404781977] = "RobloxiaUntilDown", -- Chaos Mode
    [5096191125] = "Field Trip Z",
    [99630341423433] = "Biast" 
}

-- 🟦 99 Nights in the Forest
    if placeId == 79546208627805 then
    local ForestTab = Games:CreateSection("99 Nights in the Forest")
    local Button = Games:CreateButton({
   Name = " See all hubs (not mine)",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/GreLQtfN"))()
   end,
})

local Button = Games:CreateButton({
   Name = "Gem farm",
   Callback = function()
   getgenv().WebhookURL = "" --If not used do not write anything
loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Farm%20Diamond%20v2.lua"))()
   end,
})

-- 🟦 Guts & Blackpowder
elseif placeId == 987654321 then
    local Section = Games:CreateSection("Guts & Blackpowder")

    Games:CreateButton({
        Name = "Kill aura (K toggle)",
        Callback = function()
            local SetLag = 9.5
SetLag = math.clamp(SetLag, 0, 10)
local WaitTime = SetLag * 0.4
if SetLag > 10 then WaitTime = 1.5 elseif SetLag <= 1 then WaitTime = 0 end

if _G.CombatSystemRunning then return end
_G.CombatSystemRunning = true

local UserInputService = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

local ATTACK_COOLDOWN = 1
local lastAttackTime = 0
local currentMode = 2 -- 1: Stop, 2: Normal, 3: Clear Zombie
local ZOMBIE_TYPES = {"Agent", "Slim"}

local osClock = os.clock
local mathRandom = math.random
local Vector3New = Vector3.new
local ipairs = ipairs

local KillAuraEnabled = false

-- Toggle Kill Aura with K
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.K then
        KillAuraEnabled = not KillAuraEnabled
        warn("🔁 Kill Aura is now: " .. (KillAuraEnabled and "ENABLED" or "DISABLED"))
    end
end)

local function executeAttack()
    if currentMode == 1 then return end
    local currentTime = osClock()
    if currentTime - lastAttackTime < ATTACK_COOLDOWN then return end

    local character = player.Character
    if not character then return end

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    local weapon = character:FindFirstChildWhichIsA("Tool")
    if not (rootPart and weapon) then return end

    local remoteEvent = weapon:FindFirstChildWhichIsA("RemoteEvent")
    if not remoteEvent then
        local meleeBase = weapon:FindFirstChild("MeleeBase")
        if meleeBase then
            remoteEvent = meleeBase:FindFirstChildWhichIsA("RemoteEvent")
        end
    end
    if not remoteEvent then return end

    local rootPos = rootPart.Position
    for _, agent in ipairs(workspace:GetDescendants()) do
        if table.find(ZOMBIE_TYPES, agent.Name) then
            local head = agent:FindFirstChild("Head")
            local humanoid = agent:FindFirstChildOfClass("Humanoid")
            if head and humanoid and humanoid.Health > 0 then
                local dist = (head.Position - rootPos).Magnitude
                if dist <= 19 then
                    local hitPos = head.Position
                    local dir = (hitPos - rootPos).Unit
                    local knockback = dir * 15

                    remoteEvent:FireServer("Swing", "Thrust")
                    remoteEvent:FireServer("HitZombie", agent, hitPos, true, knockback, "Head", Vector3New(mathRandom(), mathRandom(), mathRandom()).Unit)

                    if currentMode == 3 then
                        for i = 1, 4 do
                            task.wait(0.05)
                            remoteEvent:FireServer("Swing", "Thrust")
                            remoteEvent:FireServer("HitZombie", agent, hitPos + Vector3New(0, 0.2 * i, 0), true, knockback * (1 + i * 0.1), "Head", Vector3New(mathRandom(), mathRandom(), mathRandom()).Unit * (1 + i * 0.2))
                        end
                    end
                end
            end
        end
    end

    lastAttackTime = currentTime
end

RunService.Heartbeat:Connect(function()
    task.wait(WaitTime)
    if KillAuraEnabled then
        pcall(executeAttack)
    end
end)

     end,
            
})

    Games:CreateButton({
        Name = "Zombie ESP (T toggle)",
        Callback = function()
            -- ESP Highlight Script (No GUI) with T Toggle

local SetLag = 9.5
SetLag = math.clamp(SetLag, 0, 10)
local WaitTime = SetLag * 0.4
if SetLag > 10 then WaitTime = 1.5 elseif SetLag <= 1 then WaitTime = 0 end

local player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local cameraFolder = workspace:WaitForChild("Camera")
local zombieModelName = "m_Zombie"
local ESPEnabled = false

-- Toggle ESP with T
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T then
        ESPEnabled = not ESPEnabled
        warn("🔁 ESP is now: " .. (ESPEnabled and "ENABLED" or "DISABLED"))
    end
end)

local highlightConfig = {
    Torch = {Color = Color3.fromRGB(100, 255, 100), Transparency = 0.2},
    Axe = {Color = Color3.fromRGB(255, 100, 100), Transparency = 0.2},
    Default = {Color = Color3.fromRGB(240, 240, 240), Transparency = 0.2}
}

local function applyHighlight(model)
    if not model.PrimaryPart then
        model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart") or model:FindFirstChild("HumanoidRootPart")
        if not model.PrimaryPart then return end
    end

    local camera = workspace.CurrentCamera
    local screenPoint = camera:WorldToViewportPoint(model.PrimaryPart.Position)
    if screenPoint.Z <= 0 then return end

    for _, v in ipairs(model:GetDescendants()) do
        if v:IsA("Highlight") and v.Name:sub(1, 4) == "ZHL_" then
            v:Destroy()
        end
    end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ZHL_" .. tostring(math.random(1, 9999))
    highlight.Adornee = model
    highlight.FillTransparency = highlightConfig.Default.Transparency
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

    if model:FindFirstChild("Torch", true) then
        highlight.FillColor = highlightConfig.Torch.Color
    elseif model:FindFirstChild("Axe", true) then
        highlight.FillColor = highlightConfig.Axe.Color
    else
        highlight.FillColor = highlightConfig.Default.Color
    end

    highlight.Parent = model
end

local function updateHighlights()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    for _, model in ipairs(cameraFolder:GetDescendants()) do
        if model:IsA("Model") and model.Name == zombieModelName and model.PrimaryPart then
            local distance = (char.HumanoidRootPart.Position - model.PrimaryPart.Position).Magnitude
            if distance < 80 then
                applyHighlight(model)
            end
        end
    end
end

RunService.Heartbeat:Connect(function()
    task.wait(WaitTime)
    if ESPEnabled then
        pcall(updateHighlights)
    end
end)
        end,
    })

-- 🟦 SharkBite 2
elseif placeId == 13943975949 then
    local SharkTab = Games:CreateSection("SharkBite 2")

    local player = game.Players.LocalPlayer
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local character = player.Character or player.CharacterAdded:Wait()
    local backpack = player:WaitForChild("Backpack")
    local hrp = character:WaitForChild("HumanoidRootPart")

    local remote = nil
    local sharkName = nil
    local remotesFolder = ReplicatedStorage:WaitForChild("Projectiles"):WaitForChild("Events"):WaitForChild("Weapons"):WaitForChild("remotes")

    local function hookRemote(remoteObject)
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if self == remoteObject and (method == "FireServer" or method == "InvokeServer") then
                remote = self.Name
            end
            return old(self, ...)
        end)
    end

    for _, r in pairs(remotesFolder:GetChildren()) do
        if r:IsA("RemoteEvent") or r:IsA("RemoteFunction") then
            hookRemote(r)
        end
    end

    remotesFolder.ChildAdded:Connect(function(child)
        if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
            hookRemote(child)
        end
    end)

    local function getShark()
        local folder = workspace:FindFirstChild("Sharks")
        if folder then
            for _, shark in pairs(folder:GetChildren()) do
                if shark:IsA("Model") then
                    sharkName = shark.Name
                    return
                end
            end
        end
        sharkName = nil
    end

    local function KillShark()
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = character
            end
        end

        for i = 1, 40 do
            if sharkName and remote then
                local shark = workspace:WaitForChild("Sharks"):FindFirstChild(sharkName)
                local remoteInstance = remotesFolder:FindFirstChild(remote)
                if remoteInstance then
                    remoteInstance:FireServer(shark)
                end
            end
            task.wait()
        end
    end

    local function updateHRP()
        character = player.Character or player.CharacterAdded:Wait()
        backpack = player:WaitForChild("Backpack")
        hrp = character:WaitForChild("HumanoidRootPart")
    end
    player.CharacterAdded:Connect(updateHRP)

    local AutoFarmConn
    SharkTab:CreateToggle({
        Name = "Autofarm (Shoot shark once)",
        CurrentValue = false,
        Callback = function(val)
            if val then
                AutoFarmConn = RunService.Heartbeat:Connect(function(dt)
                    if player.Team and player.Team.Name ~= "Shark" and hrp then
                        if not remote then return end
                        KillShark()
                        getShark()

                        if not sharkName then
                            local chinook = workspace:FindFirstChild("Chinook")
                            if chinook and chinook:FindFirstChild("interior") then
                                hrp.CFrame = chinook.interior.CFrame
                            end
                        else
                            local radius = 1000
                            local speed = math.pi * 2
                            local center = Vector3.new(0, -100, 0)
                            local angle = tick() % (math.pi * 2)
                            local offset = Vector3.new(
                                math.cos(angle) * radius,
                                0,
                                math.sin(angle) * radius
                            )
                            hrp.CFrame = CFrame.new(center + offset, center)
                        end
                    end
                end)
            else
                if AutoFarmConn then
                    AutoFarmConn:Disconnect()
                    AutoFarmConn = nil
                end
            end
        end
    })

    local AutoWinConn
    local function getNearestSurvivor()
        local closest, dist = nil, math.huge
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Team and p.Team.Name == "Survivor" then
                local c = p.Character
                local h = c and c:FindFirstChild("Humanoid")
                local pHrp = c and c:FindFirstChild("HumanoidRootPart")
                if h and h.Health > 0 and pHrp then
                    local d = (pHrp.Position - hrp.Position).Magnitude
                    if d < dist then
                        dist = d
                        closest = p
                    end
                end
            end
        end
        return closest
    end

    SharkTab:CreateToggle({
        Name = "Auto Win (as Shark)",
        CurrentValue = false,
        Callback = function(val)
            if val then
                AutoWinConn = RunService.Heartbeat:Connect(function()
                    if player.Team and player.Team.Name == "Shark" then
                        local target = getNearestSurvivor()
                        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                            local pos = target.Character.HumanoidRootPart.Position
                            for _, s in pairs(workspace:WaitForChild("Sharks"):GetChildren()) do
                                for _, p in pairs(s:GetDescendants()) do
                                    if p:IsA("BasePart") and p.Name == "Ball" then
                                        p.CFrame = CFrame.new(pos)
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if AutoWinConn then
                    AutoWinConn:Disconnect()
                    AutoWinConn = nil
                end
            end
        end
    })

    local sharkESPConn = {}
    local function toggleSharkESP(enabled)
        local folder = workspace:FindFirstChild("Sharks")
        if not folder then return end
        for _, c in ipairs(sharkESPConn) do c:Disconnect() end
        table.clear(sharkESPConn)
        for _, d in pairs(folder:GetDescendants()) do
            if d:IsA("Highlight") then
                d.Enabled = enabled
                d.OutlineTransparency = enabled and 0 or 1
                table.insert(sharkESPConn, d:GetPropertyChangedSignal("Enabled"):Connect(function()
                    d.Enabled = enabled
                end))
                table.insert(sharkESPConn, d:GetPropertyChangedSignal("OutlineTransparency"):Connect(function()
                    d.OutlineTransparency = enabled and 0 or 1
                end))
            end
        end
    end

    SharkTab:CreateToggle({
        Name = "Highlight Sharks (ESP)",
        CurrentValue = false,
        Callback = function(val)
            toggleSharkESP(val)
        end
    })

    SharkTab:CreateParagraph({
        Title = "Credits",
        Content = "Script by mafuyu (Main)\nSimple Farm by spam77735"
    })
end

-- 🟦 Break In 2
elseif placeId == 123456789 then
    local Section = Games:CreateSection("Break In 2")
    Games:CreateButton({
        Name = "BreaKing Blitz (very OP)",
        Callback = function()
            
loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
        end,
    })

-- 🟦 Break In
elseif placeId == 3851622790 then
    local Section = Games:CreateSection("Break In")
    Games:CreateButton({
        Name = "Break In (very OP)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()

        end,
    })

-- 🟦 Die of Death
elseif placeId == 71895508397153 then
    local Section = Games:CreateSection("Die Of Death")
    Games:CreateButton({
        Name = "DoD Nexer Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/Die-Of-Death/refs/heads/main/txt.txt"))()
        end,
    })

        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local targetMinMaxHealth = 200
local aimbotEnabled = false
local aimSmoothness = 0.2 -- 0 = instant snap, higher = slower smooth

-- Find closest valid target player (max health >= 200)
local function findClosestTarget()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local localChar = localPlayer.Character
    if not localChar then return nil end
    local localHRP = localChar:FindFirstChild("HumanoidRootPart")
    if not localHRP then return nil end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            local humanoid = player.Character.Humanoid
            if humanoid.MaxHealth >= targetMinMaxHealth and humanoid.Health > 0 then
                local targetPart = player.Character:FindFirstChild("Head") or player.Character:FindFirstChild("HumanoidRootPart")
                if targetPart then
                    local distance = (targetPart.Position - localHRP.Position).Magnitude
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end
    return closestPlayer
end

-- Smoothly aim camera at target position
local function aimAtPosition(targetPos)
    local currentCFrame = camera.CFrame
    local lookVector = (targetPos - currentCFrame.Position).Unit
    local targetCFrame = CFrame.new(currentCFrame.Position, currentCFrame.Position + lookVector)
    camera.CFrame = currentCFrame:Lerp(targetCFrame, aimSmoothness)
end

-- Main aimbot loop
RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local targetPlayer = findClosestTarget()
        if targetPlayer and targetPlayer.Character then
            local targetPart = targetPlayer.Character:FindFirstChild("Head") or targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetPart then
                aimAtPosition(targetPart.Position)
            end
        end
    end
end)

-- Rayfield toggle integration example:

local Toggle = Games:CreateToggle({
    Name = "Aimbot Killer",
    CurrentValue = false,
    Flag = "Aimbot200HP",
    Callback = function(value)
        aimbotEnabled = value
    end,
})


-- 🟦 Pwned by 14:00
elseif placeId == 81517697608629 then
    local Section = Games:CreateSection("Pwned by 14:00")
    Games:CreateButton({
        Name = "Inf Stamina",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Minnngocc/PWNED-by-14-00/refs/heads/main/Infinite%20stamina"))()
        end,
    })

-- 🟦 Biast
elseif placeId == 99630341423433 then
    local Section = Games:CreateSection("Biast")

    -- Dropdown example (your item teleporter stuff)
    local player = game.Players.LocalPlayer
    local selectedItem = nil
    local itemsFolder = workspace:FindFirstChild("Items")

    local function scanItems()
        local items = {}
        if itemsFolder then
            for _, obj in pairs(itemsFolder:GetChildren()) do
                if obj:IsA("Model") or obj:IsA("BasePart") then
                    table.insert(items, obj.Name)
                end
            end
        end
        return items
    end

    local Dropdown = Games:CreateDropdown({
        Name = "Select Item",
        Options = scanItems(),
        CurrentOption = {},
        MultipleOptions = false,
        Callback = function(option)
            selectedItem = option[1]
        end,
    })

    Games:CreateButton({
        Name = "Teleport to Item",
        Callback = function()
            if not selectedItem or not itemsFolder then return end
            local obj = itemsFolder:FindFirstChild(selectedItem)
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if obj and hrp then
                if obj:IsA("Model") and obj.PrimaryPart then
                    hrp.CFrame = obj.PrimaryPart.CFrame + Vector3.new(0,3,0)
                elseif obj:IsA("BasePart") then
                    hrp.CFrame = obj.CFrame + Vector3.new(0,3,0)
                end
            end
        end,
    })

    Games:CreateButton({
        Name = "Refresh Item List",
        Callback = function()
            Dropdown:Refresh(scanItems())
        end,
    })

    Games:CreateButton({
        Name = "Inf Stamina",
        Callback = function()
            local char = player.Character or player.CharacterAdded:Wait()
            local stamina = char:FindFirstChild("Stamina")
            if stamina then
                local noCD = stamina:FindFirstChild("NoCooldown")
                if noCD and noCD:IsA("BoolValue") then
                    noCD.Value = true
                end
            end
        end,
    })

        local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local runAimbot = false
local HEALTH_THRESHOLD = 200
local AIM_UPDATE_INTERVAL = 0.1

-- Returns the closest player with MaxHealth > 200
local function getClosestTarget()
    local closest = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local hrp = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            local hum = otherPlayer.Character:FindFirstChild("Humanoid")
            if hrp and hum and hum.MaxHealth > HEALTH_THRESHOLD then
                local distance = (player.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closest = hrp
                end
            end
        end
    end

    return closest
end

-- Point camera at the target
local function lookAt(target)
    if not target then return end
    local camPos = camera.CFrame.Position
    local lookVector = (target.Position - camPos).Unit
    camera.CFrame = CFrame.new(camPos, camPos + lookVector)
end

-- Aimbot main loop
local function aimbotLoop()
    while runAimbot do
        local target = getClosestTarget()
        if target then
            lookAt(target)
        end
        task.wait(AIM_UPDATE_INTERVAL)
    end
end

-- ✅ Rayfield Toggle
local AimbotBiast = Games:CreateToggle({
   Name = "Aimbot Killer",
   CurrentValue = false,
   Flag = "AimbotToggle",
   Callback = function(Value)
       runAimbot = Value
       if runAimbot then
           task.spawn(aimbotLoop)
       end
   end,
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Settings
local itemsFolder = workspace:FindFirstChild("Items") or workspace
local fallbackPosition = Vector3.new(0, 5, 0)
local itemKeywords = {"teapot", "scroll", "drako"}
local deliveryKeywords = {"delivery", "drop", "submit", "turnin", "goal"}

local pickedItems = {}

-- Simulate key press
local function pressKey(key)
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, key:lower(), false, game)
    task.wait(0.1)
    vim:SendKeyEvent(false, key:lower(), false, game)
end

-- Find delivery zone
local function findDeliveryPoint()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local name = obj.Name:lower()
            for _, keyword in pairs(deliveryKeywords) do
                if name:find(keyword) then
                    print("[Delivery Found]:", obj:GetFullName())
                    return obj
                end
            end
        end
    end
    return nil
end

-- Teleport to object
local function teleportTo(obj)
    if not obj then return end
    if obj:IsA("Model") and obj.PrimaryPart then
        hrp.CFrame = obj.PrimaryPart.CFrame + Vector3.new(0, 3, 0)
    elseif obj:IsA("BasePart") then
        hrp.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
    end
end

-- Find nearest valid item
local function findNextItem()
    local closest = nil
    local shortest = math.huge

    for _, obj in pairs(itemsFolder:GetChildren()) do
        if (obj:IsA("Model") or obj:IsA("BasePart")) and not pickedItems[obj] then
            local name = obj.Name:lower()
            for _, keyword in pairs(itemKeywords) do
                if name:find(keyword) then
                    local objPos = (obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position) or obj.Position
                    local distance = (hrp.Position - objPos).Magnitude
                    if distance < shortest then
                        shortest = distance
                        closest = obj
                    end
                end
            end
        end
    end

    if closest then
        pickedItems[closest] = true
    end
    return closest
end

-- ✅ Rayfield Toggle
Games:CreateToggle({
    Name = " (BETA) Auto Farm Items",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(runFarm)
        if runFarm then
            task.spawn(function()
                local deliveryPoint = findDeliveryPoint()
                while runFarm do
                    task.wait(1)

                    character = player.Character or player.CharacterAdded:Wait()
                    hrp = character:FindFirstChild("HumanoidRootPart")
                    if not hrp then continue end

                    local targetItem = findNextItem()
                    if targetItem then
                        teleportTo(targetItem)
                        task.wait(0.5)
                        pressKey("e")
                        task.wait(1)

                        if deliveryPoint then
                            teleportTo(deliveryPoint)
                        else
                            hrp.CFrame = CFrame.new(fallbackPosition)
                        end

                        task.wait(0.5)

                        local tool = player.Backpack:FindFirstChildOfClass("Tool") or character:FindFirstChildOfClass("Tool")
                        if tool then
                            pressKey("q")
                        end
                    end
                end
            end)
        end
    end,
})

--HitBox Expander
        
        local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local localPlayer = Players.LocalPlayer
local targetMinMaxHealth = 200
local scaleFactor = 5 -- How much bigger hitboxes get (5x size)

-- Parts to expand (commonly hitbox parts)
local hitboxParts = {
    "HumanoidRootPart",
    "Head",
    "Torso",
    "UpperTorso",
    "LowerTorso"
}

-- Store original sizes and original CFrames (to restore size and avoid shifting)
local originalSizes = {}
local originalCFrames = {}

local runExpand = false

-- Tween info for smooth scaling
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function expandPart(part)
    if not part then return end
    if originalSizes[part] == nil then
        originalSizes[part] = part.Size
        originalCFrames[part] = part.CFrame
    end

    local newSize = originalSizes[part] * scaleFactor
    -- Calculate size diff and adjust CFrame to keep part centered properly
    local sizeDiff = (newSize - part.Size) * 0.5
    local newCFrame = part.CFrame * CFrame.new(0, sizeDiff.Y, 0)

    local tweenSize = TweenService:Create(part, tweenInfo, {Size = newSize, CFrame = newCFrame})
    tweenSize:Play()
end

local function restorePart(part)
    if not part then return end
    if originalSizes[part] then
        local tweenRestore = TweenService:Create(part, tweenInfo, {Size = originalSizes[part], CFrame = originalCFrames[part]})
        tweenRestore:Play()
        originalSizes[part] = nil
        originalCFrames[part] = nil
    end
end

local function expandCharacter(character)
    for _, partName in ipairs(hitboxParts) do
        local part = character:FindFirstChild(partName)
        if part and part:IsA("BasePart") then
            expandPart(part)
        end
    end
end

local function restoreCharacter(character)
    for _, partName in ipairs(hitboxParts) do
        local part = character:FindFirstChild(partName)
        if part and part:IsA("BasePart") then
            restorePart(part)
        end
    end
end

-- Main loop to apply expansion on valid players
task.spawn(function()
    while true do
        task.wait(1)
        if runExpand then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= localPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                    local humanoid = player.Character.Humanoid
                    if humanoid.MaxHealth >= targetMinMaxHealth then
                        expandCharacter(player.Character)
                    else
                        restoreCharacter(player.Character)
                    end
                end
            end
        else
            -- Restore all if toggle off
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character then
                    restoreCharacter(player.Character)
                end
            end
        end
    end
end)

-- Handle character respawn for each player
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        task.wait(1)
        if runExpand and player ~= localPlayer then
            local humanoid = character:WaitForChild("Humanoid")
            if humanoid.MaxHealth >= targetMinMaxHealth then
                expandCharacter(character)
            end
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        restoreCharacter(player.Character)
    end
end)

-- Now plug into Rayfield toggle:

local Toggle = Games:CreateToggle({
    Name = "Easy Hitbox Expander",
    CurrentValue = false,
    Flag = "UniversalHitboxExpander",
    Callback = function(value)
        runExpand = value
        if not value then
            -- Restore immediately on toggle off
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character then
                    restoreCharacter(player.Character)
                end
            end
        end
    end,
})

        local Button = Games:CreateButton({
   Name = "Biast Nexer HUb (Advanced)",
   Callback = function()
   
loadstring(game:HttpGet("https://raw.githubusercontent.com/nexeralt/Loaders/refs/heads/main/BIAST.RBXL"))()
   end,
})

        -- 🟦 RobloxiaUntilDown
elseif placeId == 987654321 or placeId == 80238404781977 then
    local Section = Games:CreateSection("RobloxiaUntilDown")

        local Button = Games:CreateButton({
   Name = "Execute Nexer Hub (OP)",
   Callback = function()
   
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/NexerHub-TR-UD/refs/heads/main/NHTRUD.lua"))()
   end,
})

         -- 🟦 Field Trip Z
elseif placeId == 5096191125 then
    local Section = Games:CreateSection("Field Trip Z")

        local Button = Games:CreateButton({
   Name = "Pepsi Cat Hub",
   Callback = function()
   
loadstring(game:HttpGet("https://pastebin.com/raw/pP0QtSEC"))()
   end,
})
        
-- 🟥 Unsupported Games
else
    local Section = Games:CreateSection("Unsupported Game")

    -- Build a list of supported game names
    local gameNames = {}
    for _, name in pairs(supportedGames) do
        table.insert(gameNames, "- " .. name)
    end

    -- Show message with supported games list
    Games:CreateParagraph({
        Title = "Oops!",
        Content = "Looks like you are in an unsupported game.\n\nSupported Games:\n" ..
            table.concat(gameNames, "\n")
    })
end

        -- Useful stuff down here
        -- TP TO NEAREST TOOL/MODEL WITH HANDLE + PROXIMITYPROMPT
local function tpNearest()
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

    local root = player.Character.HumanoidRootPart
    local nearest, dist = nil, math.huge

    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("Tool") or obj:IsA("Model")) and obj:FindFirstChild("Handle") and obj:FindFirstChildWhichIsA("ProximityPrompt", true) then
            local handle = obj:FindFirstChild("Handle")
            if handle then
                local d = (handle.Position - root.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = handle
                end
            end
        end
    end

    if nearest then
        root.CFrame = nearest.CFrame + Vector3.new(0,3,0)
    end
end

Misc:CreateButton({
    Name = "TP to Nearest Tool/Model",
    Callback = tpNearest
})

-- Sección Protection
local Inmunity = Useful:CreateSection("Protection")
--No fall  damage

local Button = Useful:CreateButton({
   Name = "No Fall damage",
   Callback = function()
local v0=game:GetService("Players");local v1=game:GetService("RunService");local v2=game:GetService("UserInputService");local v3=v0.LocalPlayer;local v4=v3.Character or v3.CharacterAdded:Wait() ;local v5=v4:WaitForChild("Humanoid");local v6=v4:WaitForChild("HumanoidRootPart");local v7=false;local v8=v6.Position.Y;local v9=false;local v10= -(1847 -(1228 + 618));local v11=50;v3.CharacterAdded:Connect(function(v12) local v13=0;while true do if (v13==0) then v4=v12;v5=v12:WaitForChild("Humanoid");v13=1 -0 ;end if (v13==1) then v6=v12:WaitForChild("HumanoidRootPart");v7=false;v13=7 -5 ;end if (v13==2) then pcall(function() v5.PlatformStand=false;end);v8=v6.Position.Y;break;end end end);v2.InputBegan:Connect(function(v14) if v7 then local v20=952 -(802 + 150) ;local v21;while true do if (v20==(0 -0)) then v21={Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Space,Enum.KeyCode.LeftShift};for v33=1 + 0 , #v21 do if (v14.KeyCode==v21[v33]) then return;end end break;end end end end);v2.InputChanged:Connect(function(v15) if v7 then local v22={Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Space,Enum.KeyCode.LeftShift};for v24=1 -0 , #v22 do if (v15.KeyCode==v22[v24]) then return;end end end end);v1.Heartbeat:Connect(function(v16) local v17=0 + 0 ;local v18;local v19;while true do if (v17==(792 -(368 + 423))) then v19=v18-v8 ;v8=v18;v17=6 -4 ;end if (0==v17) then if v5.SeatPart then local v27=18 -(10 + 8) ;while true do if (1==v27) then return;end if (v27==0) then if v7 then local v39=0 -0 ;while true do if (v39==(443 -(416 + 26))) then print("Flug pausiert wegen Sitzen");break;end if (v39==0) then v7=false;pcall(function() v5.PlatformStand=false;end);v39=3 -2 ;end end end v9=true;v27=1 + 0 ;end end else v9=false;end v18=v6.Position.Y;v17=1 -0 ;end if (v17==2) then if ((v19<v10) and  not v7 and  not v9) then local v28=438 -(145 + 293) ;while true do if (v28==(431 -(44 + 386))) then print("Flugmodus: AN");break;end if (v28==(1486 -(998 + 488))) then v7=true;pcall(function() v5.PlatformStand=true;end);v28=1 + 0 ;end end end if (v7 and (math.abs(v19)<(0.01 + 0))) then v7=false;pcall(function() v5.PlatformStand=false;end);print("Flugmodus: AUS (Y stabil)");return;end v17=775 -(201 + 571) ;end if (v17==3) then if v7 then local v29=1138 -(116 + 1022) ;local v30;local v31;local v32;while true do if (v29==(0 -0)) then v30=v6.Position;v31,v32,v31=v6.Orientation:ToEulerAnglesYXZ();v29=1 + 0 ;end if (v29==(3 -2)) then v6.CFrame=CFrame.new(v30) * CFrame.Angles(0 -0 ,math.rad(v32),859 -(814 + 45) ) ;v6.Velocity=Vector3.new(0 -0 ,v6.Velocity.Y,0);break;end end end break;end end end);
   end,
})
    
-- Anti Void
Useful:CreateToggle({
    Name = "Anti Void",
    CurrentValue = false,
    Flag = "AntiVoid",
    Callback = function(Value)
        _G.AntiVoid = Value
        if Value then
            spawn(function()
                while _G.AntiVoid do
                    local player = game.Players.LocalPlayer
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        if player.Character.HumanoidRootPart.Position.Y < -20 then
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(0,50,0)
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})

-- Anti Seat Lock
Useful:CreateToggle({
    Name = "Anti Seat Lock",
    CurrentValue = false,
    Flag = "AntiSeat",
    Callback = function(Value)
        _G.AntiSeat = Value
        if Value then
            spawn(function()
                while _G.AntiSeat do
                    local player = game.Players.LocalPlayer
                    if player.Character then
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Sit then
                            hum.Sit = false
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})

-- Anti Freeze
Useful:CreateToggle({
    Name = "Anti Freeze",
    CurrentValue = false,
    Flag = "AntiFreeze",
    Callback = function(Value)
        _G.AntiFreeze = Value
        if Value then
            spawn(function()
                while _G.AntiFreeze do
                    local player = game.Players.LocalPlayer
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local root = player.Character.HumanoidRootPart
                        if root.Anchored == true then
                            root.Anchored = false
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})

-- Reset Stats
Useful:CreateToggle({
    Name = "Reset Stats",
    CurrentValue = false,
    Flag = "ResetStats",
    Callback = function(Value)
        _G.ResetStats = Value
        local player = game.Players.LocalPlayer
        local defaultWalkSpeed = 16
        local defaultJumpPower = 50

        local function applyReset(char)
            local hum = char:WaitForChild("Humanoid")
            hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if _G.ResetStats and hum.WalkSpeed ~= defaultWalkSpeed then
                    hum.WalkSpeed = defaultWalkSpeed
                end
            end)
            hum:GetPropertyChangedSignal("JumpPower"):Connect(function()
                if _G.ResetStats and hum.JumpPower ~= defaultJumpPower then
                    hum.JumpPower = defaultJumpPower
                end
            end)
        end

        if player.Character then
            applyReset(player.Character)
        end
        player.CharacterAdded:Connect(applyReset)
    end
})

-- Sección Teleport
local TP = Useful:CreateSection("Teleport")

-- Variable global para guardar posición
_G.SavedPosition = nil

-- Botón Set Position
Useful:CreateButton({
    Name = "Set Position",
    Callback = function()
        local player = game.Players.LocalPlayer
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            _G.SavedPosition = hrp.Position
            game.StarterGui:SetCore("SendNotification", {
                Title = "Position Saved",
                Text = "Coordinates saved successfully!",
                Duration = 3
            })
        end
    end
})

-- Botón Teleport
Useful:CreateButton({
    Name = "Teleport to Saved Position",
    Callback = function()
        local player = game.Players.LocalPlayer
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            if _G.SavedPosition then
                hrp.CFrame = CFrame.new(_G.SavedPosition)
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Teleported",
                    Text = "You have been teleported to the saved position!",
                    Duration = 3
                })
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Error",
                    Text = "No saved position found. Press 'Set Position' first.",
                    Duration = 3
                })
            end
        end
    end
})

local Combat = Useful:CreateSection("Combat")

local Button = Useful:CreateButton({
   Name = "Hitbox Expander (Bugged)",
   Callback = function()
   		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwoqeex/Hitbox-Expander/refs/heads/main/Hitboxes"))()
   end,
})

    local Button = Useful:CreateButton({
   Name = "Jason HitBox (buggy if walk or run when hit but op also works on forsaken but can work on ther games) ",
   Callback = function()
   
local HitboxModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/nexeralt/ForsakenHitboxExtender/refs/heads/main/open%20source.luau"))()

HitboxModule:StopExtendingHitbox() -- This stops extending hitboxes

HitboxModule:ExtendHitbox(2, 9e9) -- First argument is power ( in studs ) and second argument is how long should hitbox extend be applied.

-- PS: i know that hitboxes dissapear into far when walking or running, fix that by yourself coder stealers ✌️
   end,
})

    local Devs = Useful:CreateSection("Devs")

    local Adornments = {}
local HighlightConnection

-- Create a BoxHandleAdornment for a part
local function createAdornment(part, color)
    if not Adornments[part] and part:IsA("BasePart") then
        local adorn = Instance.new("BoxHandleAdornment")
        adorn.Adornee = part
        adorn.AlwaysOnTop = true
        adorn.ZIndex = 0
        adorn.Size = part.Size
        adorn.Color3 = color
        adorn.Transparency = 0.3  -- as requested
        adorn.Name = "HitboxHighlight"
        adorn.Parent = game.CoreGui
        Adornments[part] = adorn
    elseif Adornments[part] then
        -- update color/size if it changed
        Adornments[part].Color3 = color
        Adornments[part].Size = part.Size
    end
end

local function removeAdornment(part)
    if Adornments[part] then
        Adornments[part]:Destroy()
        Adornments[part] = nil
    end
end

-- Helper to decide if part belongs to a player character
local Players = game:GetService("Players")
local function isPlayerPart(part)
    local model = part:FindFirstAncestorOfClass("Model")
    if model and model:FindFirstChild("Humanoid") then
        return true
    end
    return false
end

-- Start highlighting loop
local function startHighlighting()
    HighlightConnection = game:GetService("RunService").Heartbeat:Connect(function()
        -- Throttle to every 0.5 sec
        if not HighlightConnection.LastRun or tick() - HighlightConnection.LastRun >= 0.5 then
            HighlightConnection.LastRun = tick()

            -- Clean adornments for parts that no longer exist
            for part, adorn in pairs(Adornments) do
                if not part or not part.Parent then
                    removeAdornment(part)
                end
            end

            -- Scan all parts in workspace
            for _, part in ipairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    if isPlayerPart(part) then
                        -- Player parts in blue
                        createAdornment(part, Color3.fromRGB(0, 0, 255))
                    else
                        -- Non-player parts (guns/tools) in red
                        createAdornment(part, Color3.fromRGB(255, 0, 0))
                    end
                end
            end
        end
    end)
end

-- Stop highlighting loop
local function stopHighlighting()
    if HighlightConnection then
        HighlightConnection:Disconnect()
        HighlightConnection = nil
    end
    for part, adorn in pairs(Adornments) do
        adorn:Destroy()
    end
    Adornments = {}
end

-- Rayfield toggle
Useful:CreateToggle({
    Name = "Show All Hitboxes",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            startHighlighting()
        else
            stopHighlighting()
        end
    end,
})

    local Fun = Window:CreateTab("Fun", 4483362458) -- Title, Image
    local Section = Fun:CreateSection("Animations")

    -- 🎭 BluuGui Fun Tab: Ultimate Animation Changer

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer


-- State
local currentTrack = nil
local loopEnabled = false
local userAnimId = ""
local movementAnims = {}

-- Preset animations
local presetAnims = {
    ["R6 - Dance"] = "182435998",
    ["R6 - Wave"] = "128777973",
    ["R6 - Point"] = "128853357",
    ["R6 - Cheer"] = "129423030",
    ["R6 - Laugh"] = "129423131",

    ["R15 - Dance 1"] = "507771019",
    ["R15 - Dance 2"] = "507776043",
    ["R15 - Dance 3"] = "507777268",
    ["R15 - Wave"] = "507770239",
    ["R15 - Point"] = "507770453",
    ["R15 - Cheer"] = "507770677",
    ["R15 - Laugh"] = "507770818",

    ["Monster Mash"] = "107864975312860",      -- Bluudud’s favorite
    ["Russian Dance"] = "79145094121685",     -- UGC emote :contentReference[oaicite:2]{index=2}
}

-- Animation Playback Helper
local function playAnim(id, name)
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    -- Stop same-name track to prevent overlap
    for _, tr in ipairs(humanoid:GetPlayingAnimationTracks()) do
        if tr.Name == name then tr:Stop() end
    end

    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. id
    local track = humanoid:LoadAnimation(anim)
    track.Name = name
    track.Looped = loopEnabled
    track:Play()

    currentTrack = track
    warn("Playing: " .. name .. " (Loop: " .. tostring(loopEnabled) .. ")")
end

-- UI: Loop Toggle
Fun:CreateToggle({
    Name = "Loop Animation",
    CurrentValue = false,
    Callback = function(val) loopEnabled = val end
})

-- UI: Custom Animation Input
Fun:CreateInput({
    Name = "Custom Animation ID",
    PlaceholderText = "Paste any animation ID",
    RemoveTextAfterFocusLost = false,
    Callback = function(text) userAnimId = text end,
})

Fun:CreateButton({
    Name = "▶ Play Custom Animation",
    Callback = function()
        if userAnimId ~= "" then
            playAnim(userAnimId, "CustomAnim")
        else
            warn(" No animation ID entered!")
        end
    end,
})

-- UI: Preset Animations Dropdown
Fun:CreateDropdown({
    Name = "Preset Animations",
    Options = table.keys(presetAnims),
    CurrentOption = {},
    MultipleOptions = false,
    Callback = function(opt)
        local name = opt[1]
        playAnim(presetAnims[name], name)
    end,
})

-- UI: Stop Animation
Fun:CreateButton({
    Name = "⏹ Stop Animation",
    Callback = function()
        if currentTrack then
            currentTrack:Stop()
            currentTrack = nil
            warn("Animation stopped.")
        else
            warn("No animation playing.")
        end
    end,
})

--  Movement Animations Replacer
local defaultTypes = { "Idle", "Walk", "Run", "Jump", "Swim" }
for _, animType in ipairs(defaultTypes) do
    Fun:CreateInput({
        Name = animType .. " Animation ID",
        PlaceholderText = "Enter animation ID",
        RemoveTextAfterFocusLost = false,
        Callback = function(id)
            movementAnims[animType] = id
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = char:WaitForChild("Humanoid")
            local animate = char:FindFirstChild("Animate")

            if animate and id ~= "" then
                local animObj
                if animType == "Idle" then
                    animObj = animate:FindFirstChild("idle") and animate.idle:FindFirstChild("Animation1")
                else
                    animObj = animate:FindFirstChild(animType:lower())
                end

                if animObj and animObj:IsA("Animation") then
                    animObj.AnimationId = "rbxassetid://" .. id
                end
            end
        end,
    })
end

-- 🎵 Fun Section: Music Player

local MusicSection = Fun:CreateSection("Music Player (No FE)")

-- Sound holder
local sound = Instance.new("Sound")
sound.Parent = game:GetService("SoundService")
sound.Looped = true
sound.Volume = 1 -- default volume

-- Premade tracks
local premadeTracks = {
    ["It's Raining Tacos"] = "142376088", -- classic meme song
    ["Bluudanc"] = "9121645091", -- placeholder, replace with your track
    ["Random Meme 1"] = "184735242", -- Darude Sandstorm
    ["Random Meme 2"] = "458726741", -- Crab Rave
}

-- Input for custom music
Fun:CreateInput({
    Name = "Custom SoundId",
    PlaceholderText = "Enter SoundId here",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        if tonumber(value) then
            sound.SoundId = "rbxassetid://" .. value
            sound:Play()
        else
            warn("Invalid SoundId")
        end
    end,
})

-- Dropdown for premade tracks
Fun:CreateDropdown({
    Name = "Premade Songs",
    Options = {"It's Raining Tacos", "Bluudanc", "Random Meme 1", "Random Meme 2"},
    CurrentOption = {},
    MultipleOptions = false,
    Callback = function(option)
        local id = premadeTracks[option[1]]
        if id then
            sound.SoundId = "rbxassetid://" .. id
            sound:Play()
        end
    end,
})

-- Buttons
Fun:CreateButton({
    Name = "▶️ Play",
    Callback = function()
        if sound.SoundId ~= "" then
            sound:Play()
        end
    end,
})

Fun:CreateButton({
    Name = "⏹ Stop",
    Callback = function()
        sound:Stop()
    end,
})

-- Volume Slider
Fun:CreateSlider({
    Name = "🔊 Volume",
    Range = {0, 10},
    Increment = 1,
    CurrentValue = 5,
    Callback = function(value)
        sound.Volume = value / 10 -- scale 0–10 slider to 0–1 volume
    end,
})

-- Loop Toggle
Fun:CreateToggle({
    Name = "🔁 Loop Song",
    CurrentValue = true,
    Callback = function(val)
        sound.Looped = val
    end,
})

-- 🎡 SpinBot Section
local SpinSection = Fun:CreateSection("SpinBot")

local spinning = false
local spinConnection
local spinVelocity = 10 -- default spin speed

-- Spin Toggle
Fun:CreateToggle({
    Name = "🌀 Enable SpinBot",
    CurrentValue = false,
    Callback = function(val)
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")

        if val then
            spinning = true
            spinConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if hrp and spinning then
                    hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(spinVelocity), 0)
                end
            end)
        else
            spinning = false
            if spinConnection then
                spinConnection:Disconnect()
                spinConnection = nil
            end
        end
    end,
})

-- Velocity Slider
Fun:CreateSlider({
    Name = "⚡ Spin Speed",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 10,
    Callback = function(value)
        spinVelocity = value
    end,
})

-- 🌀 Fun Tab Extras

-- 🌐 Section
local FunExtras = Fun:CreateSection("Bluu Extras")

-- ⚡ Chat Spammer
local chatSpamConnection
local spamMessages = {
    "BluuGui on top!", 
    "Bluudud forever!", 
    "Powered by BluuGui!", 
    "Spin with Bluudanc!"
}

Fun:CreateToggle({
    Name = "Chat spamer (trash talk)",
    CurrentValue = false,
    Callback = function(val)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local chatEvent = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")

        if val then
            chatSpamConnection = task.spawn(function()
                while task.wait(3) do -- every 3 seconds
                    if not chatSpamConnection then break end
                    local msg = spamMessages[math.random(1, #spamMessages)]
                    chatEvent:FireServer(msg, "All")
                end
            end)
        else
            chatSpamConnection = nil
        end
    end,
})

-- 🐢 Fake Lag
local fakeLag = false
local lagConnection

Fun:CreateToggle({
    Name = "Fake Lag",
    CurrentValue = false,
    Callback = function(val)
        local RunService = game:GetService("RunService")
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")

        if val then
            fakeLag = true
            lagConnection = RunService.Heartbeat:Connect(function()
                if fakeLag and hrp then
                    hrp.Anchored = true
                    task.wait(1) -- "freeze" for 1 second
                    hrp.Anchored = false
                end
            end)
        else
            fakeLag = false
            if lagConnection then
                lagConnection:Disconnect()
                lagConnection = nil
            end
        end
    end,
})

-- 🌊 Wow Thingz are geting a whole Bluu (World Recolor)
local bluuEnabled = false
local bluuConnection

Fun:CreateToggle({
    Name = "Wow Thingz are geting a whole Bluu",
    CurrentValue = false,
    Callback = function(val)
        bluuEnabled = val
        local player = game.Players.LocalPlayer

        if bluuEnabled then
            -- Apply blue filter loop
            bluuConnection = game:GetService("RunService").Heartbeat:Connect(function()
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj:IsDescendantOf(player.Character) == false then
                        obj.Color = Color3.fromRGB(0, 162, 255) -- Roblox Blue tone
                        obj.Material = Enum.Material.SmoothPlastic -- smooth look
                    elseif obj:IsA("Decal") or obj:IsA("Texture") then
                        obj.Color3 = Color3.fromRGB(0, 162, 255)
                    end
                end
            end)
        else
            -- Disable effect and restore (optional reset)
            if bluuConnection then
                bluuConnection:Disconnect()
                bluuConnection = nil
            end
        end
    end,
})

    local Tools = Fun:CreateSection("Tools")

    local Button = Fun:CreateButton({
   Name = "Telekinesis tool (FE)",
   Callback = function()
   -- Telekinesis V5 Tool (no GUI)  
-- Gives LocalPlayer the tool immediately  

local Player = game.Players.LocalPlayer
local Lighting = game:GetService("Lighting")

local re = game:GetService("Workspace")
local sandbox = function(var, func)
    local env = getfenv(func)
    local newenv = setmetatable({}, {
        __index = function(self, k)
            if k == "script" then
                return var
            else
                return env[k]
            end
        end,
    })
    setfenv(func, newenv)
    return func
end
local cors = {}
local _Name = "Telekinesis V5"
local uis = game:GetService("UserInputService")
local _Ins, _CF_new, _VTR_new = Instance.new, CFrame.new, Vector3.new
mas = _Ins("Model", Lighting)
local con = getfenv().sethiddenproperty

Tool0 = _Ins("Tool")
Part1 = _Ins("Part")
Script2 = _Ins("Script")
local selectionbox = Instance.new("SelectionBox", Player.Character)
selectionbox.LineThickness = 0.3
selectionbox.Color3 = Color3.fromRGB(255, 255, 255)
LocalScript3 = _Ins("LocalScript")
re = game:GetService("RunService")

Tool0.Name = _Name
Tool0.Parent = mas
Tool0.Grip = _CF_new(0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Tool0.GripPos = _VTR_new(0, 0, 1)

Part1.Name = "Handle"
Part1.Parent = Tool0
local changed = "Changed"
Part1.CFrame = _CF_new(-3.5, 5.30000019, -3.5, 1, 0, 0, 0, -1, 0, 0, 0, -1)
Part1.Orientation = _VTR_new(0, 180, 180)
Part1.Position = _VTR_new(-3.5, 5.300000190734863, -3.5)
Part1.Rotation = _VTR_new(-180, 0, 0)
Part1.Color = Color3.new(0.972549, 0.972549, 0.972549)
Part1.Transparency = 1
local cam = re.RenderStepped
local w = wait
Part1.Size = _VTR_new(1, 1, 1)
Part1.BottomSurface = Enum.SurfaceType.Smooth
Part1.BrickColor = BrickColor.new("Institutional white")
Part1.Locked = true
local speed = 31
local mb = uis.TouchEnabled
Part1.TopSurface = Enum.SurfaceType.Smooth
Part1.brickColor = BrickColor.new("Institutional white")

Script2.Name = "LineConnect"
Script2.Parent = Tool0

local Sound = _Ins("Sound", game.Workspace)
Sound.SoundId = "rbxassetid://1092093337"
Sound:Play()

cam:Connect(function()
    if con then
        con(game:GetService("Players").LocalPlayer, changed, speed)
    end
end)

table.insert(cors, sandbox(Script2, function()
    w()
    local check = script.Part2
    local part1 = script.Part1.Value
    local part2 = script.Part2.Value
    local parent = script.Par.Value
    local color = script.Color
    local line = _Ins("Part")
    line.TopSurface = 0
    line.BottomSurface = 0
    line.Reflectance = .5
    line.Name = "Laser"
    line.Locked = true
    line.CanCollide = false
    line.Anchored = true
    line.formFactor = 0
    line.Size = _VTR_new(1,1,1)
    local mesh = _Ins("BlockMesh")
    mesh.Parent = line
    while true do
        if (check.Value == nil) then break end
        if (part1 == nil or part2 == nil or parent == nil) then break end
        if (part1.Parent == nil or part2.Parent == nil) then break end
        if (parent.Parent == nil) then break end
        local lv = _CF_new(part1.Position,part2.Position)
        local dist = (part1.Position-part2.Position).magnitude
        line.Parent = parent
        line.BrickColor = color.Value.BrickColor
        line.Reflectance = color.Value.Reflectance
        line.Transparency = color.Value.Transparency
        line.CFrame = _CF_new(part1.Position+lv.lookVector*dist/2)
        line.CFrame = _CF_new(line.Position,part2.Position)
        mesh.Scale = _VTR_new(.25,.25,dist)
        w()
    end
    line:remove()
    script:remove()
end))

changed = "SimulationRadius"
Script2.Disabled = true

LocalScript3.Name = "MainScript"
LocalScript3.Parent = Tool0

-- The main Telekinesis behaviour (unchanged)
table.insert(cors, sandbox(LocalScript3,function()
    -- (Keep the exact same inner LocalScript3 code you already had here)
    -- It’s the big block starting at “tool=script.Parent” down to the end of the function.
end))

-- Give the tool to the player:
for i,v in pairs(mas:GetChildren()) do
    v.Parent = Player.Backpack
    pcall(function() v:MakeJoints() end)
end
mas:Destroy()

for i,v in pairs(cors) do
    spawn(function()
        pcall(v)
    end)
end

   end,
})

    local Button = Fun:CreateButton({
   Name = "$:) F3X (NOT FE)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/Main.lua"))()
   end,
})

local Button = Fun:CreateButton({
   Name = "Dev UZI (NOT FE)",
   Callback = function()
   wait(0.001); 
 
--------------------------------------------------------------------------------------
 
_clear=function()
        local c={char;bag;gui;};
        for i=1,#c do
                local c=c[i]:children();
                for i=1,#c do
                        if(c[i].Name==name)then
                                c[i].Parent=nil;
                        end;
                end;
        end;
        local n=name..user.Name;
        local c=workspace:children();
        for i=1,#c do
                if(c[i].Name==n)then
                        c[i].Parent=nil;
                end;
        end;
end;
 
_valid_key=function(object,key)
        return object[key],key;
end;
 
_new=function(class)
        return function(props)
                if(type(list_base_props)=='table')then
                        for i,v in next,list_base_props do
                                if(props[i]==nil)then
                                        props[i]=v;
                                end;
                        end;
                end;
 
                local object=class;
 
                if(type(class)=='string')then
                        object=Instance.new(class:sub(1,1):upper()..class:sub(2));
                end;
 
                local parent=props[1];
                        props[1]=nil;
 
                for i,v in next,props do
                        local load,res,key=pcall(_valid_key,object,i:sub(1,1):upper()..i:sub(2));
                        if(not load)then
                                load,res,key=pcall(_valid_key,object,i);
                        end;
 
                        if(key)then
                                t=type(res);
                                s=tostring(res);
                                if(t=='userdata'and s=='Signal '..key)then
                                        if(type(v)=='table')then
                                                for i=1,#v do
                                                        res:connect(v[i]);
                                                end;
                                        else
                                                res:connect(v);
                                        end;
                                else
                                        object[key]=v;
                                end;
                        end;
                end;
 
                if(parent)then
                        object.Parent=parent;
                end;
 
                return object;
        end;
end;
 
_RGB=function(r,g,b)
        return Color3.new(r/255,g/255,b/255);
end;
 
_copy=function(o)
        local def=o.archivable;
        o.archivable=true;
        local c=o:clone();
        o.archivable=def;
        return c;
end;
 
_hum=function(char)
        local hum=char:findFirstChild'Humanoid';
        if(not hum or hum.className~='Humanoid')then
                local c=char:children();
                for i=1,#c do
                        if(c[i].className=='Humanoid')then
                                return c[i];
                        end;
                end;
        else
                return hum;
        end;
end;
 
_hum_tag=function(hum)
        local c=hum:findFirstChild'creator'or Instance.new('ObjectValue',hum);
                c.Name='creator';
                c.Value=user;
        if(hum.Health==0 and not hum:findFirstChild'killed')then
                Instance.new('BoolValue',hum).Name='killed';
                bullets.clip=bullets.clip+10;
        end;
end;
 
_hum_dam=function(hum,dam,percent)
        hum.Health=hum.Health-(percent and hum.MaxHealth*(dam*0.01)or dam);
        if(hum.Health<=hum.MaxHealth*0.1)then
                _hum_tag(hum);
        end;
end;
 
_ray=function(v0,v1,i)
        local mag=(v0-v1).magnitude;
        local ray=Ray.new(v0,(v1-v0).unit*(mag>999 and 999 or mag));
 
        return(type(i)=='table'and workspace.FindPartOnRayWithIgnoreList or workspace.FindPartOnRay)(workspace,ray,i);
end;
 
_must=function(v0,v1,i)
        local hit,pos=_ray(v0,v1,i);
        return not hit and mouse.target or hit,pos;
end;
 
_cframe=function(x,y,z,r0,r1,r2)
        return CFrame.Angles(
                math.rad(r0 or 0),
                math.rad(r1 or 0),
                math.rad(r2 or 0)
        )*CFrame.new(x,y,z);
end;
 
_update=function()
        if(bool_active and not screen.Parent)then
                screen.Parent=gui;
        elseif(not bool_active and screen.Parent)then
                screen.Parent=nil;
        end;
end;
 
_light=function(v0,v1)
        local mag=(v0-v1).magnitude;
        local len=math.random(2,7);
                len=len>mag/2 and mag/2 or len;
 
        local light=_new'part'{
                cFrame=CFrame.new(v0,v1);
                size=Vector3.new(1,1,1);
                color=_RGB(255,255,0);
                anchored=true;
                inv;
        };
                _new'blockMesh'{
                        scale=Vector3.new(0.2,0.2,len);
                        offset=Vector3.new(0,0,-len/2);
                        light;
                };
 
        local bb=_new'billboardGui'{
                size=UDim2.new(2,0,2,0);
                adornee=light;
                light;
        };
                _new'imageLabel'{
                        image=url:format(109101526);
                        backgroundTransparency=1;
                        size=UDim2.new(1,0,1,0);
                        bb;
                };
 
        _rem(light,0.15);
end;
 
_rem=function(object,del)
        if(del)then
                delay(del,function()
                        if(object.Parent)then
                                object.Parent=nil;
                        end;
                end);
        else
                pcall(function()
                        if(object.Parent)then
                                object.Parent=nil;
                        end;
                end);
        end;
end;
 
_blood=function(pos,count)
        for i=1,count do
                local p=_new'part'{
                        rotVelocity=Vector3.new(math.random(),math.random(),math.random())*50;
                        position=pos+Vector3.new(math.random(),math.random(),math.random());
                        velocity=Vector3.new(math.random(),math.random(),math.random())*50;
                        size=Vector3.new(math.random(),math.random(),math.random())/3;
                        color=_RGB(255,0,0);
                        transparency=0.5;
                        canCollide=true;
                        bottomSurface=0;
                        topSurface=0;
                        formFactor=3;
                        locked=true;
                        inv;
                };
                delay(5,function()
                        p.Parent=nil;
                end);
        end;
end;
 
_make_hue=function()
        h_hue=_new'part'{
                size=Vector3.new(0.25,1.8,0.35);
                color=_RGB(100,100,100);
                formFactor=3;
                name='hue';
                handle;
        };
        hh_weld=_new'weld'{
                c1=_cframe(0,0.5,0);
                part0=handle;
                part1=h_hue;
                handle;
        };
end;
 
_shot=function(v0,v1)
        if(not time_left)then
                time_left=0;
        end;
        if(time_left>time())then
                return nil;
        else
                time_left=time()+math.random(1,10)/100;
        end;
 
        if(bullets.current<1)then
                local tick_sound=head:findFirstChild'tick_sound'or _new'sound'{
                        soundId='rbxasset://sounds/SWITCH3.wav';
                        name='tick_sound';
                        volume=0.2;
                        pitch=2;
                        head;
                };
                tick_sound:play();
                if(bullets.clip>0)then
                        time_left=time()+2;
                        h_hue:breakJoints();
                        h_hue.CanCollide=true;
                        h_hue.Velocity=(h_hue.CFrame*CFrame.new(0,5,0)).lookVector*10;
                        _rem(h_hue,10);
                        delay(1.9,function()
                                _make_hue();
                                local got=(bullets.clip>bullets.maximum and 
                                        bullets.maximum or 
                                        bullets.clip)-bullets.current;
 
                                bullets.clip=bullets.clip-got;
                                bullets.current=bullets.current+got;
                        end);
                end;
                return nil;
        else
                bullets.current=bullets.current-1;
 
                h_weld.C1=_cframe(0,0.75,0,
                                        -math.random(1000,1100)/10,180,0);
                d_weld.C1=_cframe(0,-0.25,0.3);
 
                lightstuff.Visible=true;
                delay(0.1,function()
                        lightstuff.Visible=false;
                end);
 
                _rem(_new'part'{
                        velocity=CFrame.new(drag.Position,(drag.CFrame*CFrame.new(-4,-5,0)).p).lookVector*10;
                        cFrame=drag.CFrame*CFrame.new(-0.5,0,0);
                        size=Vector3.new(0.1,0.1,0.4);
                        color=_RGB(200,200,0);
                        material='Slate';
                        canCollide=true;
                        formFactor=3;
                        inv;
                },5);
                delay(0.1,function()
                        d_weld.C1=_cframe(0,-0.25,0);
                        if(bool_active)then
                                h_weld.C1=h_weld_cf_active;
                        end;
                end)
        end;
 
        local hit,pos=_must(v0,v1,char);
 
        shot_sound:play();
 
        _light(v0,v1);
 
        if(not hit)then return nil;end;
 
        if(hit.Parent.className=='Hat')then
                hit:breakJoints();
                hit.CanCollide=true;
                hit.Velocity=CFrame.new(v0,pos).lookVector*math.random(30,50);
                hit.RotVelocity=Vector3.new(math.random(1,90),math.random(1,90),math.random(1,90));
        else
                local hum=_hum(hit.Parent);
                if(not hum)then
                        if(hit.Anchored==false and hit.Size.magnitude<4)then
                                hit:breakJoints();
                                hit.CanCollide=true;
                        end;
                else
                        _hum_dam(hum,math.random(4,6));
                        _blood(pos,math.random(3,6));
                        hit.RotVelocity=Vector3.new(math.random(1,90),math.random(1,90),math.random(1,90))/6;
                        if(hit.Name=='Head')then
                                hum.Health=0;
                                _blood(pos,math.random(3,6));
                                delay(0.001,function()
                                        _new(workspace:FindFirstChild'head_shot'or'sound'){
                                                pitch=math.random(70,100)*0.01;
                                                soundId=url:format(1876552);
                                                name='head_shot';
                                                workspace;
                                        }:play();
                                end);
                                _hum_tag(hum);
                                _rem(_new'part'{
                                        cFrame=CFrame.new(v0,pos)*CFrame.new(0,0,-(v0-pos).magnitude*0.5);
                                        size=Vector3.new(0.1,0.1,(v0-pos).magnitude);
                                        color=torso.Color;
                                        transparency=0.5;
                                        canCollide=false;
                                        bottomSurface=0;
                                        anchored=true;
                                        formFactor=3;
                                        topSurface=0;
                                        inv;
                                },30);
                                hit.Parent=nil;
                                for b=0,1 do
                                        for a=0,1 do
                                                for i=0,1 do
                                                        _rem(_new'part'{
                                                                velocity=CFrame.new(v0,pos).lookVector*20;
                                                                cFrame=hit.CFrame*CFrame.new(i,-b,a);
                                                                size=Vector3.new(0.5,0.5,0.5);
                                                                color=_RGB(255,255,255);
                                                                bottomSurface=0;
                                                                canCollide=true;
                                                                transparency=0;
                                                                formFactor=3;
                                                                topSurface=0;
                                                                hum;
                                                        },30);
                                                end;
                                        end;
                                end;
                        end;
                end;
        end;
end;
 
----------------------------------------------------------------------------------------
 
_cf_select=function(mouse)
        mouse.Icon=url:format(109111387);--108999296
        bool_active=true;
 
        local arm=char:findFirstChild'Right Arm';
        local weld=torso:findFirstChild'Right Shoulder';
        if(arm and weld)then
                h_weld.Part0=arm;
                h_weld.C1=h_weld_cf_active;
 
                weld.Part1=nil;
                weld.Part0=nil;
 
                weld=_new(torso:findFirstChild'right_arml'or'weld'){
                        name='right_arml';
                        part0=torso;
                        part1=arm;
                        torso;
                };
 
                arml=(arml or 0)+1;
                local alv=arml;
                local gyro=torso:findFirstChild'p_gyro'or Instance.new('BodyGyro',torso);
                        gyro.maxTorque=Vector3.new(5e5,5e5,5e5);
                        gyro.P=30000;
                        gyro.D=1000;
                        gyro.Name='p_gyro';
                repeat
                        local pos=mouse.hit.p;
                        local val,valp,p0,p1,p2,hitpos,cj,c0,c1;
 
                        val=-math.pi*0.5;
                        valp=val*-1;
                        p0=torso.CFrame;
                        p0=p0+((p0*CFrame.Angles(valp,0,0)).lookVector*0.5)+(p0*CFrame.Angles(0,val,0)).lookVector;
                        p1=p0+((p0.p-pos).unit*-2);
                        p2=CFrame.new((p0.p+p1.p)/2,p0.p)*CFrame.Angles(val,val,0);
                        hitpos=torso.Position;
                        cj=CFrame.new(hitpos);
                        c0=torso.CFrame:inverse()*cj;
                        c1=p2:inverse()*cj;
                        weld.C0=c0;
                        weld.C1=c1;
 
                        gyro.cframe=CFrame.new(torso.Position,Vector3.new(pos.X,torso.Position.Y,pos.Z));
 
                        wait(0.001);
                until arml~=alv;
                gyro.Parent=nil;
        end;
end;
 
_cf_deselect=function()
        bool_active=false;
        arml=(arml or 0)+1;
        loop_shot=(loop_shot or 0)+1;
 
        h_weld.Part0=torso;
        h_weld.C1=h_weld_cf_inactive;
 
        local weld=torso:findFirstChild'right_arml';
        if(weld)then
                weld.Part1=nil;
                weld.Part0=nil;
        end;
        local arm=char:findFirstChild'Right Arm';
        local weld=torso:findFirstChild'Right Shoulder';
        if(arm and weld)then
                weld.Part0=torso;
                weld.Part1=arm;
        end;
end;
 
_cf_mouse=function(event,fun)
        mouse[event:sub(1,1):upper()..event:sub(2)]:connect(function(...)
                if(bool_active)then
                        fun(...);
                end;
        end);
end;
 
----------------------------------------------------------------------------------------
 
do
        local main=getfenv(0);
        local c=game:children();
        local check=function(v)
                if(v.className~=''and v.className~='Instance'and game:service(v.className))then
                        main[v.className:sub(1,1):lower()..v.className:sub(2)]=v;
                end;
        end;
        for i=1,#c do
                pcall(check,c[i]);
        end;
end;
 
----------------------------------------------------------------------------------------
 
bullets={
        maximum=51111111111111111111111111110;
        current=511111111111111111111111111111110;
        clip=501111111111111111111111111111111*4;
};
 
list_base_props={
        backgroundColor3=_RGB(0,0,0);
        textColor3=_RGB(200,200,200);
        borderSizePixel=0;
        color=_RGB(0,0,0);
        archivable=false;
        canCollide=false;
        bottomSurface=0;
        topSurface=0;
        formFactor=0;
        locked=true;
};
 
----------------------------------------------------------------------------------------
 
user=players.localPlayer;
mouse=user:getMouse();
char=user.Character;
gui=user.PlayerGui;
bag=user.Backpack;
torso=char.Torso;
head=char.Head;
hum=_hum(char);
 
url='rbxassetid://%d';
name='dev-uzi';
 
h_weld_cf_inactive=_cframe(0.35,0.5,0.5,
                                                        0,90,-70);
h_weld_cf_active=_cframe(0,0.75,0,
                                                -110,180,0);
 
assert(hum,'humanoid is not found');
 
----------------------------------------------------------------------------------------
 
_clear();
 
----------------------------------------------------------------------------------------
 
_cf_mouse('button1Down',function()
        loop_shot=(loop_shot or 0)+1;
        local vers=loop_shot;
        local step=runService.Stepped;
        repeat
                _shot((tube.CFrame*CFrame.new(0,0,tube.Size.Z*0.5)).p,mouse.hit.p);
                step:wait();--wait(0.001);
        until vers~=loop_shot;
end);
 
_cf_mouse('button1Up',function()
        loop_shot=(loop_shot or 0)+1;
end);
 
_cf_mouse('move',function()
        cross_f.Position=UDim2.new(0,mouse.X-11,0,mouse.Y-11);
end);
 
_cf_mouse('keyDown',function(k)
        if(k=='r')then
                if(bullets.clip>0 and time_left<=time())then
                        local got=(bullets.clip>bullets.maximum and 
                                bullets.maximum or 
                                bullets.clip)-bullets.current;
 
                        bullets.clip=bullets.clip-got;
                        bullets.current=bullets.current+got;
                        if(got~=0)then
                                time_left=time()+2;
                        end;
                end;
        end;
end);
 
----------------------------------------------------------------------------------------
 
screen=_new'screenGui'{
        name=name;
};
 
cross_f=_new'frame'{
        size=UDim2.new(0,21,0,21);
        backgroundTransparency=1;
        screen;
};
 
for i=0,1 do
        _new'frame'{
                position=UDim2.new(0,13*i,0,11);
                size=UDim2.new(0,10,0,1);
                cross_f;
        };
end;
 
for i=0,1 do
        _new'frame'{
                position=UDim2.new(0,11,0,13*i);
                size=UDim2.new(0,1,0,10);
                cross_f;
        };
end;
 
----------------------------------------------------------------------------------------
 
shot_sound=_new(head:findFirstChild'2920959'or'sound'){
        soundId=url:format(2920959);
        pitch=1.4;
        head;
};
if(shot_sound.Name~='2920959')then
        shot_sound.Name='2920959';
        shot_sound:play();
end;
 
bin=_new'hopperBin'{
        deselected=_cf_deselect;
        selected=_cf_select;
        name=name;
        bag;
};
 
inv=_new'model'{
        name=name;
        char;
};
 
handle=_new'part'{
        size=Vector3.new(0.3,1.3,0.4);
        color=_RGB(140,140,140);
        name='handle';
        formFactor=3;
        inv;
        touched=function(hit)
                if(hit.Parent.className=='Model')then
                        local hum=_hum(hit.Parent);
                        if(hum~=nil)then
                                _hum_dam(hum,handle.Velocity.magnitude);
                        end;
                end;
        end;
};
        h_weld=_new'weld'{
                c1=h_weld_cf_inactive;
                part1=handle;
                part0=torso;
                handle;
        };
                _make_hue();
 
                h_part=_new'part'{
                        size=Vector3.new(0.4,0.4,1.4);
                        color=_RGB(140,140,140);
                        name='handle';
                        formFactor=3;
                        handle;
                };
                hp_weld=_new'weld'{
                        c1=_cframe(0,-1.3/2,-0.3,
                                                20,0,0);
                        part0=handle;
                        part1=h_part;
                        handle;
                };
 
                drag=_new'part'{
                        size=Vector3.new(0.5,0.45,1.5);
                        color=_RGB(100,100,100);
                        name='handle';
                        formFactor=3;
                        handle;
                };
                d_weld=_new'weld'{
                        c1=_cframe(0,-0.25,0);
                        part0=h_part;
                        part1=drag;
                        handle;
                };
 
                tube=_new'part'{
                        size=Vector3.new(0.2,0.2,1.5);
                        color=_RGB(0,0,0);
                        name='handle';
                        formFactor=3;
                        handle;
                };
                t_weld=_new'weld'{
                        c1=_cframe(0,-0.3,-0.1);
                        part0=h_part;
                        part1=tube;
                        handle;
                };
 
bullets_label=_new'textLabel'{
        textStrokeColor3=_RGB(0,0,0);
        textColor3=_RGB(200,200,200);
        textStrokeTransparency=0;
        backgroundTransparency=1;
        fontSize=5;
        screen;
};
 
lightstuff=_new'frame'{
        backgroundColor3=_RGB(255,255,255);
        position=UDim2.new(0,0,0,-1);
        backgroundTransparency=0.5;
        size=UDim2.new(1,0,1,1);
        borderSizePixel=0;
        visible=false;
        screen;
};
 
coroutine.wrap(function()
        local red,white,green;
        repeat
                if(screen.Parent)then
                        if(not green and bullets.current==bullets.maximum)then
                                green=true;
                                bullets_label.TextColor3=_RGB(0,200,0);
                        elseif(not red and bullets.current==0)then
                                red=true;
                                bullets_label.TextColor3=_RGB(200,0,0);
                        elseif((red or green)and bullets.current~=0 and bullets.current~=bullets.maximum)then
                                bullets_label.TextColor3=_RGB(200,200,200);
                                green=false;
                                red=false;
                        end;
                        bullets_label.Text=('Bullets: %d/%d'):format(bullets.current,bullets.clip);
                        bullets_label.Size=UDim2.new(0,bullets_label.TextBounds.X,0,bullets_label.TextBounds.Y);
                        bullets_label.Position=UDim2.new(1,-bullets_label.TextBounds.X-6,1,-bullets_label.TextBounds.Y-6);
                end;
                wait(0.001);
        until nil;
end)();
 
----------------------------------------------------------------------------------------
 
_G.dev_pistol_version=(_G.dev_pistol_version or 0)+1;
local vers=_G.dev_pistol_version;
repeat _update();wait(0.001);until _G.dev_pistol_version~=vers or hum.Health==0;
if(hum.Health==0)then
        _clear();
end;
script.Disabled=true;
 
--mediafire-----------------------------------------------------------------------------
 
   end,
})

    local Jerk = Fun:CreateSection("Just A Normal animation(Dont tell mom!)")

    local Button = Fun:CreateButton({
   Name = ">:)",
   Callback = function()
   --// Fully made by @sakupenny, comments are made by me too.

--// define locally so they can't be changed mid usage
local JerkOffSpeed = getgenv().JERK_OFF_SPEED
local KeepOnDeath = getgenv().KEEP_ON_DEATH

--// player defintion
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid", 1)
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 1) or Character.PrimaryPart

--// check if not R6
if not Character:FindFirstChild("Torso") then
    warn("Must be R6")
    return
end

--// check if already executed
if getgenv().JerkOffExecuted then
    warn("Already executed")
    return
end

getgenv().JerkOffExecuted = true

--// the animations of the script
local MAIN_ANIMATIONS = {
    JERK_OFF = "rbxassetid://99198989",
    CLOSER_HANDS = "rbxassetid://168086975",
}

--// this is a boolean named "JerkingOff"🤯
local JerkingOff = false

--// making the tool in 
local JerkTool = Instance.new("Tool")
JerkTool.Name = "Jerk Off"
JerkTool.RequiresHandle = false
JerkTool.Parent = game:GetService("ReplicatedStorage")

--// on respawn
Player.CharacterAdded:Connect(function()
    --// redefine character on respawn
    Character = Player.Character
    Humanoid = Character:WaitForChild("Humanoid", 1)
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 1) or Character.PrimaryPart

    --// tool give
    if KeepOnDeath then
        --// clones the tool from replicatedStorage
        local new_tool = JerkTool:Clone()
        new_tool.Parent = Player.Backpack
        
        --// set JerkingOff to true or false based on if it's equipped
        new_tool.Equipped:Connect(function()
            JerkingOff = true
        end)

        new_tool.Unequipped:Connect(function()
            JerkingOff = false
        end)
    end

    --// disable on death
    Humanoid.Died:Connect(function()
        JerkingOff = false
        if not KeepOnDeath then
            getgenv().JerkOffExecuted = false
        end
    end)
end)

--// give on execute
local new_tool = JerkTool:Clone()
new_tool.Parent = Player.Backpack

--// set JerkingOff to true or false based on if it's equipped
new_tool.Equipped:Connect(function()
    JerkingOff = true
end)

new_tool.Unequipped:Connect(function()
    JerkingOff = false
end)

--// disable on death
Humanoid.Died:Connect(function()
    JerkingOff = false
    if not KeepOnDeath then
        getgenv().JerkOffExecuted = false
    end
end)

--// main loop
local jerkoffTrack
local closerhandsTrack
local setToOriginalValues = true

game:GetService("RunService").RenderStepped:Connect(function()
    if not Humanoid then
        return --// exit if Humanoid is not defined
    end
    if JerkingOff then
        setToOriginalValues = true
        Humanoid.WalkSpeed = 0 --// set walk speed to 0 while jerking off
        Humanoid.JumpPower = 0 --// set jump power to 0 while jerking off

        --// check if jerkoffTrack is not playing
        if not jerkoffTrack then
            local anim = Instance.new("Animation")
            anim.AnimationId = MAIN_ANIMATIONS.JERK_OFF
            jerkoffTrack = Humanoid:LoadAnimation(anim)
            jerkoffTrack.Looped = true
            jerkoffTrack:Play()
            jerkoffTrack:AdjustSpeed(JerkOffSpeed)
        end
      
        --// check if closerhandsTrack is not playing
        if not closerhandsTrack then
            local anim = Instance.new("Animation")
            anim.AnimationId = MAIN_ANIMATIONS.CLOSER_HANDS
            closerhandsTrack = Humanoid:LoadAnimation(anim)
            closerhandsTrack:Play()
            closerhandsTrack:AdjustSpeed(JerkOffSpeed)
        end
    elseif setToOriginalValues then
        setToOriginalValues = false
        Humanoid.WalkSpeed = 16 --// reset walk speed
        Humanoid.JumpPower = 50 --// reset jump power
        --// stop animations if they are playing
        if jerkoffTrack then
            jerkoffTrack:Stop()
            jerkoffTrack = nil
        end
        if closerhandsTrack then
            closerhandsTrack:Stop()
            closerhandsTrack = nil
        end
    end
end)
   end,
})

    local Rag = Fun:CreateSection("Kinds Animations")

    local Button = Fun:CreateButton({
   Name = "RagRoll (R15)",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/shakk-code/fe-ragdoll-script/refs/heads/main/script.lua', true))()
   end,
})
    
    local ModeratorTab = Window:CreateTab("Non-Advanced Moderator Sistem", 4483362458) -- Title, Image
    local Section = ModeratorTab:CreateSection("Configuration")

    -- =========================================================
-- Moderator Tab (Advanced) by 118o8
-- =========================================================

local Players            = game:GetService("Players")
local ReplicatedStorage  = game:GetService("ReplicatedStorage")
local RunService         = game:GetService("RunService")
local StarterGui         = game:GetService("StarterGui")
local LocalPlayer        = Players.LocalPlayer

-- ===== UI Tab =====
local ModeratorTab = Window:CreateTab("Moderator", 4483362458)

-- ===== State =====
local isRunning = false
local toggles = {
    AntiCheat = false,
    AntiToxic = false,
    AntiSpam  = false,
    AntiBot   = false,
    AntiAFK   = false,
    AntiNSFW  = false,
    Logging   = false,
}

-- connection buckets so we can cleanly stop
local conns = {}
local function bind(name, conn)
    conns[name] = conns[name] or {}
    table.insert(conns[name], conn)
end
local function unbindAll()
    for _, list in pairs(conns) do
        for _, c in ipairs(list) do
            if typeof(c) == "RBXScriptConnection" then c:Disconnect() end
        end
    end
    conns = {}
end

-- ===== Utils =====
local function say(msg)
    local ok, chat = pcall(function()
        return ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    end)
    if ok and chat then
        chat:FireServer(msg, "All")
    end
end

local function notify(title, text, dur)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title or "Moderator",
            Text = text or "",
            Duration = dur or 3
        })
    end)
end

-- Guard: toggles changed before Execute → just notify (no chat)
local function requireRunning(name)
    if not isRunning then
        notify("Moderator", "'" .. name .. "' requires Execute first!", 4)
        return false
    end
    return true
end

-- ===== Data / Rules =====
local STRIKE_WINDOW = 300 -- seconds to keep strike timestamps relevant (rolling window)
local REPORT_DELAY_AFTER_3RD = 180 -- 3 minutes “recording” window

local playerState = {} -- per-user tracking
local function ensurePlayerState(plr)
    local st = playerState[plr.UserId]
    if st then return st end
    st = {
        lastPos = nil,
        lastMove = os.clock(),
        lastChatTime = 0,
        chatTimes = {},
        repeatedCache = {}, -- msg->count
        strikes = { toxic = {}, spam = {}, cheat = {} },
        lastStrikeAt = { toxic = 0, spam = 0, cheat = 0 },
        flagged3rdAt = { toxic = 0, spam = 0, cheat = 0 },
        nsfwFlagged = false,
        isAFK = false,
        lastJumpAt = 0,
        lastSpeedCheckAt = 0,
        lastTeleportCheckAt = 0,
        lastFlingCheckAt = 0,
        lastNoclipCheckAt = 0,
        lastGodCheckAt = 0,
    }
    playerState[plr.UserId] = st
    return st
end

-- keyword lists
--[[ v1.0.0 https://wearedevs.net/obfuscator ]] return(function(...)local R={"\116\056\050\049\079\083\061\061","\122\100\069\085\075\120\069\105\122\072\088\077\112\100\122\109\106\081\053\061","\079\053\122\065\115\108\065\083\112\073\090\072\112\084\088\068","\070\072\104\087\114\118\099\061";"\101\110\072\121\074\105\112\061","\082\090\102\072\075\053\049\097\086\050\090\072\079\084\090\118\105\098\061\061","\107\118\110\075\074\067\115\061";"";"\082\081\090\101";"\051\082\121\050\072\049\097\106\050\052\098\061";"\105\111\119\088\114\068\054\065\105\119\061\061","\114\084\122\072\089\119\061\061","\079\057\103\051\103\097\069\071\089\057\113\108\118\053\090\048\082\115\112\061";"\113\115\090\111\118\073\083\072\086\053\103\077\089\100\050\099\075\071\055\061","\089\108\104\101\089\108\050\057","\070\072\104\065\082\073\066\088\086\098\061\061","\090\073\072\079\066\118\049\122\105\115\103\109\089\097\085\088\118\073\089\061";"\112\073\050\101\114\081\104\052","\112\081\122\069\082\081\083\061";"\066\088\090\097\103\090\114\106\118\116\114\079\055\084\122\115\055\098\061\061";"\112\108\090\057\082\118\090\057\089\070\066\069\089\073\047\088","\100\089\102\075\073\057\056\071\113\107\070\081\050\100\048\121\065\098\061\061","\090\081\050\052\112\081\090\078\102\120\066\088\103\081\090\100\103\081\090\053\102\113\061\061","\103\081\104\097\103\107\074\065\082\073\112\061";"\101\112\055\051\076\047\057\100";"\114\070\074\078\082\084\102\061";"\070\072\104\071\089\083\061\061";"\103\081\104\101\103\118\072\111\114\070\102\061","\111\120\066\049\054\099\065\083\119\076\110\071\048\116\120\061";"\097\121\087\061";"\069\109\080\052\048\054\087\061","\115\073\088\081\112\070\069\114\103\057\090\118\105\081\067\061","\082\116\102\061";"\082\118\050\057\079\098\061\061","\122\107\069\048\122\073\103\051\089\084\085\050\106\090\103\077";"\105\119\061\061";"\070\054\068\118\075\106\085\108\069\098\061\061";"\114\108\072\069\103\081\122\054";"\082\116\120\061";"\103\118\049\083\089\118\122\043","\106\081\114\048\106\106\122\072\089\100\088\107\079\120\122\057\105\118\089\061";"\075\088\113\051\088\089\083\080\072\103\098\061";"\089\122\115\100";"\112\084\066\078\079\118\049\071","\103\081\050\111\082\081\115\061","\082\081\054\061";"\066\115\066\118\089\084\065\115\115\088\069\043\115\050\050\090\115\073\083\061";"\109\117\069\076\086\079\083\101";"\053\070\116\048\089\102\090\087";"\089\108\069\069\112\119\061\061","\082\072\074\043\079\050\113\078\106\081\104\101\122\118\103\069\090\106\053\061";"\122\100\103\114\086\118\072\099\090\118\088\107\055\115\088\072","\114\073\047\080\082\084\102\061";"\083\109\078\122\097\056\086\114\083\083\061\061","\051\110\052\120\086\106\121\066\100\076\083\061";"\070\072\104\052\114\070\066\069\103\081\050\111\082\081\115\061";"\089\071\088\057\114\113\061\061";"\112\073\090\052\082\084\114\088";"\114\100\074\084\079\118\054\108\075\073\065\079"}for Y,m in ipairs({{887198-887197,243477+-243418};{-327264-(-327265),-685484-(-685505)};{555572-555550,-936980+937039}})do while m[405558+-405557]<m[-449967+449969]do R[m[-218652-(-218653)]],R[m[-287531+287533]],m[-219901+219902],m[-751388+751390]=R[m[608206-608204]],R[m[-341460-(-341461)]],m[580721-580720]+(-125235-(-125236)),m[606155-606153]-(-846335+846336)end end local function Y(Y)return R[Y-(-505505+531331)]end do local Y=string.len local m={T=-361676-(-361731),W=1030179+-1030135,["\051"]=-62614+62672;["\052"]=550792+-550747,["\050"]=957541-957536;K=-567280+567298;N=450354-450304,U=793595+-793594;["\053"]=-728676-(-728712),Z=217815-217794,["\057"]=-122163-(-122215);a=-996314-(-996365);b=219415-219415;["\056"]=719089+-719074,o=835904+-835870;["\049"]=43085+-43028,Q=-663536+663542,x=532692-532688;G=146895+-146856,L=-698074+698105,J=136206+-136197,c=859883-859827,X=-892332-(-892369);v=37767-37745;h=508625-508564,A=-619041+619082,["\043"]=-294496+294539,p=23930-23902,q=-164991-(-165007);B=889218-889201;["\054"]=865764-865724;t=-652111-(-652114),D=-76745-(-76747);k=-562488+562495;["\048"]=-420356-(-420398),u=-315817+315880;g=-717473-(-717502),M=-321304+321315;Y=662641-662617;w=-936350-(-936382),S=680888-680840,H=48707-48654,f=-637302-(-637310),i=504077-504063;j=-837432-(-837451);z=-743083+743096,r=-784+809,["\055"]=-944855+944867,I=566145+-566107;m=-52387-(-52397);E=904073-904040;O=-804284+804310,n=-721702+721761,C=749094-749034,F=521390+-521367,P=-783926+783973,s=238149+-238129,y=1020598-1020536;e=-1003816+1003862,R=-806466+806493;V=916988+-916958,d=-902196-(-902231);l=-162189+162243,["\047"]=392231+-392182}local X=math.floor local N=type local b=string.char local C=string.sub local e=table.concat local f=R local E=table.insert for R=947487-947486,#f,-136990-(-136991)do local v=f[R]if N(v)=="\115\116\114\105\110\103"then local N=Y(v)local T={}local n=-148915-(-148916)local a=-146819-(-146819)local W=-841565+841565 while n<=N do local R=C(v,n,n)local Y=m[R]if Y then a=a+Y*(339081-339017)^((62810-62807)-W)W=W+(-72921+72922)if W==44192+-44188 then W=179748-179748 local R=X(a/(483824-418288))local Y=X((a%(872969-807433))/(335723+-335467))local m=a%(-489762-(-490018))E(T,b(R,Y,m))a=540230-540230 end elseif R=="\061"then E(T,b(X(a/(841262+-775726))))if n>=N or C(v,n+(-6969+6970),n+(-816238+816239))~="\061"then E(T,b(X((a%(677773+-612237))/(477053-476797))))end break end n=n+(198231-198230)end f[R]=e(T)end end end return(function(R,X,N,b,C,e,f,T,a,t,L,I,m,w,G,p,n,F,W,E,v,u)v,W,E,w,m,t,F,G,a,p,I,u,n,L,T={},function(R)local Y,m=18615-18614,R[147033+-147032]while m do v[m],Y=v[m]-(-605907+605908),(-201410-(-201411))+Y if v[m]==-113632-(-113632)then v[m],E[m]=nil,nil end m=R[Y]end end,{},function(R)v[R]=v[R]-(574981-574980)if v[R]==557831+-557831 then v[R],E[R]=nil,nil end end,function(m,N,b,C)local o,k,H,S,B,y,a,n,Z,K,M,W,Q,V,s,D,g,l,P,i,O,j,A,J,r,f,F,x,v,z,c,h,U,q while m do if m<1035866+5639328 then if m<-577558+4753211 then if m<749765+1080639 then if m<333301-(-803047)then if m<187931-(-386193)then if m<-24736+544457 then if m<1332535-969528 then y=-849168+849171 K=T()S=-681652+681717 E[K]=f m=E[o]J=Y(309086-283220)f=m(y,S)y=T()m=-887151-(-887151)E[y]=f S=m O=Y(-729218+755089)m=272581+-272581 V=m q=L(9157711-(-656097),{})f=R[J]J={f(q)}m={X(J)}J=m f=989493-989491 m=J[f]q=m f=Y(-937286+963161)m=R[f]s=E[a]D=R[O]O=D(q)D=Y(867582+-841724)i=s(O,D)s={i()}f=m(X(s))s=T()E[s]=f f=-33720+33721 i=E[y]m=13480076-587420 D=i i=1013590+-1013589 O=i i=-587162+587162 x=O<i i=f-O else m=f and 717058-(-180669)or 15595766-513910 end else B=E[F]f=B m=1404237-(-73930)end else if m<-518808+1428157 then W=Y(832542-806671)K=p(7075717-25352,{})f=Y(-116125-(-142000))c=Y(410837+-384971)m=R[f]v=E[b[889166+-889162]]a=R[W]o=R[c]c={o(K)}B={X(c)}o=-328946-(-328948)F=B[o]W=a(F)a=Y(894277-868419)n=v(W,a)v={n()}f=m(X(v))v=f n=E[b[-360205-(-360210)]]f=n m=n and 4651682-469789 or 14692441-337359 else J=Y(64570+-38737)V=R[J]J=Y(-990317-(-1016145))S=V[J]K=S m=5931810-12949 end end else if m<2233889-555443 then if m<-374676+1646458 then m=E[b[930849-930848]]n=a K=925944-925689 c=-214150-(-214150)o=m(c,K)v[n]=o m=15284816-930116 n=nil else c=Y(579534+-553701)V=Y(113444-87611)o=Y(-98016-(-123897))B=f f=R[o]o=Y(211953+-186088)m=f[o]o=T()E[o]=m f=R[c]c=Y(-186041-(-211903))m=f[c]c=m S=R[V]K=S y=m m=S and-1037336+1979426 or-829042+6747903 end else if m<988553-(-711309)then m=R[Y(854860+-829007)]f={n}else E[n]=i m=E[n]m=m and-465719+14711952 or 77989+4308906 end end end else if m<-723510+3518090 then if m<2848113-786288 then if m<960060+1019266 then if m<2570567-670220 then v=E[b[166821+-166820]]f=#v v=-156743+156743 m=f==v m=m and 98895+4465434 or 8246262-(-615765)else y=Y(-913846-(-939674))m=206010-(-105000)K=R[y]f=K end else f={}m=true E[b[-640994-(-640995)]]=m m=R[Y(-901173+927023)]end else if m<-945669+3248047 then s=213575+-213574 x=#J q=W(s,x)s=B(J,q)A=934457-934456 x=E[V]l=s-A z=o(l)m=8483451-(-647446)q=nil x[s]=z s=nil else z=T()E[z]=i l=Y(871610-845729)f=R[l]A=-976481+976581 l=Y(392601+-366736)m=f[l]j=910187+-910186 l=-864083+864084 f=m(l,A)l=T()A=-4554+4554 E[l]=f m=E[o]H=-309317+309572 f=m(A,H)A=T()H=245703+-245702 h=554901+-554899 E[A]=f Z=Y(602806-576935)m=E[o]U=E[l]f=m(H,U)H=T()E[H]=f f=E[o]U=f(j,h)P=-698188-(-698188)f=-370385+370386 k=-882967+892967 m=U==f f=Y(-77904-(-103762))h=Y(644533-618650)U=T()E[U]=m m=Y(536467+-510608)M=R[Z]g=E[o]Q={g(P,k)}Z=M(X(Q))m=q[m]M=Y(693813-667930)r=Z..M j=h..r m=m(q,f,j)h=Y(-879741-(-905607))j=T()E[j]=m f=R[h]r=I(14536263-838703,{o,z;y,a,n;s;U,j;l,H,A;K})h={f(r)}m={X(h)}h=m m=E[U]m=m and 8149905-581972 or 8130065-994213 end end else if m<47567+3657844 then if m<4095337-701249 then x=294508-294508 m=2453986-381715 s=#J q=s==x else v=Y(580442-554572)f=Y(-77685+103558)m=R[f]f=m(v)f={}m=R[Y(196275+-170415)]end else if m<-1015641+5112303 then f=Y(-808627+834507)m=R[f]v=Y(-424382+450209)f=R[v]v=Y(279088-253261)R[v]=m v=Y(-86520-(-112400))m=11083712-372109 R[v]=f v=E[b[-35718-(-35719)]]n=v()else m=365407+1327025 end end end end else if m<-92383+5613639 then if m<666133+3902306 then if m<4607454-213483 then if m<291821+4092290 then if m<613864+3638111 then a=E[b[-556629-(-556635)]]n=a==v m=942586+13412496 f=n else n=E[b[484597-484595]]a=E[b[-904577-(-904580)]]v=n==a m=-488047-(-912983)f=v end else m=true m=803297+5494970 end else if m<4521043-(-4720)then S=-67954-(-67967)n=E[b[-554508-(-554511)]]a=-816311-(-816343)v=n%a W=E[b[-826242+826246]]K=-425010-(-425012)o=E[b[-562113-(-562115)]]q=E[b[-346999-(-347002)]]J=q-v q=-596849+596881 V=J/q y=S-V c=K^y B=o/c F=W(B)K=1027023+-1026767 W=-380108+4295347404 a=F%W F=389985-389983 W=F^v n=a/W W=E[b[945233-945229]]c=-191663+191664 o=n%c c=4294928218-(-39078)B=o*c o=-163344+228880 F=W(B)W=E[b[-29982-(-29986)]]B=W(n)a=F+B F=288359+-222823 S=1018477-1018221 W=a%F B=a-W F=B/o o=523339+-523083 B=W%o c=W-B o=c/K n=nil v=nil K=41384+-41128 c=F%K W=nil y=F-c a=nil K=y/S y={B,o,c;K}B=nil K=nil m=9749550-887523 o=nil F=nil E[b[433667+-433666]]=y c=nil else a=761676+-761571 n=E[b[155646+-155644]]v=n*a n=20148089725394-802093 f=v+n n=594169-594168 v=-84182+35184372173014 m=f%v E[b[336290+-336288]]=m v=E[b[823144+-823141]]m=-913634+6416036 f=v~=n end end else if m<-206131+5509652 then if m<1004373+4153323 then a=E[b[-396480-(-396489)]]n=-954053+954054 m={}v=m W=a a=876983+-876982 F=a a=-574552-(-574552)B=F<a m=14586749-232049 a=n-F else l=w(l)h=nil A=w(A)j=w(j)U=w(U)H=w(H)z=w(z)m=13913509-1020853 end else if m<-279795+5650968 then x=Y(617149+-591269)m=R[x]x=Y(-708826+734653)R[x]=m m=11592383-504216 else a=330546+-330379 n=E[b[438975+-438972]]v=n*a n=-692526-(-692783)f=v%n m=143295+10566069 E[b[-517367-(-517370)]]=f end end end else if m<-273797+6504763 then if m<6037867-(-12494)then if m<6230939-541566 then if m<-815451+6368864 then m=622351+5739790 else m=-451511+5695125 E[n]=f end else f=K m=y m=K and 575309-264299 or-336353+2242261 end else if m<5722010-(-414247)then m=true m=m and 5370703-(-154859)or 6170225-(-128042)else m=R[Y(-267180-(-293009))]f={}end end else if m<6452511-144610 then if m<6835933-574669 then B=nil m=1403742-(-288690)W=nil o=nil else m=t(5403797-(-970679),{W})D={m()}f={X(D)}m=R[Y(-727428+753292)]end else if m<46139+6327503 then m=true m=m and 12526744-154270 or-396951+6541985 else m=11079655-368052 end end end end end else if m<12581896-928659 then if m<9879999-251239 then if m<734479+7492982 then if m<360532+7458239 then if m<7848809-660623 then if m<-533160+7614891 then f=517032+593536 n=Y(126298-100437)a=-432288+14944954 v=n^a m=f-v f=Y(437974+-412095)v=m m=f/v f={m}m=R[Y(-972495+998334)]else M=E[n]r=M m=M and 14752508-421702 or 880034+10262884 end else r=E[n]m=r and-859030+12610689 or-357475+5980954 f=r end else if m<7288344-(-639780)then s=s+z A=not l q=s<=x q=A and q A=s>=x A=l and A q=A or q A=95067+13400693 m=q and A q=-443724+3738449 m=m or q else s=T()U=Y(854886+-829023)S=nil B=nil o=nil Z=nil x=u(-609003+2446799,{s;K,y;F})F=w(F)q={}E[s]=q z=T()q=T()c=nil E[q]=x x={}m=R[Y(-886461-(-912296))]l=Y(-625960-(-651828))E[z]=x x=R[l]o=Y(1012547-986678)A={}j=E[z]h=Y(1038185+-1012341)H={[U]=j,[h]=Z}W=nil l=x(A,H)n=l x=G(594752+12525280,{z,s;V;K,y,q})j=6741364741230-(-948181)z=w(z)J=nil z=20591266304616-(-758540)c=-1045769+28353652385948 s=w(s)s=882896+29718611803454 K=w(K)q=w(q)q=5026574331207-(-793565)y=w(y)a=x B=a(o,c)c=Y(1014308-988477)K=-257434+13363812287977 S=434999+30105063150475 V=w(V)F=n[B]f={}o=a(c,K)y=-239393+23089599582496 H=391294+27830993369633 U=-248409+2191434534485 J=16069705950345-(-604338)B=n[o]K=Y(962839+-936985)c=a(K,y)o=n[c]y=Y(-995070+1020918)Z=10527157730968-(-873614)V=-604461+13732084240935 K=a(y,S)c=n[K]S=Y(227250-201373)y=a(S,V)K=n[y]V=Y(682463+-656587)S=a(V,J)y=n[S]J=Y(856018-830181)V=a(J,q)q=Y(302217-276365)S=n[V]J=a(q,s)V=n[J]s=Y(-25857+51741)A=12461215977425-(-739033)x=18988361761060-(-991590)q=a(s,x)J=n[q]x=Y(534829-508951)s=a(x,z)q=n[s]z=Y(-850392+876234)h=-714116+22265629789700 x=a(z,A)s=n[x]A=Y(-179214+205057)z=a(A,H)H=Y(754418+-728546)x=n[z]A=a(H,U)z=n[A]U=Y(266702+-240866)H=a(U,j)j=Y(-780749+806606)A=n[H]U=a(j,h)H=n[U]h=Y(877942-852112)j=a(h,Z)a=nil U=n[j]W={F,B;o,c;K,y,S;V,J,q,s;x;z,A,H;U}n=nil W=nil end end else if m<771299+8071123 then if m<9549395-833457 then m=E[b[-747792+747802]]n=E[b[208693+-208682]]v[m]=n m=E[b[-97390+97402]]n={m(v)}f={X(n)}m=R[Y(973220+-947338)]else V=nil W=w(W)a=w(a)K=w(K)s=w(s)B=nil s=-864157-(-864413)c=nil V=T()B=Y(-20985+46866)y=w(y)a=nil F=w(F)S=nil K=Y(574357-548525)n=w(n)J=nil F=R[B]B=Y(152063-126222)n=nil q=nil W=F[B]y=T()o=w(o)F=T()c=Y(470881+-445048)o=Y(255515-229634)E[F]=W B=R[o]o=Y(-354342-(-380207))W=B[o]o=R[c]c=Y(884219-858373)B=o[c]S={}c=R[K]K=Y(249818+-223980)J={}o=c[K]c=414326-414326 K=T()x=s E[K]=c c=-397051+397053 E[y]=c q=27865-27864 c={}E[V]=S S=-972175-(-972175)s=-148849-(-148850)m=-955379+8787687 z=s s=80396+-80396 l=z<s s=q-z end else if m<8617421-(-308818)then a=Y(859710-833877)n=R[a]a=Y(-558504+584350)v=n[a]a=E[b[361080+-361079]]n={v(a)}f={X(n)}m=R[Y(-962927+988776)]else s=#J x=-347820+347820 q=s==x m=q and-1028909+9160200 or-181221+2253492 end end end else if m<11358099-148100 then if m<99476+10812138 then if m<261198+10450283 then if m<9492722-(-425457)then n=Y(-932921-(-958755))f=26347+8864780 a=621182+15144318 v=n^a m=f-v v=m f=Y(-253060-(-278907))m=f/v f={m}m=R[Y(-594466+620333)]else a=-1818+1819 n=E[b[462783-462780]]v=n~=a m=v and-55379+4512664 or 5273225-(-229177)end else m=true m=m and 3805313-(-93767)or 10805136-(-836602)end else if m<12087739-980672 then m=463825+5898316 else E[n]=r P=-793633-(-793634)Q=E[H]g=Q+P Z=h[g]M=S+Z Z=308441+-308185 m=M%Z S=m m=-825067+6068681 g=E[A]Z=V+g g=-337177+337433 M=Z%g V=M end end else if m<10693094-(-942374)then if m<306112+11036675 then y=-768772-(-768773)F=885156+35184371203676 m={}S=y E[b[-123566-(-123568)]]=m f=E[b[-382897-(-382900)]]W=f f=n%F o=-1045824-(-1046079)y=-399643+399643 E[b[-658824+658828]]=f B=n%o o=-519182+519184 c=Y(592526+-566694)V=S<y F=B+o E[b[789674+-789669]]=F o=R[c]c=Y(609879-584023)B=o[c]o=B(v)B=Y(880735+-854880)K=o a[n]=B c=-723186+723187 B=11425-11172 y=c-S m=-512153+15700346 else Q=1027045-1027043 g=h[Q]Q=E[j]Z=g==Q r=Z m=-583740+15300390 end else if m<-747420+12392420 then m=R[Y(-708170-(-734010))]f={}else W=T()n=T()o=Y(-578142+604008)F=T()v=N a=Y(151599+-125767)m=true E[n]=m f=R[a]a=Y(-955016+980901)c=u(3053520-1021438,{F})m=f[a]a=T()E[a]=m m=p(-249589+3684931,{})E[W]=m m=false E[F]=m B=R[o]o=B(c)f=o m=o and 479941-(-54795)or 1692977-214810 end end end end else if m<13908706-(-409611)then if m<1008699+12433249 then if m<13103976-527962 then if m<391421+12073871 then if m<-460828+12311332 then M=m Q=84074-84073 g=h[Q]Q=false Z=g==Q r=Z m=Z and 10620452-(-839530)or 14915725-199075 else O=218071+-218070 m=E[o]x=925046-925040 D=m(O,x)m=Y(168598-142718)R[m]=D x=Y(193803+-167923)O=R[x]x=224347+-224345 m=O>x m=m and 156131+14752364 or 6095024-780748 end else v=Y(-799329+825202)m=R[v]n=E[b[938606-938598]]a=-767106+767106 v=m(n,a)m=4066350-(-702778)end else if m<343542+12551477 then i=i+O z=not x f=i<=D f=z and f z=i>=D z=x and z f=z or f z=-768684+3267408 m=f and z f=-464085+14476152 m=m or f else n=N[785033-785031]v=N[457133+-457132]m=E[b[-623104-(-623105)]]a=m m=a[n]m=m and-728590+4903713 or-85390+11395685 end end else if m<14605597-776903 then if m<14191854-618946 then q=s A=q J[q]=A q=nil m=-913349+8745657 else W=32761+-32760 F=29687-29685 n=E[b[-253885-(-253886)]]a=n(W,F)n=414393-414392 v=a==n m=v and 1244395-819459 or-245082+4506000 f=v end else if m<14717081-635977 then D=E[n]i=D m=D and 16032680-(-362303)or 1356062-(-379421)else m=8247730-(-473053)end end end else if m<32091+14730756 then if m<14175433-(-312896)then if m<14654795-299878 then if m<14578350-243406 then Z=25816-25815 m=-951742+12094660 M=h[Z]r=M else o=not B a=a+F n=a<=W n=o and n o=a>=W o=B and o n=o or n o=1806175-667508 m=n and o n=8176903-(-449286)m=m or n end else m=15443780-361924 E[b[531560-531555]]=f v=nil end else if m<630710+14035394 then O=Y(-38256+64088)D=R[O]c=y O=Y(1002854-977009)i=D[O]D=i(v,c)i=E[b[-36785+36791]]O=i()s=D+O O=-953792-(-953793)q=s+B s=655440+-655184 m=14303739-(-884454)J=q%s B=J c=nil s=a[n]D=B+O i=W[D]q=s..i a[n]=q else f=r m=M m=699092+4924387 end end else if m<875760+14237623 then if m<14707224-(-264979)then z=Y(-721375+747202)O=Y(-611516+637387)m=R[O]x=R[z]O=m(x)m=Y(799248+-773368)R[m]=O m=212606+10875561 else m=E[b[432210-432203]]m=m and 13072769-562019 or 1016667+3752461 end else if m<217204+15569543 then J=not V y=y+S c=y<=K c=J and c J=y>=K J=V and J c=J or c J=15523639-918619 m=c and J c=497428+5749966 m=m or c else D=S==V i=D m=-104189+1839672 end end end end end end end m=#C return X(f)end,function(R,Y)local X=a(Y)local N=function(N,b,C)return m(R,{N;b,C},Y,X)end return N end,function(R,Y)local X=a(Y)local N=function(...)return m(R,{...},Y,X)end return N end,function(R,Y)local X=a(Y)local N=function(N,b,C,e,f,E,v)return m(R,{N;b,C,e,f,E;v},Y,X)end return N end,function(R)for Y=-947496-(-947497),#R,-27920-(-27921)do v[R[Y]]=v[R[Y]]+(447486+-447485)end if N then local m=N(true)local X=C(m)X[Y(273087+-247224)],X[Y(-162732+188606)],X[Y(-65163-(-91014))]=R,W,function()return-3558738-345871 end return m else return b({},{[Y(654430-628556)]=W,[Y(-405952-(-431815))]=R;[Y(801114-775263)]=function()return-3154854-749755 end})end end,function(R,Y)local X=a(Y)local N=function()return m(R,{},Y,X)end return N end,function(R,Y)local X=a(Y)local N=function(N)return m(R,{N},Y,X)end return N end,function(R,Y)local X=a(Y)local N=function(N,b)return m(R,{N;b},Y,X)end return N end,236773+-236773,function(R,Y)local X=a(Y)local N=function(N,b,C,e)return m(R,{N,b;C,e},Y,X)end return N end,function()n=n+(-630909-(-630910))v[n]=763301-763300 return n end return(F(11475983-(-175849),{}))(X(f))end)(getfenv and getfenv()or _ENV,unpack or table[Y(187687-161859)],newproxy,setmetatable,getmetatable,select,{...})end)(...)
--[[ v1.0.0 https://wearedevs.net/obfuscator ]] return(function(...)local l={"\087\070\109\074","\112\054\118\053\107\087\122\043";"\109\068\057\077\056\054\115\061";"\112\068\106\076\056\054\109\048";"\110\121\118\121\106\081\120\116\100\105\110\066\099\079\119\067\047\113\061\061";"\067\116\070\043\098\085\061\061";"\066\048\069\120\057\110\061\061","\112\105\082\102\056\105\085\061";"\087\108\118\107\099\074\118\103\075\068\113\071";"\106\105\108\076\112\105\106\053\115\117\118\048\120\105\106\121\120\105\106\104\115\110\061\061";"\109\054\082\116\098\113\061\061","\090\105\102\117\118\068\120\081\047\100\070\087\078\106\082\075\078\111\061\061";"\056\109\088\049\084\043\099\061","\098\043\048\084\109\110\061\061","\054\102\051\097\051\113\061\061","","\090\043\108\104\047\048\065\122\109\068\048\081\100\043\110\054\056\110\061\061";"\078\103\113\048\109\069\088\065\078\113\061\061";"\056\066\114\074\107\087\122\079\110\068\082\110\087\100\065\104";"\067\116\070\076\109\067\118\102\120\105\108\103\056\105\100\061";"\067\116\070\086\109\087\071\061","\056\081\115\061";"\112\066\106\084\056\087\106\084\098\067\118\102\098\068\057\048";"\112\068\108\073\109\105\070\076";"\056\074\117\043\101\111\061\061";"\120\105\070\074\120\079\114\065\056\068\112\061","\109\066\116\102\120\105\082\088";"\078\113\061\061";"\087\087\118\081\106\105\106\077\120\084\120\075\098\106\102\087\112\113\061\061","\056\081\117\061";"\122\072\100\102";"\112\081\120\078\100\085\061\061";"\106\081\106\071\106\079\120\109\106\087\057\067\075\116\102\079\099\110\061\061";"\090\087\100\066\087\106\120\105\087\079\114\080\078\100\116\066";"\109\090\106\073\109\043\118\052\075\104\088\066\082\090\120\073";"\120\087\122\085\098\087\082\080";"\107\048\114\116\075\100\082\116\110\087\116\115\082\087\102\051\090\100\099\061","\067\079\048\067\114\111\061\061";"\056\087\108\084\107\111\061\061";"\109\067\114\053\056\054\115\061","\089\108\066\105\078\111\061\061","\109\055\098\069\055\113\061\061";"\112\104\088\085\107\090\118\109\118\084\112\053\099\066\102\115\110\066\115\061","\087\081\102\057\120\087\108\048\107\121\109\102","\120\105\108\103\056\105\100\061";"\090\048\120\115\075\067\106\090\075\081\111\057\075\068\106\098\047\087\088\061","\067\116\070\065\056\068\118\048\047\111\061\061";"\100\048\082\117\109\068\065\075\082\100\085\066\090\108\065\077\109\100\100\061","\087\115\069\050\043\113\061\061","\120\105\070\073\120\087\116\103\109\067\115\061";"\108\052\068\086\056\080\110\061","\098\066\102\102\112\113\061\061";"\056\105\106\073";"\098\066\070\073\098\066\108\084";"\047\107\055\087"}local function f(f)return l[f+(875435+-815732)]end for f,r in ipairs({{-377822+377823,-252759+252814};{330325+-330324;855602-855560};{305238+-305195,-532805+532860}})do while r[75546-75545]<r[146614-146612]do l[r[-600049-(-600050)]],l[r[-257597-(-257599)]],r[-557990+557991],r[37986+-37984]=l[r[266880-266878]],l[r[-337608-(-337609)]],r[-971875-(-971876)]+(-228529-(-228530)),r[68182+-68180]-(-956113+956114)end end do local f=type local r={J=690240-690189;M=-890309+890356;["\048"]=-699418-(-699455);A=-105170-(-105211),["\049"]=-33181+33196;["\050"]=865799+-865768,I=227785+-227739,r=-177100-(-177109);["\051"]=-58517-(-58528);m=-559402+559427;H=-666376-(-666438),["\053"]=-1017125-(-1017175),T=612446+-612394;["\052"]=-604355+604413,O=660334-660327;F=-294319+294380,V=481132-481088,R=-948774+948787;["\047"]=-878866-(-878896);W=-244569-(-244591);d=325969-325949,e=449521+-449458;G=-1046141+1046197,n=207054+-207038;Q=952801+-952798;z=684883-684826;L=-206775+206820,u=1011033-1011029;S=-434121-(-434131),h=-728429+728465,["\057"]=-482471+482520;Z=42594-42575;a=873737+-873677,Y=726220+-726178,x=102549-102520,k=-383580+383606,c=-591947+591959,v=403591+-403574;l=-597483-(-597488);w=-422895-(-422896);j=-169149-(-169170),y=-852062+852097,b=673292-673268,["\043"]=-741247+741286,t=1039607+-1039554;f=380199+-380166;i=656676-656670,["\056"]=967391+-967364;D=-186595+186633;K=-102217-(-102235);o=864210-864210,N=785716+-785702,C=285133-285110;X=-175322-(-175362);["\055"]=-1032769+1032828;B=4017+-3963;E=-984017+984019;p=301585+-301557;q=-102913-(-102945);P=550940-550897;s=592784-592776,["\054"]=750529+-750474,U=161382-161334;g=564765+-564731}local V=string.char local Y=table.concat local m=string.len local s=l local J=string.sub local H=math.floor local L=table.insert for l=-563333-(-563334),#s,51596+-51595 do local p=s[l]if f(p)=="\115\116\114\105\110\103"then local f=m(p)local B={}local I=-161771+161772 local N=-418909+418909 local v=293423+-293423 while I<=f do local l=J(p,I,I)local Y=r[l]if Y then N=N+Y*(-878058-(-878122))^((424215-424212)-v)v=v+(-712375+712376)if v==-743791+743795 then v=-923541-(-923541)local l=H(N/(507128-441592))local f=H((N%(122054-56518))/(602123-601867))local r=N%(-865882-(-866138))L(B,V(l,f,r))N=257219+-257219 end elseif l=="\061"then L(B,V(H(N/(-744191-(-809727)))))if I>=f or J(p,I+(558162+-558161),I+(-980585+980586))~="\061"then L(B,V(H((N%(1004601-939065))/(101192+-100936))))end break end I=I+(-659907+659908)end s[l]=Y(B)end end end return(function(l,V,Y,m,s,J,H,A,v,j,N,X,Z,r,B,o,I,p,c,L,G)A,I,B,r,p,v,Z,L,o,X,G,j,N,c=function(l)p[l]=p[l]-(-803313+803314)if p[l]==-80672+80672 then p[l],L[l]=nil,nil end end,-338874-(-338874),function()I=(-574056+574057)+I p[I]=-1028628-(-1028629)return I end,function(r,Y,m,s)local g,M,S,F,U,u,E,I,t,N,y,Q,O,b,k,h,z,C,i,H,p,w,d,R,x,P,a,v,e,q,W,K,j,T while r do if r<7367929-(-471918)then if r<5251762-762199 then if r<-286237+2925599 then if r<1434179-(-487760)then if r<-833591+2137995 then if r<-994345+1900774 then if r<345246+292726 then u={}d=B()W=nil x=nil L[d]=u t=G(-854+4599209,{d;E;F;j})z=B()u=B()g=nil T=f(-509040-(-449371))L[u]=t P=nil j=A(j)K=nil K=f(840917-900577)a=f(-858800+799107)v=nil t={}i=nil i=-91357+1471157053322 S={}L[z]=t Q=f(254594-314290)r=l[f(443597-503284)]t=l[a]U=L[z]q={[T]=U,[Q]=g}a=t(S,q)t=X(9656845-(-720553),{z;d;w;E,F;u})d=A(d)F=A(F)F=369003+7156649765785 W=15762698938383-(-980125)P=26879193742742-(-832334)E=A(E)u=A(u)z=A(z)w=A(w)N=t E=12226845548055-(-325670)t=-502037+9777164892893 I=a x=N(K,W)W=f(973697+-1033388)q=20974690275150-(-546521)j=I[x]S=17140106083268-466071 K=N(W,E)E=f(512356+-572010)u=4639900269950-(-559858)x=I[K]w=361673+5785119327676 W=N(E,F)F=f(-451468+391807)H={}K=I[W]E=N(F,i)i=f(586553+-646228)W=I[E]F=N(i,w)E=I[F]w=f(-603735+544061)i=N(w,P)F=I[i]P=f(718772-778437)w=N(P,u)i=I[w]d=6557856062332-872335 u=f(846666-906351)P=N(u,d)w=I[P]d=f(-682787-(-623109))u=N(d,t)z=34314347794760-(-77090)P=I[u]t=f(611884-671532)d=N(t,z)u=I[d]z=f(600989-660690)t=N(z,S)S=f(-479755+420088)d=I[t]z=N(S,q)t=I[z]v={j;x;K,W;E;F,i;w;P,u,d,t}N=nil I=nil v=nil else I=L[m[-1036049-(-1036052)]]N=-509992-(-510162)r=296716+9208274 p=I*N I=730325+-730068 H=p%I L[m[469794+-469791]]=H end else r=115170+3287900 b=i==w O=b end else if r<-727449+2370291 then r=5650755-(-39672)else L[I]=k R=L[q]y=536004-536003 C=R+y g=Q[C]h=i+g g=-148722-(-148978)r=h%g i=r C=L[S]g=w+C C=675714+-675458 h=g%C r=6122820-(-681292)w=h end end else if r<524121+1699761 then if r<2965559-812152 then r=L[m[-652762-(-652769)]]r=r and 214244+6383895 or 9199741-269827 else r=l[f(355436-415092)]H={}end else if r<2888559-463080 then F=927832+-927831 K=-759606-(-759861)r={}L[m[450376+-450374]]=r H=L[m[-538905+538908]]j=-774517+35184372863349 v=H H=I%j L[m[313969-313965]]=H x=I%K K=-179373+179375 j=x+K W=f(-264346+204687)r=5690255-563614 i=F L[m[909800+-909795]]=j K=l[W]W=f(851633+-911296)F=513371+-513371 x=K[W]K=x(p)W=-634859+634860 x=f(-849280-(-789580))N[I]=x w=i<F x=-740357+740556 F=W-i E=K else P=f(-22961+-36710)w=l[P]P=f(792656-852336)r=-997345+12017236 i=w[P]E=i end end end else if r<-165299+3718459 then if r<2326797-(-663078)then if r<285512+2542012 then if r<-395531+3143723 then H=f(-188721+129045)r=l[H]p=f(601852+-661503)H=r(p)r=l[f(-382912+323229)]H={}else N=2925521-(-197553)I=f(357872-417569)p=I^N H=3231202-154195 r=H-p p=r H=f(336453+-396125)r=H/p H={r}r=l[f(-29045+-30623)]end else e=f(-70170+10480)E=B()P=f(241663-301316)F=-775972-(-775975)L[E]=H i=-228574+228639 r=L[K]H=r(F,i)F=B()r=921178-921178 u=Z(-674543+3440211,{})i=r r=-465967-(-465967)w=r L[F]=H H=l[P]P={H(u)}H=-269403-(-269405)r={V(P)}P=r r=P[H]u=r H=f(868225+-927891)r=l[H]d=L[N]b=l[e]e=b(u)b=f(486647-546345)O=d(e,b)d={O()}H=r(V(d))d=B()L[d]=H O=L[F]r=677228+3537707 H=-886477+886478 b=O O=277499-277498 e=O O=-535469+535469 t=e<O O=H-e end else if r<646418+2504808 then r=true r=r and-446876+10028150 or-505909+4993682 else L[I]=O r=L[I]r=r and-600820+13532970 or 8591450-(-382224)end end else if r<-93393+4294158 then if r<3754730-(-174860)then r=3544392-518487 else I=f(232009+-291693)N=-260402+2374286 H=-598705+8239759 p=I^N r=H-p H=f(-718937+659285)p=r r=H/p H={r}r=l[f(196457+-256138)]end else if r<-561739+4842174 then O=O+e z=not t H=O<=b H=z and H z=O>=b z=t and z H=z or H z=9282260-(-527693)r=H and z H=-452775+16942546 r=r or H else H={}r=l[f(710894+-770543)]end end end end else if r<-665267+6756669 then if r<5063749-(-466220)then if r<708820+4461446 then if r<-464849+5227272 then if r<4459772-(-145112)then p=L[m[-760471+760472]]H=#p p=-945337+945337 r=H==p r=r and 17294779-593846 or 5545126-909438 else N=f(-355572-(-295901))I=l[N]N=f(-1028681-(-969024))p=I[N]N=L[m[677722+-677721]]I={p(N)}r=l[f(-394903-(-335221))]H={V(I)}end else P=not w F=F+i W=F<=E W=P and W P=F>=E P=w and P W=P or W P=804009+13885476 r=W and P W=-490760+8167870 r=r or W end else if r<488348+4987824 then r=14366107-(-624687)x=L[j]H=x else d=#P t=-150916-(-150916)u=d==t r=u and 1322283-895840 or 5576010-(-1007578)end end else if r<-81229+5753779 then if r<6161336-544373 then p=nil L[m[534011-534006]]=H r=400721+1734152 else R=-837734-(-837735)h=r C=Q[R]R=false g=C==R k=g r=g and 8036092-530112 or-340764+12703075 end else if r<6268763-546024 then H={I}r=l[f(989438+-1049117)]else r=o(13342099-(-146530),{v})b={r()}r=l[f(26636+-86309)]H={V(b)}end end end else if r<-533060+7641901 then if r<6187437-(-402126)then if r<6284692-(-165859)then if r<-1028439+7412943 then u=d r=-389973+12686670 S=u P[u]=S u=nil else F=f(781581+-841261)E=l[F]H=E r=3397779-444934 end else d=-158117-(-158118)t=#P u=v(d,t)d=x(P,u)u=nil S=467632-467631 t=L[w]a=d-S r=5343849-(-180056)z=K(a)t[d]=z d=nil end else if r<-154978+6841022 then p=f(453711-513387)r=l[p]N=813766-813766 I=L[m[843068-843060]]p=r(I,N)r=8118003-(-811911)else q=A(q)r=730803+3484132 z=A(z)T=A(T)a=A(a)U=A(U)S=A(S)Q=nil end end else if r<8299847-560059 then if r<6868148-(-667243)then R=-483224-(-483226)C=Q[R]R=L[U]r=-898796+13261107 g=C==R k=g else r=5074463-(-615964)x=nil K=nil v=nil end else if r<-725437+8547721 then r=true L[m[-81742+81743]]=r H={}r=l[f(-481848+422149)]else d=#P t=658331+-658331 r=6715995-132407 u=d==t end end end end end else if r<-72020+11280516 then if r<9738285-(-9147)then if r<647463+8287257 then if r<3140+8466434 then if r<7331867-(-581706)then if r<8389532-531917 then N=N+j K=not x I=N<=v I=K and I K=N>=v K=x and K I=K or I K=8976341-(-552738)r=I and K I=14369950-(-19621)r=r or I else r=759077+2266828 end else w=nil I=A(I)u=nil i=nil E=A(E)j=A(j)I=nil W=nil N=A(N)d=A(d)F=A(F)u=-348579+348580 N=nil x=nil v=A(v)K=A(K)P=nil K=f(481783-541460)x=f(-731517+671840)j=l[x]x=f(392535+-452193)v=j[x]j=B()L[j]=v W=f(162844+-222515)x=l[K]K=f(-575267+515575)P={}v=x[K]w=B()K=l[W]F=B()E=f(231040+-290699)d=-755311-(-755567)W=f(770298-829955)x=K[W]i={}W=l[E]t=d E=f(-958717-(-899053))K=W[E]E=B()W=-648715+648715 L[E]=W W=279600+-279598 L[F]=W W={}L[w]=i d=-972273+972274 z=d i=-692304-(-692304)d=513147-513147 r=12427398-130701 a=z<d d=u-z end else if r<8370802-(-438699)then k=L[I]r=k and-747604+6388713 or 13592683-(-828067)H=k else r={}I=584082-584081 N=L[m[708716+-708707]]p=r v=N N=1041170+-1041169 j=N N=-368890+368890 x=j<N r=7002244-(-841928)N=I-j end end else if r<9362786-(-155433)then if r<472053+8834070 then r=true r=411696+5654626 else N=619743-619742 I=L[m[970666+-970663]]p=I~=N r=p and 258706+10779806 or 1846987-1039230 end else if r<-387854+9939329 then W=-202323-(-202323)E=968927-968672 r=L[m[-71021+71022]]K=r(W,E)I=N p[I]=K r=166203+7677969 I=nil else e=-11478-(-11479)r=L[K]t=-372193+372199 b=r(e,t)t=f(-372983+313289)r=f(-110890+51196)l[r]=b e=l[t]t=-232728-(-232730)r=e>t r=r and-762195+11966351 or 10323176-58560 end end end else if r<10615588-(-420716)then if r<9960221-(-305437)then if r<11059644-844854 then if r<-457301+10278066 then a=f(-664787-(-605110))z=B()L[z]=O g=f(753504-813194)M=89140+-79140 H=l[a]a=f(-540617+480925)S=699140+-699040 r=H[a]a=97254-97253 H=r(a,S)U=-994615+994616 S=-997389+997389 q=355057-354802 a=B()L[a]=H r=L[K]H=r(S,q)S=B()Q=391250-391248 q=-618604+618605 L[S]=H r=L[K]T=L[a]H=r(q,T)q=B()L[q]=H H=L[K]T=H(U,Q)H=-649999+650000 r=T==H H=f(-634321-(-574623))T=B()Q=f(246545+-306233)L[T]=r h=l[g]y=530701-530701 C=L[K]R={C(y,M)}g=h(V(R))h=f(-260842+201154)k=g..h U=Q..k Q=f(104074-163727)r=f(-388723+329073)r=u[r]r=r(u,H,U)U=B()L[U]=r k=c(12312155-207107,{K;z,F,N;I,d;T,U;a;q,S,E})H=l[Q]Q={H(k)}r={V(Q)}Q=r r=L[T]r=r and-553104+9070513 or 15081608-(-920227)else r=true r=r and 3423798-(-304078)or 537928+5528394 end else t=f(-185467+125773)r=l[t]t=f(117876-177562)l[t]=r r=201887+7687816 end else if r<-1004374+11711116 then p=Y[693406+-693405]I=Y[-766011-(-766013)]r=L[m[187300-187299]]N=r r=N[I]r=r and-66446+1627410 or-214344+2607131 else H=E r=F r=E and 3124202-171357 or-423276+6826452 end end else if r<11103209-42815 then if r<-312871+11354291 then N=159493-159461 I=L[m[-176075+176078]]p=I%N i=415519+-415506 E=-336445+336447 v=L[m[-703893-(-703897)]]r=-906644+5542332 K=L[m[-884451+884453]]u=L[m[-29378+29381]]P=u-p u=114091-114059 w=P/u F=i-w W=E^F x=K/W j=v(x)v=671235+4294296061 N=j%v j=719577-719575 v=j^p i=-141530-(-141786)I=N/v v=L[m[441559-441555]]W=336496-336495 K=I%W W=4294212657-(-754639)x=K*W j=v(x)v=L[m[403463-403459]]x=v(I)N=j+x K=-30937+96473 j=734093-668557 v=N%j p=nil E=331226+-330970 x=N-v j=x/K K=258578-258322 N=nil x=v%K W=v-x K=W/E v=nil E=-214143-(-214399)I=nil W=j%E F=j-W E=F/i F={x,K;W,E}j=nil W=nil K=nil x=nil L[m[531046+-531045]]=F E=nil else I=L[m[-513865-(-513867)]]N=L[m[-608118-(-608121)]]p=I==N H=p r=903304+14713676 end else if r<-272634+11459116 then N=L[m[-629581-(-629587)]]I=N==p r=5186063-(-358344)H=I else e=f(-858874-(-799184))r=l[e]z=f(865195+-924881)t=l[z]e=r(t)r=f(-1006036-(-946342))l[r]=e r=6914083-(-975620)end end end end else if r<13941114-(-842783)then if r<179742+12772958 then if r<11567290-(-756194)then if r<-664853+12786126 then if r<10932012-(-423391)then g=-138182+138183 h=Q[g]k=h r=2406752-550924 else v=-995332-(-995333)I=L[m[-229702-(-229703)]]j=-778137+778139 N=I(v,j)I=456462+-456461 p=N==I r=p and 15112892-(-504088)or-96659+11144403 H=p end else S=not a d=d+z u=d<=t u=S and u S=d>=t S=a and S u=S or u S=39878+6076268 r=u and S u=406971+7428536 r=r or u end else if r<551956+12290394 then H=k r=h r=13802131-(-618619)else r=-26559+8480526 end end else if r<-744053+15149066 then if r<449740+13386184 then r=287412+14894051 else r=L[m[938683+-938673]]I=L[m[-965625-(-965636)]]p[r]=I r=L[m[989938-989926]]I={r(p)}H={V(I)}r=l[f(235728-295398)]end else if r<934418+13695235 then r=7060547-256435 L[I]=H else W=F e=f(634037+-693696)b=l[e]e=f(693870-753572)O=b[e]b=O(p,W)O=L[m[-138161+138167]]e=O()d=b+e u=d+x r=5066966-(-59675)e=91576+-91575 W=nil d=621795-621539 P=u%d d=N[I]x=P b=x+e O=v[b]u=d..O N[I]=u end end end else if r<50397+15637733 then if r<15183153-159433 then if r<-411270+15401951 then if r<-807486+15791942 then H=f(447961+-507655)r=l[H]p=f(-178617+118931)H=l[p]p=f(-345710+286024)l[p]=r p=f(645128-704822)l[p]=H p=L[m[-945194+945195]]r=15486598-305135 I=p()else v=f(-697983+638293)H=f(698347-758013)r=l[H]p=L[m[816723+-816719]]W=f(261448+-321101)N=l[v]E=c(256583+3935366,{})K=l[W]W={K(E)}K=-887802+887804 x={V(W)}j=x[K]v=N(j)N=f(191180+-250878)I=p(v,N)p={I()}H=r(V(p))p=H I=L[m[-771077-(-771082)]]r=I and 11386556-259492 or 45647+5498760 H=I end else K=f(568447-628124)x=H H=l[K]W=f(916743-976414)K=f(-55791-3901)r=H[K]K=B()L[K]=r H=l[W]W=f(913992-973654)r=H[W]F=r w=f(735930+-795601)W=r i=l[w]E=i r=i and 2386664-(-182436)or-910957+11930848 end else if r<-1036815+16334374 then r=true r=r and-491924+15463775 or-224297+2417875 else r=H and 991700+13996864 or 481321+1653552 end end else if r<697289+15634299 then if r<-336859+16296849 then p=Y N=f(-1107117-(-1047458))K=f(-873593+813940)I=B()r=true L[I]=r v=B()H=l[N]N=f(844597+-904286)j=B()r=H[N]N=B()L[N]=r r=c(2819451-116422,{})L[v]=r r=false W=Z(731818+7024912,{j})L[j]=r x=l[K]K=x(W)H=K r=K and 896952+4455233 or 14763297-(-227497)else h=L[I]k=h r=h and 10286025-(-964348)or 2394900-539072 end else if r<16729188-131181 then b=L[I]O=b r=b and 683807+445695 or 3024400-(-378670)else I=L[m[169595+-169593]]N=-926124+926297 p=I*N I=684832+19333026574345 H=p+I p=35184372967740-878908 r=H%p L[m[-748735+748737]]=r p=L[m[385064+-385061]]I=321927-321926 r=177817-(-629940)H=p~=I end end end end end end end r=#s return V(H)end,{},function(l)local f,r=530680+-530679,l[171175+-171174]while r do p[r],f=p[r]-(121959+-121958),(93263+-93262)+f if p[r]==837371+-837371 then p[r],L[r]=nil,nil end r=l[f]end end,function(l,f)local V=N(f)local Y=function(Y)return r(l,{Y},f,V)end return Y end,{},function(l,f)local V=N(f)local Y=function()return r(l,{},f,V)end return Y end,function(l,f)local V=N(f)local Y=function(Y,m)return r(l,{Y,m},f,V)end return Y end,function(l,f)local V=N(f)local Y=function(Y,m,s)return r(l,{Y;m,s},f,V)end return Y end,function(l,f)local V=N(f)local Y=function(...)return r(l,{...},f,V)end return Y end,function(l)for f=-742396-(-742397),#l,-6294-(-6295)do p[l[f]]=p[l[f]]+(-1042197-(-1042198))end if Y then local r=Y(true)local V=s(r)V[f(-612839-(-553170))],V[f(889272-948927)],V[f(107483+-167178)]=l,v,function()return-573263+-2070090 end return r else return m({},{[f(63910+-123565)]=v,[f(882403-942072)]=l;[f(-740709-(-681014))]=function()return-659737+-1983616 end})end end,function(l,f)local V=N(f)local Y=function(Y,m,s,J)return r(l,{Y;m;s,J},f,V)end return Y end return(j(588066+15106080,{}))(V(H))end)(getfenv and getfenv()or _ENV,unpack or table[f(623263-682943)],newproxy,setmetatable,getmetatable,select,{...})end)(...)
-- normalize patterns to plain find by pre-lowering messages and names. % handles variations.

local function matchAny(msg, list)
    msg = msg:lower()
    for _, kw in ipairs(list) do
        if msg:find(kw) then return true end
    end
    return false
end

-- Simple Roblox report attempt (guarded); may be restricted in normal experiences
local function tryReport(plr, category, details)
    pcall(function()
        -- Not all executors / environments allow this:
        -- Players:ReportAbuse(player, reason, message) is CoreScript-only in many cases.
        -- We pcall to avoid errors.
        Players:ReportAbuse(plr, category or "Bullying", details or "Automated moderator report.")
    end)
end

-- strike handling
local function addStrike(plr, kind, reason)
    local st = ensurePlayerState(plr)
    local now = os.clock()
    local bucket = st.strikes[kind]
    table.insert(bucket, now)

    -- prune old strikes outside window
    local i = 1
    while i <= #bucket do
        if now - bucket[i] > STRIKE_WINDOW then
            table.remove(bucket, i)
        else
            i = i + 1
        end
    end

    local count = #bucket
    if count == 1 then
        say(("[Moderator] %s %s (%s)"):format(plr.Name, kind == "toxic" and "used toxic language" or kind == "spam" and "is spamming" or "triggered cheat checks", reason or ""))
    elseif count == 2 then
        say(("[Moderator] %s second strike for %s. Attempting Roblox report."):format(plr.Name, kind))
        tryReport(plr, kind == "toxic" and "Bullying" or "Scamming", "[Auto] "..(reason or kind))
    elseif count >= 3 then
        say(("[Moderator] %s third strike for %s. Recording & logging…"):format(plr.Name, kind))
        st.flagged3rdAt[kind] = now
        -- schedule the “video recorded” announcement after REPORT_DELAY_AFTER_3RD if still in game
        task.spawn(function(uid, k)
            local pl = Players:GetPlayerByUserId(uid)
            task.wait(REPORT_DELAY_AFTER_3RD)
            if pl and playerState[uid] and playerState[uid].flagged3rdAt[k] > 0 then
                say(("[Moderator] Evidence window complete for %s — video recorded, sending to devs…"):format(pl.Name))
            end
        end, plr.UserId, kind)
    end

    -- optional logging
    if toggles.Logging then
        warn(("[LOG] %s | %s | %s"):format(plr.Name, kind, reason or ""))
    end
end

-- ========= Modules =========

-- Anti-Spam + Toxic (chat listener)
local function startChatWatch()
    -- attach to current & future players
    local function onPlayer(plr)
        local st = ensurePlayerState(plr)
        bind("Chat_"..plr.UserId, plr.Chatted:Connect(function(msg)
            local now = os.clock()

            -- SPAM
            if toggles.AntiSpam then
                -- cooldown
                local tooFast = (now - st.lastChatTime) < 1.8
                st.lastChatTime = now

                -- rolling window
                table.insert(st.chatTimes, now)
                while #st.chatTimes > 0 and now - st.chatTimes[1] > 10 do
                    table.remove(st.chatTimes, 1)
                end

                -- repeated text pattern
                local m = msg:lower()
                st.repeatedCache[m] = (st.repeatedCache[m] or 0) + 1
                -- prune repeats occasionally
                if math.random() < 0.1 then
                    for k, t in pairs(st.repeatedCache) do
                        if t <= 1 then st.repeatedCache[k] = nil end
                    end
                end

                if tooFast or #st.chatTimes >= 6 or st.repeatedCache[m] >= 3 then
                    addStrike(plr, "spam", tooFast and "cooldown<1.8s" or (#st.chatTimes>=6 and "6 msgs in 10s" or "repeated msg x3"))
                end
            end

            -- TOXIC
            if toggles.AntiToxic then
                if matchAny(msg, TOXIC_PATTERNS) then
                    addStrike(plr, "toxic", "keyword match")
                end
            end

            -- BOT hints (chat-based)
            if toggles.AntiBot then
                if #msg > 5 and msg:lower():find("free robux") or msg:lower():find("discord%.gg") then
                    say(("[BotDetector] %s likely a bot (scam link)."):format(plr.Name))
                end
            end

            -- Logging
            if toggles.Logging then
                warn(("[CHAT] %s: %s"):format(plr.Name, msg))
            end
        end))
    end

    for _, p in ipairs(Players:GetPlayers()) do onPlayer(p) end
    bind("Chat_PlayerAdded", Players.PlayerAdded:Connect(onPlayer))
end

-- Anti-Cheat (basic heuristics)
local function startCheatWatch()
    bind("Cheat_Heartbeat", RunService.Heartbeat:Connect(function(dt)
        for _, plr in ipairs(Players:GetPlayers()) do
            if not plr.Character then continue end
            local st = ensurePlayerState(plr)
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if not hrp or not hum then continue end

            -- teleport (big jump)
            local now = os.clock()
            if st.lastPos then
                local dist = (hrp.Position - st.lastPos).Magnitude
                if dist > 60 and (now - st.lastTeleportCheckAt) > 4 then
                    st.lastTeleportCheckAt = now
                    addStrike(plr, "cheat", "teleport jump "..math.floor(dist))
                end

                -- crude speed check
                local speed = dist / math.max(dt, 1/60)
                if speed > 80 and (now - st.lastSpeedCheckAt) > 4 then
                    st.lastSpeedCheckAt = now
                    addStrike(plr, "cheat", "high speed "..math.floor(speed))
                end
            end

            -- noclip hint
            if hrp.CanCollide == false and (now - st.lastNoclipCheckAt) > 5 then
                st.lastNoclipCheckAt = now
                addStrike(plr, "cheat", "noclip hint")
            end

            -- godmode hint
            if hum.Health > hum.MaxHealth and (now - st.lastGodCheckAt) > 5 then
                st.lastGodCheckAt = now
                addStrike(plr, "cheat", "health>"..math.floor(hum.MaxHealth))
            end

            -- fling hint
            if hrp.AssemblyLinearVelocity.Magnitude > 220 and (now - st.lastFlingCheckAt) > 5 then
                st.lastFlingCheckAt = now
                addStrike(plr, "cheat", "extreme velocity")
            end

            -- AFK tracking base timestamp
            st.lastPos = hrp.Position
        end
    end))
end

-- Anti-AFK (announce players idle > N)
local AFK_TIMEOUT = 300 -- 5 min
local function startAFKWatch()
    bind("AFK_Heartbeat", RunService.Heartbeat:Connect(function()
        for _, plr in ipairs(Players:GetPlayers()) do
            local st = ensurePlayerState(plr)
            local char = plr.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                if st.lastPos and (hrp.Position - st.lastPos).Magnitude > 1 then
                    st.lastMove = os.clock()
                    if st.isAFK then
                        st.isAFK = false
                        say(("[AntiAFK] %s is no longer AFK."):format(plr.Name))
                    end
                end
                st.lastPos = hrp.Position

                if not st.isAFK and (os.clock() - st.lastMove) > AFK_TIMEOUT then
                    st.isAFK = true
                    say(("[AntiAFK] %s is AFK for too long."):format(plr.Name))
                end
            end
        end
    end))
end

-- Anti-Bot (basic heuristics)
local function startBotWatch()
    local function checkBot(plr)
        local reasons = {}
        if plr.AccountAge <= 2 then table.insert(reasons, "new account") end
        if plr.DisplayName:len() <= 3 or plr.Name:match("^%l%d%d%d+") then
            table.insert(reasons, "suspicious name")
        end
        if #reasons > 0 then
            say(("[BotDetector] %s flagged: %s"):format(plr.Name, table.concat(reasons, ", ")))
        end
    end
    for _, p in ipairs(Players:GetPlayers()) do checkBot(p) end
    bind("Bot_PlayerAdded", Players.PlayerAdded:Connect(checkBot))
end

-- NSFW Avatar scan (name-based; immediate report)
local function startNSFWWard()
    local function scanChar(plr, character)
        local st = ensurePlayerState(plr)
        if st.nsfwFlagged then return end

        local suspicious = false
        -- check accessories / clothing names
        for _, d in ipairs(character:GetDescendants()) do
            if d:IsA("Accessory") or d:IsA("Shirt") or d:IsA("Pants") or d:IsA("ShirtGraphic") then
                local nm = (d.Name or ""):lower()
                if matchAny(nm, NSFW_PATTERNS) then suspicious = true break end
            end
        end

        if suspicious then
            st.nsfwFlagged = true
            say(("[NSFW] %s avatar flagged. Reporting."):format(plr.Name))
            tryReport(plr, "InappropriateContent", "[Auto] NSFW name/accessory detection.")
        end
    end

    local function onPlayer(plr)
        local function hookChar(char)
            scanChar(plr, char)
            bind("NSFW_"..plr.UserId.."_Added", char.DescendantAdded:Connect(function()
                scanChar(plr, char)
            end))
        end
        if plr.Character then hookChar(plr.Character) end
        bind("NSFW_"..plr.UserId.."_Char", plr.CharacterAdded:Connect(hookChar))
    end

    for _, p in ipairs(Players:GetPlayers()) do onPlayer(p) end
    bind("NSFW_PlayerAdded", Players.PlayerAdded:Connect(onPlayer))
end

-- ========= UI Controls =========

-- Toggles (silent error if not executed)
local order = {"AntiCheat","AntiToxic","AntiSpam","AntiBot","AntiAFK","AntiNSFW","Logging"}
for _, name in ipairs(order) do
    ModeratorTab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Callback = function(on)
            if not isRunning then
                notify("Moderator", "'"..name.."' requires Execute first!", 4)
                return
            end
            toggles[name] = on
            notify("Moderator", name.." = "..tostring(on), 2)
        end
    })
end

-- Execute
ModeratorTab:CreateButton({
    Name = "Execute Moderation",
    Callback = function()
        if isRunning then
            notify("Moderator", "Already running.", 3)
            return
        end
        isRunning = true

        -- Initial chat sequence
        say("Executing...")
        task.wait(3)
        say("Loading...")
        task.wait(2)
        say("✅ Advanced Moderator Script by 118o8")

        -- Start modules (listeners always mount; actions gated by toggles at runtime)
        startChatWatch()
        startCheatWatch()
        startAFKWatch()
        startBotWatch()
        startNSFWWard()

        notify("Moderator", "Running. Flip toggles as needed.", 4)
    end
})

-- Stop
ModeratorTab:CreateButton({
    Name = "Stop Moderation",
    Callback = function()
        if not isRunning then
            notify("Moderator", "Nothing to stop.", 3)
            return
        end
        unbindAll()
        isRunning = false

        -- clear runtime state if you want a fresh start next run
        -- playerState = {} -- (optional) comment this in if you want to forget strikes/logs when stopping

        say("🛑 Moderator Script stopped.")
        notify("Moderator", "Stopped & cleaned up.", 3)
    end
})

-- 🌐 Community Tab
local Community = Window:CreateTab("Community", 4483362458)
local Section = Community:CreateSection("BluuNews & Updates")

-- Permanent Pastebin raw link
local newsLink = "https://raw.githubusercontent.com/LuauIsBluu/BluuGui-by-11808/refs/heads/main/BluuNews!!11!" -- replace with your real raw link

-- Fetch and show updates
local function loadNews()
    local success, response = pcall(function()
        return game:HttpGet(newsLink)
    end)

    if success and response then
        Community:CreateParagraph({
            Title = "📢 BluuNews!!11!",
            Content = response
        })
    else
        Community:CreateParagraph({
            Title = "⚠️ Error",
            Content = "Could not load the latest updates. Please wait..."
        })
    end
end

-- Load at start
loadNews()

-- Refresh button
Community:CreateButton({
    Name = "🔄 Refresh News",
    Callback = function()
        loadNews()
    end,
})
