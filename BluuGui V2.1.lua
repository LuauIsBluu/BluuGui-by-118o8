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
   Name = "Super Ring (by lukas)",
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

local Button = Trolling:CreateButton({
   Name = "Fe Angel of death (Controlls--Q-K-L-Z)",
   Callback = function()
   		--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- LocalScript

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local InsertService = game:GetService("InsertService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local rightArm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightHand")

-- Function to check if the character is R6 or R15
local function isR15()
    return humanoid.RigType == Enum.HumanoidRigType.R15
end

-- Create animations
local animation1 = Instance.new("Animation")
local animation2 = Instance.new("Animation")
local animation3 = Instance.new("Animation")
local animationL = Instance.new("Animation")
local walkAnimation = Instance.new("Animation")
local flyAnimation = Instance.new("Animation")
local zAnimation = Instance.new("Animation")
local zFollowUpAnimation = Instance.new("Animation")

if isR15() then
    animation2.AnimationId = "rbxassetid://15392759696"
    animation3.AnimationId = "rbxassetid://55630898"
    animationL.AnimationId = "rbxassetid://10714395441"
    walkAnimation.AnimationId = "rbxassetid://10714174918"
    flyAnimation.AnimationId = "rbxassetid://15549124879"
else
    animation1.AnimationId = "rbxassetid://55306564"
    animation2.AnimationId = "rbxassetid://55306564"
    animation3.AnimationId = "rbxassetid://42070830"
    animationL.AnimationId = "rbxassetid://35978913"
    walkAnimation.AnimationId = "rbxassetid://28440069"
    flyAnimation.AnimationId = "rbxassetid://35152447"
end

zAnimation.AnimationId = "rbxassetid://44418205"
zFollowUpAnimation.AnimationId = "rbxassetid://28090053"

-- Load animations onto the humanoid
local animationTrack1 = humanoid:LoadAnimation(animation1)
local animationTrack2 = humanoid:LoadAnimation(animation2)
local animationTrack3 = humanoid:LoadAnimation(animation3)
local animationTrackL = humanoid:LoadAnimation(animationL)
local walkTrack = humanoid:LoadAnimation(walkAnimation)
local flyTrack = humanoid:LoadAnimation(flyAnimation)
local zTrack = humanoid:LoadAnimation(zAnimation)
local zFollowUpTrack = humanoid:LoadAnimation(zFollowUpAnimation)

-- Create sound effects
local gunSound = Instance.new("Sound")
gunSound.SoundId = "rbxassetid://1906350651"
gunSound.Volume = 1
gunSound.Looped = false
gunSound.Parent = character:WaitForChild("HumanoidRootPart")

local zSound = Instance.new("Sound")
zSound.SoundId = "rbxassetid://9113122694"
zSound.Volume = 1
zSound.Looped = false
zSound.PlaybackSpeed = 1
zSound.Parent = character:WaitForChild("HumanoidRootPart")

-- Create particle emitter
local particleEmitter = Instance.new("ParticleEmitter")
particleEmitter.Texture = "rbxassetid://410049012"
particleEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
particleEmitter.Lifetime = NumberRange.new(5.10)
particleEmitter.Rate = 100
particleEmitter.EmissionDirection = Enum.NormalId.Bottom
particleEmitter.Enabled = false
particleEmitter.Parent = rightArm

-- Function to play the animations in order when "K" is pressed (only for R6)
local function onKeyPressK(input)
    if input.KeyCode == Enum.KeyCode.K and not isR15() then
        animationTrack1:Play()
        animationTrack1.Stopped:Wait()
        animationTrack2:Play()
        animationTrack2.Stopped:Wait()
        animationTrack3:Play()
        wait(0.5)  -- Stop the third animation after 0.5 seconds
        animationTrack3:Stop()
    elseif input.KeyCode == Enum.KeyCode.K and isR15() then
        animationTrack2:Play()
        animationTrack2.Stopped:Wait()
        animationTrack3:Play()
        wait(0.5)  -- Stop the third animation after 0.5 seconds
        animationTrack3:Stop()
    end
end

-- Function to play the animation with gun sound and particles when "L" is pressed
local function onKeyPressL(input)
    if input.KeyCode == Enum.KeyCode.L then
        animationTrackL:Play()
        gunSound:Play()
        particleEmitter.Enabled = true
        wait(0.5)
        particleEmitter.Enabled = false
    end
end

-- Function to make the player fly and play the animation when "Q" is pressed
local function onKeyPressQ(input)
    if input.KeyCode == Enum.KeyCode.Q then
        flyTrack:Play()
        character.HumanoidRootPart.Anchored = true
        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 6, 0)

        if isR15() then
            wait(flyTrack.Length)  -- Wait for the duration of the animation
        else
            for i = 1, 3 do
                flyTrack:Play()
                wait(flyTrack.Length)  -- Wait for the duration of the animation before playing it again
            end
        end

        flyTrack:Stop()
        character.HumanoidRootPart.Anchored = false

        -- Add highlight effect to the character
        local highlight = Instance.new("Highlight")
        highlight.FillColor = Color3.fromRGB(255, 255, 0)
        highlight.FillTransparency = 0.5
        highlight.Parent = character
    end
end

-- Function to play the Z animation and follow-up animation when "Z" is pressed
local function onKeyPressZ(input)
    if input.KeyCode == Enum.KeyCode.Z then
        zTrack:Play()
        zSound:Play()
        wait(2)  -- Play the Z animation and sound for 2 seconds
        zTrack:Stop()
        zSound:Stop()
        zFollowUpTrack:Play()  -- Play the follow-up animation
    end
end

-- Function to play the walk animation
local function playWalk()
    if not walkTrack.IsPlaying then
        walkTrack:Play()
    end
end

-- Detect when the player starts moving
humanoid.Running:Connect(function(speed)
    if speed > 0 then
        playWalk()
    else
        walkTrack:Stop()
    end
end)

-- Connect the functions to the InputBegan event
UserInputService.InputBegan:Connect(onKeyPressK)
UserInputService.InputBegan:Connect(onKeyPressL)
UserInputService.InputBegan:Connect(onKeyPressQ)
UserInputService.InputBegan:Connect(onKeyPressZ)

   end,
})

        local Button = Trolling:CreateButton({
   Name = "Time stop",
   Callback = function()
   --- [[ Shadow Dio's Time Stop ]] ---
-- by ChillVR

local me = game.Players.LocalPlayer
local mouse = me:GetMouse()
local char = me.Character
local hum = char:FindFirstChild('Humanoid')
local hd = char:FindFirstChild('Head')
local ts = char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
local ra = char:FindFirstChild('Right Arm') or char:FindFirstChild('RightUpperArm')
local la = char:FindFirstChild('Left Arm') or char:FindFirstChild('LeftUpperArm')
local rl = char:FindFirstChild('Right Leg') or char:FindFirstChild('RightUpperLeg')
local ll = char:FindFirstChild('Left Leg') or char:FindFirstChild('LeftUpperLeg')
local root = char:FindFirstChild('HumanoidRootPart')
local rj = root:FindFirstChild('RootJoint')
local rs = ts:FindFirstChild('Right Shoulder')
local ls = ts:FindFirstChild('Left Shoulder')
local rh = ts:FindFirstChild('Right Hip')
local lh = ts:FindFirstChild('Left Hip')
local nk = ts:FindFirstChild('Neck')
local anim = char:FindFirstChild('Animate')
local base = workspace:FindFirstChild('Baseplate') or workspace:FindFirstChild('Base')
local cantimestop = true
local cooldown = false
local cc = workspace.CurrentCamera
local cos = math.cos
local sin = math.sin
local rad = math.rad
local rand = math.random
local cfn = CFrame.new
local cfa = CFrame.Angles
local v3 = Vector3.new
local str = string
local unfreeze = {}
local health = {}
local connect = {}
local sine = 0
local effects = nil
hum.WalkSpeed = 23
if char:FindFirstChild('Effects') then
	effects = char:FindFirstChild('Effects')
else
	effects = Instance.new('Folder', char)
	effects.Name = 'Effects'
end

ArtificialHB = Instance.new('BindableEvent', script)
ArtificialHB.Name = 'Heartbeat'
script:WaitForChild('Heartbeat')

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService('RunService').Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(t)
	if t == 0 or t == nil then
		script.Heartbeat.Event:Wait()
	else
		for i = 0, t do
			script.Heartbeat.Event:Wait()
		end
	end
end

function sound(id, parent, vol, pitch, timepos)
	local s = Instance.new('Sound')
	s.Parent = parent
	s.SoundId = id
	s.Volume = vol
	s.PlaybackSpeed = pitch
	s.TimePosition = timepos
	s:Play()
	game.Debris:AddItem(s, s.PlaybackSpeed + 5)
end

function camshake(duration, intensity)
	coroutine.wrap(function()
		for i = 1, duration do
			hum.CameraOffset = hum.CameraOffset:lerp(v3(rand(-1, 1), rand(-1, 1), rand(-1, 1)), 0.1 * intensity)
			swait()
		end
		hum.CameraOffset = v3(0, 0, 0)
	end)()
end

function findascendant(obj, class)
	local par = obj
	local ret = nil
	pcall(function()
		repeat 
			par = par.Parent
			if par:IsA(class) then
				ret = par
				break
			end
		until par == nil
	end)
	return ret
end

local TimeStopSounds = {
	
	TimeStop = 'rbxassetid://5782635691';
	TimeResume = 'rbxassetid://6859642317';
	
}

function timestop()
	cantimestop = false
	coroutine.wrap(function()
	local effect1 = Instance.new('Part', effects)
	effect1.Shape = 'Ball'
	effect1.Material = 'ForceField'
	effect1.Anchored = true
	effect1.CanCollide = false
	effect1.Size = v3(0, 0, 0)
	effect1.Transparency = 0
	sound(TimeStopSounds.TimeStop, ts, 5, 1, 0)
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA('BasePart') then
			if not v.Anchored and not findascendant(v, 'Tool') and not findascendant(v, 'HopperBin') then
				if not v:IsDescendantOf(char) then
					v.Anchored = true
					table.insert(unfreeze, v)
				end
			end
		end
		if v:IsA('Sound') then
			if not v:IsDescendantOf(char) then
				if v.IsPlaying then
					v:Pause()
					table.insert(unfreeze, v)
				end
			end
		end
		if v:IsA('Humanoid') then
			local last = v.Health
			local always = last
			local e = v.HealthChanged:connect(function(hp)
				if last - hp > 0 then
					table.insert(health, {humanoid = v, change = last - hp})
				end
				last = hp
				v.Health = always
			end)
			table.insert(connect, e)
		end
		if v:IsA('BodyVelocity') then
			local lastforce = v.MaxForce
			v.MaxForce = v3(0, 0, 0)
			table.insert(unfreeze, {force = v, change = lastforce})
		end
		if v:IsA('BodyPosition') then
			local lastposition = v.MaxForce
			local lastD = v.D
			local lastP = v.P
			v.MaxForce = v3(0, 0, 0)
			v.D = 0
			v.P = 0
			table.insert(unfreeze, {position = v, change = lastposition, dchange = lastD, pchange = lastP})
		end
		if v:IsA('BodyForce') then
			local lastforce2 = v.Force
			v.Force = v3(0, 0, 0)
			table.insert(unfreeze, {force2 = v, fchange = lastforce2})
		end
	end
	ee = workspace.DescendantAdded:Connect(function(v)
		if v:IsA('BasePart') then
			if not v.Anchored and not findascendant(v, 'Tool') and not findascendant(v, 'HopperBin') then
				if not v:IsDescendantOf(char) then
					v.Anchored = true
					table.insert(unfreeze, v)
				end
			end
		end
		if v:IsA('Sound') then
			if not v:IsDescendantOf(char) then
				if v.IsPlaying then
					v:Pause()
					table.insert(unfreeze, v)
				end
			end
		end
		if v:IsA('Humanoid') then
			local last = v.Health
			local always = last
			local e = v.HealthChanged:connect(function(hp)
				if last - hp > 0 then
					table.insert(health, {humanoid = v, change = last - hp})
				end
				last = hp
				v.Health = always
			end)
			table.insert(connect, e)
		end
	end)
	cce = Instance.new('ColorCorrectionEffect', game.Lighting)
	coroutine.wrap(function()
		for i = 1, 10 do
			camshake(70, 2)
			cce.Saturation = cce.Saturation - 0.1
			cce.Contrast = cce.Contrast + 0.1
			swait(5)
		end
	end)()
	coroutine.wrap(function()
	for i = 1, 1000 do
		effect1.CFrame = ts.CFrame
		effect1.Size = effect1.Size:lerp(v3(50, 50, 50), 0.015)
		effect1.Transparency = effect1.Transparency + 0.010
		if effect1.Transparency >= 1 then
			effect1:Destroy()
		end
		swait()
	end
	end)()
	wait(0.5)
	local effect2 = Instance.new('Part', effects)
	local effect3 = Instance.new('Part', effects)
	effect3.Shape = 'Ball'
	effect3.Material = 'ForceField'
	effect3.Anchored = true
	effect3.CanCollide = false
	effect3.Size = v3(0, 0, 0)
	effect3.Transparency = 0
	effect2.Shape = 'Ball'
	effect2.Material = 'ForceField'
	effect2.Anchored = true
	effect2.CanCollide = false
	effect2.Size = v3(40, 40, 40)
	effect2.Transparency = 1
	coroutine.wrap(function()
		for i = 1, 15 do
			effect2.Transparency = effect2.Transparency - 0.11
			swait()
		end
	end)()
	coroutine.wrap(function()
		for i = 1, 1000 do
			effect3.CFrame = ts.CFrame
			effect3.Size = effect3.Size:lerp(v3(50, 50, 50), 0.015)
			effect3.Transparency = effect3.Transparency + 0.010
			if effect3.Transparency >= 1 then
				effect3:Destroy()
			end
			swait()
		end
	end)()
	for i = 1, 1000 do
		effect2.CFrame = ts.CFrame
		effect2.Size = effect2.Size:lerp(v3(0, 0, 0), 0.015)
		effect2.Transparency = effect2.Transparency + 0.015
		if effect2.Transparency >= 1 then
			effect2:Destroy()
		end
		swait()
	end
	end)()
	wait(1.5) -- cooldown
	cooldown = true
end

function timeresume()
	coroutine.wrap(function()
	sound(TimeStopSounds.TimeResume, ts, 5, 1, 0.15)
	coroutine.wrap(function()
		for i = 1, 10 do
			camshake(20, 0.3)
			cce.Saturation = cce.Saturation + 0.1
			cce.Contrast = cce.Contrast - 0.1
			swait(5)
		end
		cce:Destroy()
	end)()
	coroutine.wrap(function()
		wait(1.5)
	for i,v in pairs(unfreeze) do
		pcall(function()
			v.Anchored = false
		end)
		pcall(function()
			v:Resume()
		end)
	end
	for i,v in pairs(connect) do
		pcall(function()
			v:Disconnect()
		end)
	end
	for i,v in pairs(health) do
		pcall(function()
			local humanoid = v.humanoid
			humanoid.Health = humanoid.Health - v.change
			if humanoid.Parent:FindFirstChild('Health') then
				pcall(function()
					humanoid.Parent.Health.Disabled = false
				end)
			end
		end)
	end
	pcall(function()
		ee:Disconnect()
	end)
	health = {}
	unfreeze = {}
	end)()
	cantimestop = true
	end)()
	wait(1.5) -- cooldown
	cooldown = false
end

mouse.KeyDown:connect(function(key)
	if str.lower(key) == 'r' and cantimestop and cooldown == false then
		timestop()
	elseif str.lower(key) == 'r' and cantimestop == false and cooldown then
		timeresume()
	end
end)--- [[ Shadow Dio's Time Stop ]] ---
-- by ChillVR

local me = game.Players.LocalPlayer
local mouse = me:GetMouse()
local char = me.Character
local hum = char:FindFirstChild('Humanoid')
local hd = char:FindFirstChild('Head')
local ts = char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
local ra = char:FindFirstChild('Right Arm') or char:FindFirstChild('RightUpperArm')
local la = char:FindFirstChild('Left Arm') or char:FindFirstChild('LeftUpperArm')
local rl = char:FindFirstChild('Right Leg') or char:FindFirstChild('RightUpperLeg')
local ll = char:FindFirstChild('Left Leg') or char:FindFirstChild('LeftUpperLeg')
local root = char:FindFirstChild('HumanoidRootPart')
local rj = root:FindFirstChild('RootJoint')
local rs = ts:FindFirstChild('Right Shoulder')
local ls = ts:FindFirstChild('Left Shoulder')
local rh = ts:FindFirstChild('Right Hip')
local lh = ts:FindFirstChild('Left Hip')
local nk = ts:FindFirstChild('Neck')
local anim = char:FindFirstChild('Animate')
local base = workspace:FindFirstChild('Baseplate') or workspace:FindFirstChild('Base')
local cantimestop = true
local cooldown = false
local cc = workspace.CurrentCamera
local cos = math.cos
local sin = math.sin
local rad = math.rad
local rand = math.random
local cfn = CFrame.new
local cfa = CFrame.Angles
local v3 = Vector3.new
local str = string
local unfreeze = {}
local health = {}
local connect = {}
local sine = 0
local effects = nil
hum.WalkSpeed = 23
if char:FindFirstChild('Effects') then
	effects = char:FindFirstChild('Effects')
else
	effects = Instance.new('Folder', char)
	effects.Name = 'Effects'
end

ArtificialHB = Instance.new('BindableEvent', script)
ArtificialHB.Name = 'Heartbeat'
script:WaitForChild('Heartbeat')

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService('RunService').Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(t)
	if t == 0 or t == nil then
		script.Heartbeat.Event:Wait()
	else
		for i = 0, t do
			script.Heartbeat.Event:Wait()
		end
	end
end

function sound(id, parent, vol, pitch, timepos)
	local s = Instance.new('Sound')
	s.Parent = parent
	s.SoundId = id
	s.Volume = vol
	s.PlaybackSpeed = pitch
	s.TimePosition = timepos
	s:Play()
	game.Debris:AddItem(s, s.PlaybackSpeed + 5)
end

function camshake(duration, intensity)
	coroutine.wrap(function()
		for i = 1, duration do
			hum.CameraOffset = hum.CameraOffset:lerp(v3(rand(-1, 1), rand(-1, 1), rand(-1, 1)), 0.1 * intensity)
			swait()
		end
		hum.CameraOffset = v3(0, 0, 0)
	end)()
end

function findascendant(obj, class)
	local par = obj
	local ret = nil
	pcall(function()
		repeat 
			par = par.Parent
			if par:IsA(class) then
				ret = par
				break
			end
		until par == nil
	end)
	return ret
end

local TimeStopSounds = {
	
	TimeStop = 'rbxassetid://5782635691';
	TimeResume = 'rbxassetid://6859642317';
	
}

function timestop()
	cantimestop = false
	coroutine.wrap(function()
	local effect1 = Instance.new('Part', effects)
	effect1.Shape = 'Ball'
	effect1.Material = 'ForceField'
	effect1.Anchored = true
	effect1.CanCollide = false
	effect1.Size = v3(0, 0, 0)
	effect1.Transparency = 0
	sound(TimeStopSounds.TimeStop, ts, 5, 1, 0)
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA('BasePart') then
			if not v.Anchored and not findascendant(v, 'Tool') and not findascendant(v, 'HopperBin') then
				if not v:IsDescendantOf(char) then
					v.Anchored = true
					table.insert(unfreeze, v)
				end
			end
		end
		if v:IsA('Sound') then
			if not v:IsDescendantOf(char) then
				if v.IsPlaying then
					v:Pause()
					table.insert(unfreeze, v)
				end
			end
		end
		if v:IsA('Humanoid') then
			local last = v.Health
			local always = last
			local e = v.HealthChanged:connect(function(hp)
				if last - hp > 0 then
					table.insert(health, {humanoid = v, change = last - hp})
				end
				last = hp
				v.Health = always
			end)
			table.insert(connect, e)
		end
		if v:IsA('BodyVelocity') then
			local lastforce = v.MaxForce
			v.MaxForce = v3(0, 0, 0)
			table.insert(unfreeze, {force = v, change = lastforce})
		end
		if v:IsA('BodyPosition') then
			local lastposition = v.MaxForce
			local lastD = v.D
			local lastP = v.P
			v.MaxForce = v3(0, 0, 0)
			v.D = 0
			v.P = 0
			table.insert(unfreeze, {position = v, change = lastposition, dchange = lastD, pchange = lastP})
		end
		if v:IsA('BodyForce') then
			local lastforce2 = v.Force
			v.Force = v3(0, 0, 0)
			table.insert(unfreeze, {force2 = v, fchange = lastforce2})
		end
	end
	ee = workspace.DescendantAdded:Connect(function(v)
		if v:IsA('BasePart') then
			if not v.Anchored and not findascendant(v, 'Tool') and not findascendant(v, 'HopperBin') then
				if not v:IsDescendantOf(char) then
					v.Anchored = true
					table.insert(unfreeze, v)
				end
			end
		end
		if v:IsA('Sound') then
			if not v:IsDescendantOf(char) then
				if v.IsPlaying then
					v:Pause()
					table.insert(unfreeze, v)
				end
			end
		end
		if v:IsA('Humanoid') then
			local last = v.Health
			local always = last
			local e = v.HealthChanged:connect(function(hp)
				if last - hp > 0 then
					table.insert(health, {humanoid = v, change = last - hp})
				end
				last = hp
				v.Health = always
			end)
			table.insert(connect, e)
		end
	end)
	cce = Instance.new('ColorCorrectionEffect', game.Lighting)
	coroutine.wrap(function()
		for i = 1, 10 do
			camshake(70, 2)
			cce.Saturation = cce.Saturation - 0.1
			cce.Contrast = cce.Contrast + 0.1
			swait(5)
		end
	end)()
	coroutine.wrap(function()
	for i = 1, 1000 do
		effect1.CFrame = ts.CFrame
		effect1.Size = effect1.Size:lerp(v3(50, 50, 50), 0.015)
		effect1.Transparency = effect1.Transparency + 0.010
		if effect1.Transparency >= 1 then
			effect1:Destroy()
		end
		swait()
	end
	end)()
	wait(0.5)
	local effect2 = Instance.new('Part', effects)
	local effect3 = Instance.new('Part', effects)
	effect3.Shape = 'Ball'
	effect3.Material = 'ForceField'
	effect3.Anchored = true
	effect3.CanCollide = false
	effect3.Size = v3(0, 0, 0)
	effect3.Transparency = 0
	effect2.Shape = 'Ball'
	effect2.Material = 'ForceField'
	effect2.Anchored = true
	effect2.CanCollide = false
	effect2.Size = v3(40, 40, 40)
	effect2.Transparency = 1
	coroutine.wrap(function()
		for i = 1, 15 do
			effect2.Transparency = effect2.Transparency - 0.11
			swait()
		end
	end)()
	coroutine.wrap(function()
		for i = 1, 1000 do
			effect3.CFrame = ts.CFrame
			effect3.Size = effect3.Size:lerp(v3(50, 50, 50), 0.015)
			effect3.Transparency = effect3.Transparency + 0.010
			if effect3.Transparency >= 1 then
				effect3:Destroy()
			end
			swait()
		end
	end)()
	for i = 1, 1000 do
		effect2.CFrame = ts.CFrame
		effect2.Size = effect2.Size:lerp(v3(0, 0, 0), 0.015)
		effect2.Transparency = effect2.Transparency + 0.015
		if effect2.Transparency >= 1 then
			effect2:Destroy()
		end
		swait()
	end
	end)()
	wait(1.5) -- cooldown
	cooldown = true
end

function timeresume()
	coroutine.wrap(function()
	sound(TimeStopSounds.TimeResume, ts, 5, 1, 0.15)
	coroutine.wrap(function()
		for i = 1, 10 do
			camshake(20, 0.3)
			cce.Saturation = cce.Saturation + 0.1
			cce.Contrast = cce.Contrast - 0.1
			swait(5)
		end
		cce:Destroy()
	end)()
	coroutine.wrap(function()
		wait(1.5)
	for i,v in pairs(unfreeze) do
		pcall(function()
			v.Anchored = false
		end)
		pcall(function()
			v:Resume()
		end)
	end
	for i,v in pairs(connect) do
		pcall(function()
			v:Disconnect()
		end)
	end
	for i,v in pairs(health) do
		pcall(function()
			local humanoid = v.humanoid
			humanoid.Health = humanoid.Health - v.change
			if humanoid.Parent:FindFirstChild('Health') then
				pcall(function()
					humanoid.Parent.Health.Disabled = false
				end)
			end
		end)
	end
	pcall(function()
		ee:Disconnect()
	end)
	health = {}
	unfreeze = {}
	end)()
	cantimestop = true
	end)()
	wait(1.5) -- cooldown
	cooldown = false
end

mouse.KeyDown:connect(function(key)
	if str.lower(key) == 'r' and cantimestop and cooldown == false then
		timestop()
	elseif str.lower(key) == 'r' and cantimestop == false and cooldown then
		timeresume()
	end
end)
   end,
})

        local Button = Trolling:CreateButton({
   Name = "Fe plane",
   Callback = function()
   --made by regular!plank
function noplsmesh(hat)
    _G.OldCF=workspace.Camera.CFrame
    oldchar=game.Players.LocalPlayer.Character
    game.Players.LocalPlayer.Character=workspace[game.Players.LocalPlayer.Name]
    for i,v in next, workspace[game.Players.LocalPlayer.Name][hat]:GetDescendants() do
    if v:IsA('Mesh') or v:IsA('SpecialMesh') then
    v:Remove()
    end
    end
    game.Players.LocalPlayer.Character=oldchar
    workspace.Camera.CFrame=_G.OldCF
    game.Players.LocalPlayer.Character=oldchar
    end
    HumanDied = false for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do if v:IsA("BasePart") then  _G.netless=game:GetService("RunService").Heartbeat:connect(function() v.AssemblyLinearVelocity = Vector3.new(-30,0,0) sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge) sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999) end) end end  local plr = game.Players.LocalPlayer local char = plr.Character local srv = game:GetService('RunService') local ct = {}  char.Archivable = true local reanim = char:Clone() reanim.Name = 'Nexo '..plr.Name..'' fl=Instance.new('Folder',char) fl.Name ='Nexo' reanim.Animate.Disabled=true char.HumanoidRootPart:Destroy() char.Humanoid:ChangeState(16)  for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do v:Stop() end char.Animate:Remove()  function create(part, parent, p, r) Instance.new("Attachment",part) Instance.new("AlignPosition",part) Instance.new("AlignOrientation",part) Instance.new("Attachment",parent) part.Attachment.Name = part.Name parent.Attachment.Name = part.Name part.AlignPosition.Attachment0 = part[part.Name] part.AlignOrientation.Attachment0 = part[part.Name] part.AlignPosition.Attachment1 = parent[part.Name] part.AlignOrientation.Attachment1 = parent[part.Name] parent[part.Name].Position = p or Vector3.new() part[part.Name].Orientation = r or Vector3.new() part.AlignPosition.MaxForce = 999999999 part.AlignPosition.MaxVelocity = math.huge part.AlignPosition.ReactionForceEnabled = false part.AlignPosition.Responsiveness = math.huge part.AlignOrientation.Responsiveness = math.huge part.AlignPosition.RigidityEnabled = false part.AlignOrientation.MaxTorque = 999999999 end  for i,v in next, char:GetDescendants() do if v:IsA('Accessory') then v.Handle:BreakJoints() create(v.Handle,reanim[v.Name].Handle) end end  char.Torso['Left Shoulder']:Destroy() char.Torso['Right Shoulder']:Destroy() char.Torso['Left Hip']:Destroy() char.Torso['Right Hip']:Destroy()  create(char['Torso'],reanim['Torso']) create(char['Left Arm'],reanim['Left Arm']) create(char['Right Arm'],reanim['Right Arm']) create(char['Left Leg'],reanim['Left Leg']) create(char['Right Leg'],reanim['Right Leg'])  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') or v:IsA('Decal') then v.Transparency = 1 end end  reanim.Parent = fl  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.RenderStepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.RenderStepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.Stepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.Stepped:Connect(function() v.CanCollide = false end)) end end  table.insert(ct,reanim.Humanoid.Died:Connect(function() plr.Character = char char:BreakJoints() reanim:Destroy() game.Players:Chat('-gr') _G.netless:Disconnect() HumanDied = true for _,v in pairs(ct) do v:Disconnect() end end))  plr.Character = reanim workspace.CurrentCamera.CameraSubject = reanim.Humanoid
    
    IT = Instance.new
    CF = CFrame.new
    VT = Vector3.new
    RAD = math.rad
    C3 = Color3.new
    UD2 = UDim2.new
    BRICKC = BrickColor.new
    ANGLES = CFrame.Angles
    EULER = CFrame.fromEulerAnglesXYZ
    COS = math.cos
    ACOS = math.acos
    SIN = math.sin
    ASIN = math.asin
    ABS = math.abs
    MRANDOM = math.random
    FLOOR = math.floor
    
    speed = 1
    sine = 1
    srv = game:GetService('RunService')
    
    reanim = game.Players.LocalPlayer.Character
    
    function hatset(yes,part,c1,c0,nm)
    reanim[yes].Handle.AccessoryWeld.Part1=reanim[part]
    reanim[yes].Handle.AccessoryWeld.C1=c1 or CFrame.new()
    reanim[yes].Handle.AccessoryWeld.C0=c0 or CFrame.new()
    if nm==true then
    noplsmesh(yes)
    end
    end
    
    --put the hat script converted here do not put it in loop or it will make ur camera bugged.
    
    RJ = reanim.HumanoidRootPart.RootJoint
    RS = reanim.Torso['Right Shoulder']
    LS = reanim.Torso['Left Shoulder']
    RH = reanim.Torso['Right Hip']
    LH = reanim.Torso['Left Hip']
    Root = reanim.HumanoidRootPart
    NECK = reanim.Torso.Neck
    NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RJ.C1 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RH.C1 = CF(0.5,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LH.C1 = CF(-0.5,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    
    Mode='1'
    
    mousechanger=game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
    if k == 'f' then-- first mode
    Mode='1'
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    elseif k == 'urkeybind' then-- second mode
    Mode='2'
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
    elseif k == 'urkeybind' then-- third mode
    Mode='3'
    end
    end)
    
    coroutine.wrap(function()
    --hat script here
    
    while true do -- anim changer
    if HumanDied then break end
    sine = sine + speed
    local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
    local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
    local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
    local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
    local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
    local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
    if lookvector > reanim.Humanoid.WalkSpeed then
    lookvector = reanim.Humanoid.WalkSpeed
    end
    if lookvector < -reanim.Humanoid.WalkSpeed then
    lookvector = -reanim.Humanoid.WalkSpeed
    end
    if rightvector > reanim.Humanoid.WalkSpeed then
    rightvector = reanim.Humanoid.WalkSpeed
    end
    if rightvector < -reanim.Humanoid.WalkSpeed then
    rightvector = -reanim.Humanoid.WalkSpeed
    end
    local lookvel = lookvector / reanim.Humanoid.WalkSpeed
    local rightvel = rightvector / reanim.Humanoid.WalkSpeed
    if Mode == '1' then
    if Root.Velocity.y > 1 then -- jump
    
    elseif Root.Velocity.y < -1 then -- fall
    
    elseif Root.Velocity.Magnitude < 2 then -- idle
    hatset('FireMohawk','Head',CFrame.new(),reanim['FireMohawk'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),-2.5+0*math.cos(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),false)
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(1.5+0*math.cos(sine/13),0.5+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(45+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(-25+0*math.cos(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-1.5+0*math.cos(sine/13),0.5+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(45+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(25+0*math.cos(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(0.5+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-0.5+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        reanim['FireMohawk'].Handle.AccessoryWeld.C0 = reanim['FireMohawk'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),-2.5+0*math.cos(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
    elseif Root.Velocity.Magnitude < 20 then -- walk
    hatset('FireMohawk','Head',CFrame.new(),reanim['FireMohawk'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),-2.5+0*math.cos(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),false)
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(1.5+0*math.cos(sine/13),0.5+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(45+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(-25+0*math.cos(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-1.5+0*math.cos(sine/13),0.5+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(45+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(25+0*math.cos(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(0.5+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-0.5+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        reanim['FireMohawk'].Handle.AccessoryWeld.C0 = reanim['FireMohawk'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),-2.5+0*math.cos(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
    
    elseif Root.Velocity.Magnitude > 20 then -- run
    
    end
    elseif Mode == '2' then
    if Root.Velocity.y > 1 then -- jump
    
    elseif Root.Velocity.y < -1 then -- fall
    
    elseif Root.Velocity.Magnitude < 2 then -- idle
    
    elseif Root.Velocity.Magnitude < 20 then -- walk
    
    elseif Root.Velocity.Magnitude > 20 then -- run
    
    end
    elseif Mode == '3' then
    if Root.Velocity.y > 1 then -- jump
    
    elseif Root.Velocity.y < -1 then -- fall
    
    elseif Root.Velocity.Magnitude < 2 then -- idle
    
    elseif Root.Velocity.Magnitude < 20 then -- walk
    
    elseif Root.Velocity.Magnitude > 20 then -- run
    
    end
    end
    srv.RenderStepped:Wait()
    end
    end)()
    --pls no steal :(
    --Im not just If do you see this is by regular_plank
    
   end,
})
        
-- 📌 Create Games Tab
local Games = Window:CreateTab("Games", 4483362458)

-- 🟦 99 Nights in the Forest
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
            
}) --Clean

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
    local Section = Games:CreateSection("Break In 2")
    Games:CreateButton({
        Name = "BreaKing Blitz (very OP)",
        Callback = function()
            
loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
        end,
    })

-- 🟦 Break In
    local Section = Games:CreateSection("Break In")
    Games:CreateButton({
        Name = "Break In (very OP)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()

        end,
    })

-- 🟦 Die of Death
    local Section = Games:CreateSection("Die Of Death")
    Games:CreateButton({
        Name = "DoD Nexer Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/Die-Of-Death/refs/heads/main/txt.txt"))()
        end,
    })


-- Animation script (your existing code)
local currentSetName = "Badware" -- default
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local oldAnimator = humanoid:FindFirstChildOfClass("Animator")
if oldAnimator then
    oldAnimator:Destroy()
end
local animator = Instance.new("Animator")
animator.Parent = humanoid

local animationSets = {
    Iquot = {Idle = "rbxassetid://129538723059546", Walk = "rbxassetid://111262064101049", Sprint = "rbxassetid://133764223100629"},
    Pursuer = {Idle = "rbxassetid://80974060339218", Walk = "rbxassetid://80948338059832", Sprint = "rbxassetid://86509870627165"},
    Classic = {Idle = "rbxassetid://98065949472006", Walk = "rbxassetid://86090280531902", Sprint = "rbxassetid://80622745059905"},
    MROB = {Idle = "rbxassetid://128876353799791", Walk = "rbxassetid://84523208605356", Sprint = "rbxassetid://134893121838000"},
    Killdroid = {Idle = "rbxassetid://90197302481794", Walk = "rbxassetid://125969711702313", Sprint = "rbxassetid://123837551946715"},
    Harken = {Idle = "rbxassetid://104774777136783", Walk = "rbxassetid://135226521217628", Sprint = "rbxassetid://119463021776325"},
    Badware = {Idle = "rbxassetid://136507569552573", Walk = "rbxassetid://83428305423587", Sprint = "rbxassetid://120893352730955"},
    Artful = {Idle = "rbxassetid://94473571249263", Walk = "rbxassetid://102572617659889", Sprint = "rbxassetid://100948610539178"},
    Mequot = {Idle = "rbxassetid://123989154628992", Walk = "rbxassetid://115493664585359", Sprint = "rbxassetid://130682734432079"},
    Devesto = {Idle = "rbxassetid://75370292739676", Walk = "rbxassetid://70580402939971", Sprint = "rbxassetid://91726581626277"},
    Cesus = {Idle = "rbxassetid://109980283233330", Walk = "rbxassetid://123324217013146", Sprint = "rbxassetid://94668334962235"}
}

local currentSet = animationSets[currentSetName]

local function loadAnim(id)
    local anim = Instance.new("Animation")
    anim.AnimationId = id
    return animator:LoadAnimation(anim)
end

local idleTrack = loadAnim(currentSet.Idle)
local walkTrack = loadAnim(currentSet.Walk)
local sprintTrack = loadAnim(currentSet.Sprint)
idleTrack:Play()

local function playOnly(trackToPlay)
    for _, track in ipairs({idleTrack, walkTrack, sprintTrack}) do
        if track == trackToPlay then
            if not track.IsPlaying then
                track:Play()
            end
        else
            if track.IsPlaying then
                track:Stop()
            end
        end
    end
end

local function switchSet(setName)
    if not animationSets[setName] then
        warn("Animation set '" .. setName .. "' does not exist!")
        return
    end
    currentSetName = setName
    currentSet = animationSets[setName]

    for _, track in ipairs({idleTrack, walkTrack, sprintTrack}) do
        if track.IsPlaying then
            track:Stop()
        end
    end

    idleTrack = loadAnim(currentSet.Idle)
    walkTrack = loadAnim(currentSet.Walk)
    sprintTrack = loadAnim(currentSet.Sprint)
    idleTrack:Play()
end

local function updateAnimation()
    local speed = humanoid.MoveDirection.Magnitude * humanoid.WalkSpeed
    if speed < 0.1 then
        playOnly(idleTrack)
    elseif speed <= 17 then
        playOnly(walkTrack)
    else
        playOnly(sprintTrack)
    end
end

RunService.RenderStepped:Connect(updateAnimation)

-- Rayfield dropdown
local animDropdown = Games:CreateDropdown({
    Name = "Animation Set (NOT FE For now)",
    Options = {"Iquot","Pursuer","Classic","MROB","Killdroid","Harken","Badware","Artful","Mequot","Devesto","Cesus"},
    CurrentOption = currentSetName,
    Flag = "AnimationSet",
    Callback = function(option)
        switchSet(option)
    end
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
    local Section = Games:CreateSection("Pwned by 14:00")
    Games:CreateButton({
        Name = "Inf Stamina",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Minnngocc/PWNED-by-14-00/refs/heads/main/Infinite%20stamina"))()
        end,
    })

-- 🟦 Biast
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
    local Section = Games:CreateSection("RobloxiaUntilDown")

        local Button = Games:CreateButton({
   Name = "Execute Nexer Hub (OP)",
   Callback = function()
   
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/NexerHub-TR-UD/refs/heads/main/NHTRUD.lua"))()
   end,
})

                -- 🟦 Forsaken
    local Section = Games:CreateSection("Forsaken")

 -- 1. Variables
local generatorEnabled = false
local delayTime = 1 -- seconds between triggers (initial)

-- 2. Toggle
Games:CreateToggle({
    Name = "Auto Generator",
    CurrentValue = false,
    Flag = "AutoGen",
    Callback = function(Value)
        generatorEnabled = Value
    end
})

-- 3. Slider to adjust delay
Games:CreateSlider({
    Name = "Delay Time",
    Range = {0.1, 5},       -- Min and max seconds between triggers
    Increment = 0.1,        -- Step size
    Suffix = "seconds",     -- Show "seconds" after the number
    CurrentValue = delayTime,
    Flag = "DelaySlider",
    Callback = function(Value)
        delayTime = Value
    end
})

-- 4. Loop to fire RemoteEvent
task.spawn(function()
    while task.wait() do
        if generatorEnabled then
            task.wait(delayTime) -- Wait delayTime seconds between fires
            local success, RE = pcall(function()
                return workspace:WaitForChild("Map")
                    :WaitForChild("Ingame")
                    :WaitForChild("Map")
                    :WaitForChild("Generator")
                    :WaitForChild("Remotes")
                    :WaitForChild("RE")
            end)

            if success and RE then
                RE:FireServer()
            end
        else
            task.wait(0.1) -- short pause when disabled
        end
    end
end)

-- 1. Variables
local staminaEnabled = false
local restoreThreshold = 30 -- default threshold

-- 2. Setup Remote/Module
local rs = cloneref(game:GetService("ReplicatedStorage"))
local sprint = rs.Systems.Character.Game.Sprinting
local m = require(sprint)

-- Optional: immediately set full stamina
m.Stamina = 100

-- 3. Toggle for infinite stamina
local Toggle = Games:CreateToggle({
    Name = "Infinite Stamina",
    CurrentValue = false,
    Flag = "InfiniteStamina",
    Callback = function(Value)
        staminaEnabled = Value
    end
})

-- 4. Input Box to set threshold
local Input = Games:CreateInput({
    Name = "Restore Threshold",
    PlaceholderText = "Enter number (default 30)",
    KeyboardType = Enum.KeyboardType.NumberPad,
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            restoreThreshold = num
        else
            warn("Invalid number entered!")
        end
    end
})

-- 5. Loop to restore stamina
task.spawn(function()
    while task.wait(0.1) do
        if staminaEnabled and m.Stamina <= restoreThreshold then
            m.Stamina = 100
        end
    end
end)

local Button = Games:CreateButton({
   Name = "Spoof device",
   Callback = function()
  
local UserInputService = game:GetService("UserInputService")
local Network = require(game.ReplicatedStorage.Modules.Network)

local DeviceSpoof = {}
local ForcedDevice = "Console" -- change to "Mobile", "Console" or "PC"

DeviceSpoof.Changed = Instance.new("BindableEvent").Event
DeviceSpoof.Value = ForcedDevice

local function ApplySpoof()
    DeviceSpoof.Value = ForcedDevice
    Network:FireServerConnection("SetDevice", "REMOTE_EVENT", ForcedDevice)
end

ApplySpoof()

UserInputService.LastInputTypeChanged:Connect(ApplySpoof)

while wait() do
    ApplySpoof()
end

return DeviceSpoof
   end,
})

local Button = Games:CreateButton({
   Name = "KryOnion",
   Callback = function()
  
loadstring(game:HttpGet("https://raw.githubusercontent.com/ehrerlikesteto/KryOnionrep/refs/heads/main/OnionIsForsaken"))()
                    Rayfield:Notify({
   Title = "Executed",
   Content = "BE carfully :3",
   Duration = 3.1,
   Image = 4483362458,
})
   end,
})

local Button = Games:CreateButton({
   Name = "Execute VoidWare",
   Callback = function()
  
if not game:IsLoaded() then return end
local CheatEngineMode = false
if (not getgenv) or (getgenv and type(getgenv) ~= "function") then CheatEngineMode = true end
if getgenv and not getgenv().shared then CheatEngineMode = true; getgenv().shared = {}; end
if getgenv and not getgenv().debug then CheatEngineMode = true; getgenv().debug = {traceback = function(string) return string end} end
if getgenv and not getgenv().require then CheatEngineMode = true; end
if getgenv and getgenv().require and type(getgenv().require) ~= "function" then CheatEngineMode = true end
local debugChecks = {
    Type = "table",
    Functions = {
        "getupvalue",
        "getupvalues",
        "getconstants",
        "getproto"
    }
}
local function checkExecutor()
    if identifyexecutor ~= nil and type(identifyexecutor) == "function" then
        local suc, res = pcall(function()
            return identifyexecutor()
        end)   
        --local blacklist = {'appleware', 'cryptic', 'delta', 'wave', 'codex', 'swift', 'solara', 'vega'}
        local blacklist = {'solara', 'cryptic', 'xeno', 'ember', 'ronix'}
        local core_blacklist = {'solara', 'xeno'}
        if suc then
            for i,v in pairs(blacklist) do
                if string.find(string.lower(tostring(res)), v) then CheatEngineMode = true end
            end
            for i,v in pairs(core_blacklist) do
                if string.find(string.lower(tostring(res)), v) then
                    pcall(function()
                        getgenv().queue_on_teleport = function() warn('queue_on_teleport disabled!') end
                    end)
                end
            end
            if string.find(string.lower(tostring(res)), "delta") then
                getgenv().isnetworkowner = function()
                    return true
                end
            end
        end
    end
end
task.spawn(function() pcall(checkExecutor) end)
local function checkDebug()
    if CheatEngineMode then return end
    if not getgenv().debug then 
        CheatEngineMode = true 
    else 
        if type(debug) ~= debugChecks.Type then 
            CheatEngineMode = true
        else 
            for i, v in pairs(debugChecks.Functions) do
                if not debug[v] or (debug[v] and type(debug[v]) ~= "function") then 
                    CheatEngineMode = true 
                else
                    local suc, res = pcall(debug[v]) 
                    if tostring(res) == "Not Implemented" then 
                        CheatEngineMode = true 
                    end
                end
            end
        end
    end
end
--if (not CheatEngineMode) then checkDebug() end
shared.CheatEngineMode = shared.CheatEngineMode or CheatEngineMode

task.spawn(function()
    pcall(function()
        local Services = setmetatable({}, {
            __index = function(self, key)
                local suc, service = pcall(game.GetService, game, key)
                if suc and service then
                    self[key] = service
                    return service
                else
                    warn(`[Services] Warning: "{key}" is not a valid Roblox service.`)
                    return nil
                end
            end
        })

        local Players = Services.Players
        local TextChatService = Services.TextChatService
        local ChatService = Services.ChatService
        repeat
            task.wait()
        until game:IsLoaded() and Players.LocalPlayer ~= nil
        local chatVersion = TextChatService and TextChatService.ChatVersion or Enum.ChatVersion.LegacyChatService
        local TagRegister = shared.TagRegister or {}
        if not shared.CheatEngineMode then
            if chatVersion == Enum.ChatVersion.TextChatService then
                TextChatService.OnIncomingMessage = function(data)
                    TagRegister = shared.TagRegister or {}
                    local properties = Instance.new("TextChatMessageProperties", game:GetService("Workspace"))
                    local TextSource = data.TextSource
                    local PrefixText = data.PrefixText or ""
                    if TextSource then
                        local plr = Players:GetPlayerByUserId(TextSource.UserId)
                        if plr then
                            local prefix = ""
                            if TagRegister[plr] then
                                prefix = prefix .. TagRegister[plr]
                            end
                            if plr:GetAttribute("__OwnsVIPGamepass") and plr:GetAttribute("VIPChatTag") ~= false then
                                prefix = prefix .. "<font color='rgb(255,210,75)'>[VIP]</font> "
                            end
                            local currentLevel = plr:GetAttribute("_CurrentLevel")
                            if currentLevel then
                                prefix = prefix .. string.format("<font color='rgb(173,216,230)'>[</font><font color='rgb(255,255,255)'>%s</font><font color='rgb(173,216,230)'>]</font> ", tostring(currentLevel))
                            end
                            local playerTagValue = plr:FindFirstChild("PlayerTagValue")
                            if playerTagValue and playerTagValue.Value then
                                prefix = prefix .. string.format("<font color='rgb(173,216,230)'>[</font><font color='rgb(255,255,255)'>#%s</font><font color='rgb(173,216,230)'>]</font> ", tostring(playerTagValue.Value))
                            end
                            prefix = prefix .. PrefixText
                            properties.PrefixText = string.format("<font color='rgb(255,255,255)'>%s</font>", prefix)
                        end
                    end
                    return properties
                end
            elseif chatVersion == Enum.ChatVersion.LegacyChatService then
                ChatService:RegisterProcessCommandsFunction("CustomPrefix", function(speakerName, message)
                    TagRegister = shared.TagRegister or {}
                    local plr = Players:FindFirstChild(speakerName)
                    if plr then
                        local prefix = ""
                        if TagRegister[plr] then
                            prefix = prefix .. TagRegister[plr]
                        end
                        if plr:GetAttribute("__OwnsVIPGamepass") and plr:GetAttribute("VIPChatTag") ~= false then
                            prefix = prefix .. "[VIP] "
                        end
                        local currentLevel = plr:GetAttribute("_CurrentLevel")
                        if currentLevel then
                            prefix = prefix .. string.format("[%s] ", tostring(currentLevel))
                        end
                        local playerTagValue = plr:FindFirstChild("PlayerTagValue")
                        if playerTagValue and playerTagValue.Value then
                            prefix = prefix .. string.format("[#%s] ", tostring(playerTagValue.Value))
                        end
                        prefix = prefix .. speakerName
                        return prefix .. " " .. message
                    end
                    return message
                end)
            end
        end
    end)
end)

local commit = shared.CustomCommit and tostring(shared.CustomCommit) or shared.StagingMode and "staging" or "da0aeb15a18d3c8091ff1e3aab25970f40f53465"

loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/"..tostring(commit).."/newforsaken.lua", true))()
                    
                    Rayfield:Notify({
   Title = "Executed",
   Content = "BE carfully :3",
   Duration = 3.1,
   Image = 4483362458,
})
   end,
})

 --[[ Hitbox Extender con Toggle, Slider y Hitbox Visible ]]
        local HitboxModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/nexeralt/ForsakenHitboxExtender/refs/heads/main/open%20source.luau"))()
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local extendPower = 2
        local hitboxEnabled = false

        -- Mantener hitbox activo
        RunService.RenderStepped:Connect(function()
            if hitboxEnabled then
                HitboxModule:ExtendHitbox(extendPower, 0.1)
            end
        end)

        -- Toggle para activar/desactivar hitbox
        Games:CreateToggle({
            Name = "Enable Hitbox",
            CurrentValue = false,
            Callback = function(value)
                hitboxEnabled = value
                if not value then
                    HitboxModule:StopExtendingHitbox()
                end
            end
        })

        -- Slider para cambiar potencia
        Games:CreateSlider({
            Name = "Hitbox Power",
            Min = 1,
            Max = 100,
            Default = 2,
            Callback = function(value)
                extendPower = value
            end
        })

local Button = Games:CreateButton({
   Name = "Play Emotes as killer (beta)",
   Callback = function()
   --emote settings 
local Solt1 = "StockDance"
local Solt2 = "Brickbattler"
local Solt3 = "Drumsticks"
local Solt4 = "CaliforniaGirls"
local Solt5 = "Hotdog"
local Solt6 = "Wave"

local function PlayEmote(Emote)
    local args = {
        [1] = "PlayEmote";
        [2] = "Animations";
        [3] = Emote;
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Modules", 9e9):WaitForChild("Network", 9e9):WaitForChild("RemoteEvent", 9e9):FireServer(unpack(args))
end

local function createButton(ButtonName, parent, text, position, color, onClick)
    local button = Instance.new("TextButton")
    button.Name = ButtonName
    button.Size = UDim2.new(0.8, 0, 0.12, 0)
    button.Position = position
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = color
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.Parent = parent

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = button

    button.MouseButton1Click:Connect(onClick)

    return button
end

local function createEmoteButton(onClick)
    local EmoteFrame = game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI.EmoteMenuHolder.RadialMenu.Attach["6"]
    local button = Instance.new("TextButton", EmoteFrame)
    button.Size = UDim2.new(0.705655515, 1, 0.705655217, 1)
    button.Position = UDim2.new(0.153545171, 0, 0.356493711, 0)
    button.Text = ""
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.new(1, 1, 1)
    button.BackgroundTransparency = 1 -- Set transparency to 1 (fully transparent)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = button

    button.MouseButton1Down:Connect(onClick)

    return button
end

local Playersgui = game:GetService("Players")
local playergui = Playersgui.LocalPlayer
-- Smaller GUI
local screenGui = Instance.new("ScreenGui", playergui:WaitForChild("PlayerGui"))
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 200, 0, 280)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = mainFrame

-- Close Button
local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Name = "Close"
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    mainFrame:Destroy()
    screenGui:Destroy()
end)

-- Create Buttons
createButton("1", mainFrame, "1", UDim2.new(0.1, 0, 0.1, 0), Color3.fromRGB(30, 60, 90), function()
    PlayEmote(Solt1)
end)

createButton("2", mainFrame, "2", UDim2.new(0.1, 0, 0.24, 0), Color3.fromRGB(0, 0, 255), function()
    PlayEmote(Solt2)
end)

createButton("3", mainFrame, "3", UDim2.new(0.1, 0, 0.38, 0), Color3.fromRGB(255, 105, 180), function()
    PlayEmote(Solt3)
end)

createButton("4", mainFrame, "4", UDim2.new(0.1, 0, 0.52, 0), Color3.fromRGB(255, 105, 180), function()
    PlayEmote(Solt4)
end)

createButton("5", mainFrame, "5", UDim2.new(0.1, 0, 0.66, 0), Color3.fromRGB(255, 105, 180), function()
    PlayEmote(Solt5)
end)
-- Last Button
createButton("6", mainFrame, "6", UDim2.new(0.1, 0, 0.80, 0), Color3.fromRGB(255, 50, 50), function()
    PlayEmote(Solt6)
end)

-- Restored "Made by: 118o8" Label
local creditLabel = Instance.new("TextLabel", mainFrame)
creditLabel.Size = UDim2.new(0.8, 0, 0.08, 0)
creditLabel.Position = UDim2.new(0.1, 0, 0.92, 0)
creditLabel.Text = "Emote As Killer"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.BackgroundTransparency = 1
creditLabel.Font = Enum.Font.GothamBold
creditLabel.TextSize = 14
creditLabel.TextXAlignment = Enum.TextXAlignment.Center

local NotifyModule:NotifyModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/PeaPattern/notif-lib/main/main.lua"))()
NotifyModule:Notify("Haxxed!!11!", 2)
   end,
})

local Button = Games:CreateButton({
   Name = "Fe mafioso old skin (Execute before round starts)",
   Callback = function()
   -- Execute BEFORE a round
loadstring(game:HttpGet("https://raw.githubusercontent.com/UncertainlyRound/ForsakenScripts/refs/heads/main/MafiosoRework/main.lua"))()

Rayfield:Notify({
   Title = "You Are Mine!",
   Content = "Executed just execute before round strats",
   Duration = 2.9,
   Image = 4483362458,
})
                    
   end,
})

local Button = Games:CreateButton({
   Name = "Give deleted emotes (FE)",
   Callback = function()
   --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animationId1 = "rbxassetid://74238051754912"
local animationId2 = "rbxassetid://87482480949358"
local animationId3 = "rbxassetid://100986631322204"
local animationId4 = "rbxassetid://107464355830477"
local animationId5 = "rbxassetid://107464355830477"
local audioId1 = "rbxassetid://123236721947419"
local audioId2 = "rbxassetid://132297506693854"
local audioId3 = "rbxassetid://131936418953291"
local audioId4 = "rbxassetid://77601084987544"
local audioId5 = "rbxassetid://120176009143091"

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.4, 0)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.Parent = screenGui

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0.3, 0, 0.2, 0)
button1.Position = UDim2.new(0.05, 0, 0.3, 0)
button1.Text = "Play: Shucks"
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button1.BorderColor3 = Color3.fromRGB(255, 0, 0)
button1.Parent = frame

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0.3, 0, 0.2, 0)
button2.Position = UDim2.new(0.35, 0, 0.3, 0)
button2.Text = "Stop Animations"
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button2.BorderColor3 = Color3.fromRGB(255, 0, 0)
button2.Parent = frame

local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0.3, 0, 0.2, 0)
button3.Position = UDim2.new(0.65, 0, 0.3, 0)
button3.Text = "Play: Subterfuge"
button3.TextColor3 = Color3.fromRGB(255, 255, 255)
button3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button3.BorderColor3 = Color3.fromRGB(255, 0, 0)
button3.Parent = frame

local button4 = Instance.new("TextButton")
button4.Size = UDim2.new(0.3, 0, 0.2, 0)
button4.Position = UDim2.new(0.05, 0, 0.55, 0)
button4.Text = "Play: I Miss The Quiet"
button4.TextColor3 = Color3.fromRGB(255, 255, 255)
button4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button4.BorderColor3 = Color3.fromRGB(255, 0, 0)
button4.Parent = frame

local button5 = Instance.new("TextButton")
button5.Size = UDim2.new(0.3, 0, 0.2, 0)
button5.Position = UDim2.new(0.35, 0, 0.55, 0)
button5.Text = "Play: Silly Billy"
button5.TextColor3 = Color3.fromRGB(255, 255, 255)
button5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button5.BorderColor3 = Color3.fromRGB(255, 0, 0)
button5.Parent = frame

local button6 = Instance.new("TextButton")
button6.Size = UDim2.new(0.3, 0, 0.2, 0)
button6.Position = UDim2.new(0.65, 0, 0.55, 0)
button6.Text = "Play: Silly Billy Thick of It"
button6.TextColor3 = Color3.fromRGB(255, 255, 255)
button6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button6.BorderColor3 = Color3.fromRGB(255, 0, 0)
button6.Parent = frame

local creditText = Instance.new("TextLabel")
creditText.Size = UDim2.new(1, 0, 0.2, 0)
creditText.Position = UDim2.new(0, 0, 0, 0)
creditText.Text = "Created by IDislikeShovels"
creditText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
creditText.BorderColor3 = Color3.fromRGB(255, 0, 0)
creditText.Parent = frame

local animation1 = Instance.new("Animation")
animation1.AnimationId = animationId1

local animation2 = Instance.new("Animation")
animation2.AnimationId = animationId2

local animation3 = Instance.new("Animation")
animation3.AnimationId = animationId3

local animation4 = Instance.new("Animation")
animation4.AnimationId = animationId4

local animation5 = Instance.new("Animation")
animation5.AnimationId = animationId5

local animationTrack1 = humanoid:LoadAnimation(animation1)
local animationTrack2 = humanoid:LoadAnimation(animation2)
local animationTrack3 = humanoid:LoadAnimation(animation3)
local animationTrack4 = humanoid:LoadAnimation(animation4)
local animationTrack5 = humanoid:LoadAnimation(animation5)

local audio1 = Instance.new("Sound")
audio1.SoundId = audioId1
audio1.Parent = character

local audio2 = Instance.new("Sound")
audio2.SoundId = audioId2
audio2.Parent = character

local audio3 = Instance.new("Sound")
audio3.SoundId = audioId3
audio3.Parent = character

local audio4 = Instance.new("Sound")
audio4.SoundId = audioId4
audio4.Parent = character

local audio5 = Instance.new("Sound")
audio5.SoundId = audioId5
audio5.Parent = character

local function playAnimation1()
    animationTrack1:Play()
    audio1:Play()
end

local function stopAnimations()
    animationTrack1:Stop()
    animationTrack2:Stop()
    animationTrack3:Stop()
    animationTrack4:Stop()
    animationTrack5:Stop()
    audio1:Stop()
    audio2:Stop()
    audio3:Stop()
    audio4:Stop()
    audio5:Stop()
end

local function playAnimation2()
    animationTrack2:Play()
    audio2:Play()
end

local function playAnimation3()
    animationTrack3:Play()
    audio3:Play()
end

local function playAnimation4()
    animationTrack4:Play()
    audio4:Play()
end

local function playAnimation5()
    animationTrack5:Play()
    audio5:Play()
end

button1.MouseButton1Click:Connect(playAnimation1)

button2.MouseButton1Click:Connect(stopAnimations)

button3.MouseButton1Click:Connect(playAnimation2)

button4.MouseButton1Click:Connect(playAnimation3)

button5.MouseButton1Click:Connect(playAnimation4)

button6.MouseButton1Click:Connect(playAnimation5)

   end,
})

local Button = Games:CreateButton({
   Name = "XVC OP hub (keyless)"
   Callback = function()
   -- DO NOT USE CODE FROM THIS SCRIPT. PERMISSION IS NOT GRANTED
loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/NeptX/refs/heads/main/NeptZ/Forsaken/source.lua"))()
   end,
})

        local Button = Games:CreateButton({
   Name = "ESP",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/PlutomasterAccount/Forsaken-ESP/refs/heads/main/Forsaken%20ESP%20Plutomaster.lua"))()

Rayfield:Notify({
   Title = "ESP executed >:D",
   Content = "For killer and survivors",
   Duration = 4,1
   Image = 4483362458,
})
                    
   end,
})

local Button = Games:CreateButton({
   Name = "Farsaken Gui (Keyless)",
   Callback = function()
   
if getgenv then
    getgenv().DebugNotifications = "false"
    getgenv().TrackMePlease = "true"
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua"))()

   end,
})
        
         -- 🟦 Field Trip Z
    local Section = Games:CreateSection("Field Trip Z")

        local Button = Games:CreateButton({
   Name = "Pepsi Cat Hub",
   Callback = function()
   
loadstring(game:HttpGet("https://pastebin.com/raw/pP0QtSEC"))()

Rayfield:Notify({
   Title = "Executed! >:D",
   Content = "Credits to (IDislikeShovels)",
   Duration = 6.5,
   Image = 4483362458,
})
    

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
}) --Clean

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
   Name = "Hitbox Expander (Not Mine)",
   Callback = function()
   		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwoqeex/Hitbox-Expander/refs/heads/main/Hitboxes"))()
   end,
})


        --[[ Hitbox Extender con Toggle, Slider y Hitbox Visible ]]
        local HitboxModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/nexeralt/ForsakenHitboxExtender/refs/heads/main/open%20source.luau"))()
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local extendPower = 2
        local hitboxEnabled = false

        -- Mantener hitbox activo
        RunService.RenderStepped:Connect(function()
            if hitboxEnabled then
                HitboxModule:ExtendHitbox(extendPower, 0.1)
            end
        end)

        -- Toggle para activar/desactivar hitbox
        Useful:CreateToggle({
            Name = "Enable Hitbox",
            CurrentValue = false,
            Callback = function(value)
                hitboxEnabled = value
                if not value then
                    HitboxModule:StopExtendingHitbox()
                end
            end
        })

        -- Slider para cambiar potencia
        Useful:CreateSlider({
            Name = "Hitbox Power",
            Min = 1,
            Max = 100,
            Default = 2,
            Callback = function(value)
                extendPower = value
            end
        })

-- Botón para mostrar hitbox visible
Useful:CreateButton({
    Name = "Visible Hitbox",
    Callback = function()
        -- Crear un Part para el hitbox visible
        local hitboxPart = Instance.new("Part")
        hitboxPart.Size = Vector3.new(extendPower*2, 5, extendPower*2)
        hitboxPart.Position = character:WaitForChild("HumanoidRootPart").Position
        hitboxPart.Anchored = true
        hitboxPart.CanCollide = false
        hitboxPart.Transparency = 0.3
        hitboxPart.BrickColor = BrickColor.new("Bright red")
        hitboxPart.Parent = workspace

        -- Actualizar posición en cada frame
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if character and character:FindFirstChild("HumanoidRootPart") then
                hitboxPart.Position = character.HumanoidRootPart.Position
                hitboxPart.Size = Vector3.new(extendPower*2, 5, extendPower*2)
            else
                hitboxPart:Destroy()
                connection:Disconnect()
            end
        end)
    end
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

Useful:CreateToggle({
    Name = "Show All Hitboxes",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            startHighlighting()
        else
            stopHighlighting()
        end
    end
}) --Clean

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
    "I like ur smile!", 
    "Hey Its me!", 
    "Awww man!"
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
}) --Clean

    local Jerk = Fun:CreateSection("Just A Normal animation(Dont tell mom!)")

    local Button = Fun:CreateButton({
   Name = ">:)",
   Callback = function()

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

    local Button = Fun:CreateButton({
   Name = "D: Esc+R",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/LuauIsBluu/BluuGui-by-118o8/refs/heads/main/Game%20Over%20script%20(FE)"))()

   end,
})

local Button = Fun:CreateButton({
   Name = "Fe fake dead",
   Callback = function()
   _, Protected_by_MoonSecV2, Discord = 'discord.gg/gQEH2uZxUk'


,nil,nil;(function() _msec=(function(e,l,o)local T=l[(0xa9+-70)];local E=o[e[(9324/0xe)]][e[(763+-0x20)]];local _=(56+-0x34)/(-0x1f+(169-(-113+(0x242-329))))local r=(42-((-45+0x5)+0x50))-(0xdb/219)local p=o[e[(0x1ad-275)]][e[(-26+0x110)]];local B=(0x51/(205+(-16+-0x6c)))+(41+-0x27)local t=o[e[((-126+0x45)+620)]][e[(0x277c6/193)]]local n=(110+-0x6c)-(0x27+((-0x39934/29)/214))local S=(0x21-((14136/(0x40aa/89))-0x2f))local v=(0x75-((41182-(0x13d178/63))/182))local L=(148/(0xc6e/(299-(0x28c5/49))))local C=((((-0x1fa38386/(304-0xd5))/249)/0xdd)+0x6e)local s=((((0xe+(-0x40f5/241))+0x41)-32)+0x1a)local m=((((-0x1a3f+-92)+0xd1b)/144)+0x1c)local O=((((0x174228/42)/0xac)-0xa3)/24)local h=((-156/(0x338/(278+-0x48)))+0x29)local f=(0xca/(2525/((0x5b00e/(234-0xa4))/213)))local k=(0xb6/((4981340/(0xf8+(-4338/0xf1)))/238))local w=(95+((((0x1c+-60)+-0x49f)/243)+-88))local U=(((159216/(500-0x11e))-422)/0xa1)local i=(0x1b+(-5256/((0x265+(-0x2a-17))-0x14f)))local c=(0x5b-(((104710-0xcca2)/206)-166))local b=((((-0x2d4f8/111)/152)+-109)+123)local D=(-0x68+(-41+(23976/(0x162-192))))local N=(87/((0x139-(8225/0x2f))+-0x6d))local u=(((173-(0x7d1a/239))-57)+21)local K=e[(0x2418c/108)];local G=o[e[(258+-0x68)]][e[((0x33f7b/201)-0x24f)]];local Q=o[(function(e)return type(e):sub(1,1)..'\101\116'end)('##!&,=%+')..'\109\101'..('\116\97'or'/*!/+%%:')..e[(615+-0x34)]];local A=o[e[(1227-0x298)]][e[(89010/0x5a)]];local j=(84+-0x52)-((278-((84933-0xa61d)/0xe4))-90)local g=(332/((0x8ad9-17783)/0x6b))-(0x36-52)local Y=o[e[(0x160-198)]][e[(0xa90c/124)]];local l=function(l,e)return l..e end local y=(0x55-81)*(((0x1a349-53701)/0xfd)/53)local V=o[e[(2498-0x51b)]];local x=(109-0x6b)*(((-0x212d+-92)/0x55)+0xe5)local J=(208896/0xcc)*(0x17-(0x2b+(-0x48e/53)))local W=(0xd2-((793-0x1c7)-0xb4))local P=(0x6c-(-111+(0xf1+-24)))*(-0x63+101)local M=o[e[(2169-0x45f)]]or o[e[(0x49f-620)]][e[(2169-0x45f)]];local a=((1162-(0x6a59/45))-301)local e=o[e[(-53+0x541)]];local A=(function(a)local x,o=1,0x10 local l={j={},v={}}local d=-n local e=o+r while true do l[a:sub(e,(function()e=x+e return e-r end)())]=(function()d=d+n return d end)()if d==(y-n)then d=""o=j break end end local d=#a while e<d+r do l.v[o]=a:sub(e,(function()e=x+e return e-r end)())o=o+n if o%_==j then o=g A(l.j,(Y((l[l.v[g]]*y)+l[l.v[n]])))end end return t(l.j)end)("..:::MoonSec::..!*%&/+^,;.:_#$}==}.+%%_//^$;^:=#;}%!_%//$^^;=_;#*}_!/%$}^^=;;:*$:}/!$%^+=,;;*::#&}$!^%=/;^*#::&##}*#=#;/*^:;/.;#_}}}&!^#:.}/*:/^%!;#*%:/&^$+!#+/,##*=.&,,*.,$$*#+/%}&,#/+^};;/_}=//!^_&}=%,;!:.#&$;!:+}_*,+/.^$%!=/:;!:#*^.;%:_#^!%%,%!/.^%._:/#$},^%/./%^_;/}$#^=!!.%%/_:;%$:^#=}./%%_+/^$#:/=#;}%!_}//$,^;!##}*}_!/%$;^^=;;:%%}%/!$%^/!%;;*_:#&=$!^^%};^*;::/;#}^*=%.^+;:;&:##^!=!;%*/:#^##:+#}};#*%:+&^#.+:=!_;*!:%&/$%+;}_,#%!}%&%#/+^}_,:!#.}+!=++/}^,;!:.#&!#!+%*#,^!..:%$_}+!}%,/%&.;%:_#+!}!,/!/.^&$_:/#$},!!%./%^_;+/$#^}!!.&%/_^/;$_^#=}.!!#_./^$;^:*%&},+_.=%$}^;=:;#*}}$/%$+^^=;;:*#:}+%*/^/=;;;*_:#&}$!^;%:;^*_::&##}^*=%;^*^:;;}##+}=!;&*/:^&;#:_!}};!*%:/&^#;+:}#_.*!:/&/#;+;}_,#!}#_&%#++^}:,:!#.}&!##+/}^,;!_.#%}#!+%}/,^!;.:%$_}+!}%:^!_.;%:_#^/.=#=!$/#%#_:/#$};%//./%^_;/_$#^}!!.%+#_^/.$:^#=}.!%%_/;*$;^:=#.!%!_&//$^,%=:;#*}_*/%$/^^=_;:*#:}/!$:^/=^;;!/_%&}$!^%!$/,,}:}}#*}/:=^;/*^:;/&;*_&=$;%*/:^&;#:_#=*;!*%://=;:_!,:;%*!:%&/#}*}+%,#..:!&%#/+^};,:,#$};$#%+/}^,;!:.#*}==&#=!,^!;.:/.+/;,#*%=+_,#$^=%%!,,.:%+.^%;_:+}%!,!!+./%}_;/:$#^}&=.%%,_^/_$:^$=}.^//_//.$;,*=#;=%!_%//$::%=:;#*}_,/%$+^^!:##*#_*/!$:^/=^;;*:}_&}$&^%=,;^*.::&#=.^!=+;/*;:;&:##,!!^;%*,:^&=#:+#}}.%&_:/&:#;+$}#,}*!_/&/#^+$}:;&!}:!&%#/+^};;!!#.}&!#%+/=;,;!::&%}#,+%}/,^!#.:%##&+!==,/!,.;%:!^/}}.,%!;.^%;_:+}}%,!!#./%,_;/:$#;}!!.%%}_^+%$:^}=}_!%%_/+*$;^:=#.%%!_%//$^,+=:./*}_!/%$/^^=;.;*#_^/!$%^/=^;;*:_,&}$}^%=^;^&;::&#$.^!=$;/*_:;&:##+}=_;%*^:^&:#:+#}};!*$://*#;+$}#.}*!:%&=#^^&}:;%!}:!&%#/^!};,#!#:!&!#%+/}^,#!::+%}#:+%}/,^!;:&%##*+!}/,/%^.;%:_=/}}.,%!:.^%##+/#}&,!!=./%,_;+#*}^}!+.%%#_^/;$:^#/$.!%,_//,$;^}=#;}/__%/;$^^:=:;#*}_!/#$/^^=;;_*#:}/!$/^+=^;;*::#&}$!^%=/;^*;::&#$+^!=%;/*^_/&:##+}=*;%*/:^&;#:+#}};!*%:/&^#;+:}#,}*!:%&/#^+;}:,#!}:!&%#/+.};,:!#.}&!#%+/}^,;!:.#%}#!+%}/,^!;.#%#_}+!}%,/!^.;%:_$/}}!,%!^.^%;_:/$$},!!%./%^_;/:$#%:!+.%%/_^+};:#*!+&}&=_//^$;,#*%;}%%_%/+$^^;=:.}&/_!/+$/^,=;;:*##!;%$%^;=^;:*::#&}$^.;=/;_*;::&##=^!=^;/*^=#&:##+}=%;%*/:^&;*}+#}};!*%:/&^#;+:/!,}*!:%&,#^+;}:,#^%:!&%#/+,};,:!#.}^_#%+;}^,:!:.$%}#^+:}/,^!;_&%#_=+!}&,/!:$%%:_#/}=.,%!+.^%}__/#$},!*!./%,_;/_$#,%&:.%%/_^+^$:^$=}./+#_//^$;;&=#;=%!_;/+$^^.=:.$*}_*/%$/^^=##/*#:}/!}&^/=,;;*}}^&}$!^%!$;^*.::&#=*^!=^;/*;:;&$##+}*&;%*.:^&_#:+}}};^*::/&:#;,&}#,=*!:,&/#:.%}:,#!}_.&%#++^};.$!#:%&!#/+/}.,;!:_=%}#++%},,^!:.:&%_=+!}^,/%!.;%__#+&}!,^&}.^%;_:^^$},*!%./%;_;/}$#^}!!.%%/_^;+$:,!=}.*%%_//^$;.+=#.%%!_///$^^;=:.^*}_!/%$+^^=;;:/!:}/!$%/}=#;;*::#+,$;&!+;#;_!.//%#}^!=%.$$,!}&},#:}*=;%*/:^&;#:+#%.#!,%:_&^#;+:$:&=,;:$_$*/+#/:.%!}:!&%_:*+/_;._&}:&/+}.^;_*_/^;:_,:;!}^.:%$:=;/&,:_!=,,/!^.;&/,%_+$}%&+=;:;$==&;&.::#$=:&^+.$+=&/:^!:=$#_:/;$:^#+=!!;+!!,+$;^:=#;}%!_%;**^#+=:;#*}_!/%./_:&;*;%/:}/!$%^!::}.=#&$^;_*$#=/$#*;::&#&+_;%=:%*#+:#^&$=,+$}:*;#;/*#&%}_%*^:!*+,}!%^:}$^&}!/;#;/+,^%%:+*:+&};,&=%^}#:+*$,/+#&&}_/}_^/$;/#}*^#}_^,#&/:$!&}_#&,:$}/+$$*/+=:^+}/^!.;%^_#=&,,}#,.!_;#=$&/_;%$_;+!#&/$_;$:^$=}.!%%*+&!$}^:=#;}:=:$#^$+.#$=__*}_!/%$/^^=;::+#:=/!$%^/=^;;*:=/,};_./=_;^*;::/.;!#;=&%_^$:}#;$%+}=!;%%;%}&$;/_%+#^:*#:/&^#;^#:;$&!=+,.*#;=;&^^;!=:!&%#/+^};,:/=$}_}##+/}^,;!=/;.+#!=,/%,;:/$$%%*:+/}%,/!^=:^_$!/$..,%!/.^%;_:/#}^_!.!.;%^_;/:}.*#^*.%+^_#/;$:^#;=*}%*;^#,.:+/==;}%!_%/}.;#.+:.;*}_!/%=*=#%=^.$,!&%/,}.:#;*=/%.^/&$!^%=/:!#^!!/&,+^/=;;/*^:;*/,/:&!#!}%%;#&}#:+#}}}%%$^_.=$#%}:/;%*!:%&/%,;;=#+}^::*&%#/+^/,$^*%.}&!#%_#&^_!*,..*!/}+;}/,^!;/&=!//^^$_:*^%..%:_#/}+!,^!..^%;_:^%;}#+!./%.._;/:$#,!/_.%%/_^/#$:^#=}:%/:_//^$;,==#;}%!_%//$^^;=:;#*}_!/%$/^^=;;_*#:}/!$%^/!;;;*::$&}}_^%=/;^%:::&##=^!*%;/*^:;^!##+}=*;%*$:^&.#:^%}};//#:/&^#;^&}#,=*!:^^}#^+;}:;^!}:*&%#/^!};,:!#.=&!#%+/};#&!:.$%}#&+%}/,^*:$&%#_=+!}#,/!^.;%:=./}}*,%!/.^%;_:+}=/,!!/./%__;/:$#,!/_.%%,_^/.$:^#=}.!,&_//:$;^_=#;}%!_%//$^^$=:;=*}_!/%}^^^=;.!*##*/!$%^/=^;;*:_*&}$%^%=^;^*}::&#$%^!/};/*,:;&=##^%%:;%*/:^./#:+$}};!+#:/&_#;+$}#,}*!_//;#^+}}:.;!}:!&%$^+^};;*!#:;&!#%+/=;,;!::/%}$}+%}/,^*:.:%##,+!==,/!^.;&#_#/}}:,%!$.^%;_:/#$},!!../&!_;/#$#^}!!.%%:_^/}$:,&=}.!%%_//_$;^#=#.!%!_;//$^^#=:};*}_*/%$.^^=##/*#:}/!%}^/=,;;*:=^&}$+^%=,;^*;::/}}%^!=;;/&%:;&:##,!=!;%*_:^/%#:+#}}.%*%:/&}#;,_}#,}*!_/&/#^^*}:;.!}:!&%$^+^};;/!#:^&!#%+/}^,;!::&%}#:+%}^,^!;.:%##/+!};,/!$.;%:_#/}}+,%!^.^%:_:+%$},!!^./;%_;/_$#,&!!.^+}_^/;$:#;=}.*%%_/.!$;^==#.*%!_%//$;_&=:.%*}_!/%$/^^=;:,*#_&/!$/^/=;;;%!#}&}$+^%/=;^*.::&##}^/%#;/*^:;.+##+==!;%+}:^&$#:+=}};!*%_^;;#;^!}#;!*!:%&/$;+;}:;&!}_:&%#/+^=:,:!#:^&!}++/}^,;!:.#%}#,+%}_,^*!.:&%_}+!}.,/&}.;%__#/}}!,^&}.^%;_:;/$},*!%.;^!_;/:$#:_!!.&%/#;;:$:,&=}.:%%_//^}:;!=#.^%!$*//$^^;!#:%*}_./%=^^^=;;:%}#//!$#^/!+;;*::#&}$$^%=_;^%%::&}#}^!&*;/*#:;/!##^+=!;;/;:^&}#:.$}};**%:+&^##./}#,}*!}&&/#,+;=#_}!}:^&%$++^};,:!#__&!#,+/};,;!#.#&/}!+%};,^^/.:%$_}++}%,;/!.;%:_#::}!,&!/.^,%_:+*$},&!%./%^#:+}$#,/!!./%/_^/;}#^#=}.,%%_}/^$;^:!};}%!_://}#^;=:;#&!_!/%$$^^=.;:*#:}+%$%^/!!;;%}:#&}$!^%=/;^*=::/^#}^%=%;/*^:;/!##^/=!;.*/:^&;#:^*}};%*%:^&^#}+:}#;%*!=}&/#,+;}=,#*%$:&%#/+^//,:!$.}&!!#+/}_,;!$.#%}#!^/%!,^!}.:%}_}+!}%;^!^.;&*_#+;}!,%!/:;%;_:+/$},,!%./%^#:/:$#,,!!:_%/_^/;}#^#=}.:%%#%/^$;^:=#;}%!_.//}!^;=#;#*}_!/%$:^^=};:%&:}/!$%^/=_;;*#:#/!$!^%=/;^*#::/*#}^!=%;;*^:;&:##_:=!;&*/:^&:#:^!}};!*%:/&^#;.,}#;%*!:&&/#^+;=!_!!}:/&%%&+^}.,:!$.}&/=#+/}^,;^..#%=#!+^*},^!;.:.&_}+*}%://^.;%=_#^+}!;%!/:;^*_:+*$},#!%./%^_;+/$#^}!!.&%/_^/;}#:}=}.+%%$;/^$;^:!%#/%!_;//$;^;=_;#*=_!/%%;^^=;;:*}:}/!$%^/&*;;*=:#/!$!^&=/;:+%::&##}#%=%;+*^_:,###^&=!.+*/:^&;$#^%}};^*%_#&^#;+:!#,}*!:;&/##+;}},#%!:!&%##+^=%,:!#.}/%#%+/}=,;*+.#%}#!^/}/,^*%.:&}_}+!}%;^!^.;&+_#+*}!,%!/.^%;_:+/$},_!%.^%^_;/:$#,/!!.:%/_^/;$:^#=}.+%%_//^$:^:=#;}%!_,//$,^;=_;#*}_:/%$/^^=.;:*#:}");local t=(0x138-202)local o=2 local d=n;local e={}e={[(34-0x21)]=function()local e,n,l,r=p(A,d,d+B);d=d+P;o=(o+(t*P))%a;return(((r+o-(t)+x*(P*_))%x)*((_*J)^_))+(((l+o-(t*_)+x*(_^B))%a)*(x*a))+(((n+o-(t*B)+J)%a)*x)+((e+o-(t*P)+J)%a);end,[(0x19c/206)]=function(e,e,e)local e=p(A,d,d);d=d+r;o=(o+(t))%a;return((e+o-(t)+J)%x);end,[(12/0x4)]=function()local e,l=p(A,d,d+_);o=(o+(t*_))%a;d=d+_;return(((l+o-(t)+x*(_*P))%x)*a)+((e+o-(t*_)+a*(_^B))%x);end,[((146328/0xb6)/0xc9)]=function(o,e,l)if l then local e=(o/_^(e-n))%_^((l-r)-(e-n)+r);return e-e%n;else local e=_^(e-r);return(o%(e+e)>=e)and n or g;end;end,[(0x429/213)]=function()local l=e[(207/0xcf)]();local o=e[(0x4b/(200-0x7d))]();local c=n;local d=(e[(0x48-68)](o,r,y+P)*(_^(y*_)))+l;local l=e[(0x21-29)](o,21,31);local e=((-n)^e[(54-0x32)](o,32));if(l==g)then if(d==j)then return e*g;else l=r;c=j;end;elseif(l==(x*(_^B))-r)then return(d==g)and(e*(r/j))or(e*(g/j));end;return E(e,l-((a*(P))-n))*(c+(d/(_^W)));end,[(0x63-93)]=function(l,_,_)local _;if(not l)then l=e[(-0x36+55)]();if(l==g)then return'';end;end;_=G(A,d,d+l-n);d=d+l;local e=''for l=r,#_ do e=K(e,Y((p(G(_,l,l))+o)%a))o=(o+t)%x end return e;end}local function J(...)return{...},V('#',...)end local function A()local w={};local d={};local l={};local h={w,d,nil,l};local o={}local O=(-0x5d+182)local l={[(0x16-20)]=(function(l)return not(#l==e[(81-0x4f)]())end),[(50-(138-0x59))]=(function(l)return e[(0x3a2/(0x74fa/161))]()end),[(0x0/177)]=(function(l)return e[(-47+0x35)]()end),[(115-0x6f)]=(function(l)local o=e[(84-0x4e)]()local l=''local e=1 for d=1,#o do e=(e+O)%a l=K(l,Y((p(o:sub(d,d))+e)%x))end return l end)};h[3]=e[(436/0xda)]();for e=r,e[(33/0x21)]()do d[e-r]=A();end;local d=e[(0x35+(-9-0x2b))]()for d=1,d do local e=e[(0x17e/191)]();local n;local e=l[e%(145-0x63)];o[d]=e and e({});end;for a=1,e[(238/(36890/0x9b))]()do local l=e[(0x74-114)]();if(e[(0x20-28)](l,n,r)==j)then local x=e[(0x6f+-107)](l,_,B);local d=e[(952/(558-0x140))](l,P,_+P);local l={e[(132-0x81)](),e[(29+-0x1a)](),nil,nil};local i={[(0x0/(0xb2+-24))]=function()l[i]=e[((-0x43+-38)+0x6c)]();l[L]=e[(-101+0x68)]();end,[(0x94/148)]=function()l[b]=e[(101+-0x64)]();end,[(0x67-101)]=function()l[u]=e[((122+-0x23)/0x57)]()-(_^y)end,[(109-0x6a)]=function()l[c]=e[(91+-0x5a)]()-(_^y)l[C]=e[(0x4c+(-9563/0x83))]();end};i[x]();if(e[(0x65-97)](d,r,n)==r)then l[U]=o[l[k]]end if(e[(320/0x50)](d,_,_)==n)then l[c]=o[l[c]]end if(e[(0x5d-89)](d,B,B)==r)then l[m]=o[l[L]]end w[a]=l;end end;return h;end;local function g(e,P,t)local a=e[_];local o=e[B];local e=e[n];return(function(...)local j={};local x=e;local d={};local A=V('#',...)-r;local y=a;local a=o;local o=n;local Y={};local p=J local J={...};local e=n e*=-1 local B=e;for e=0,A do if(e>=a)then Y[e-a]=J[e+r];else d[e]=J[e+n];end;end;local e=A-a+n local e;local a;while true do e=x[o];a=e[(0xd8/216)];l=(12373508)while a<=(0x7c-82)do l-= l l=(1385139)while(0xbb8/150)>=a do l-= l l=(7766010)while(0x29+(-6176/0xc1))>=a do l-= l l=(1322915)while(44-0x28)>=a do l-= l l=(5588569)while((0x169-225)/0x88)>=a do l-= l l=(11681365)while a>(0x73+-115)do l-= l if(d[e[k]]~=d[e[m]])then o=o+r;else o=e[u];end;break end while 4049==(l)/((-0x10+2901))do local e=e[O]d[e](d[e+r])break end;break;end while 2779==(l)/((4108-(0x8ae+-125)))do l=(75951)while a<=(134/0x43)do l-= l d[e[k]]=(e[c]~=0);o=o+r;break;end while 97==(l)/((0xd61a/70))do l=(8043924)while(100-0x61)<a do l-= l local D;local a;local u;local l;d[e[h]]=t[e[c]];o=o+n;e=x[o];d[e[k]]=d[e[b]][e[s]];o=o+n;e=x[o];l=e[f];u=d[e[b]];d[l+1]=u;d[l]=u[e[v]];o=o+n;e=x[o];d[e[h]]=d[e[i]];o=o+n;e=x[o];d[e[O]]=d[e[i]];o=o+n;e=x[o];l=e[U]d[l]=d[l](M(d,l+n,e[i]))o=o+n;e=x[o];l=e[w];u=d[e[c]];d[l+1]=u;d[l]=u[e[s]];o=o+n;e=x[o];l=e[f]d[l]=d[l](d[l+r])o=o+n;e=x[o];a={d,e};a[r][a[_][U]]=a[n][a[_][m]]+a[r][a[_][N]];o=o+n;e=x[o];d[e[h]]=d[e[b]]%e[L];o=o+n;e=x[o];l=e[O]d[l]=d[l](d[l+r])o=o+n;e=x[o];u=e[i];D=d[u]for e=u+1,e[s]do D=D..d[e];end;d[e[f]]=D;o=o+n;e=x[o];a={d,e};a[r][a[_][O]]=a[n][a[_][s]]+a[r][a[_][N]];o=o+n;e=x[o];d[e[w]]=d[e[b]]%e[s];break end while 2924==(l)/((-0x4e+(0x1633-2854)))do d[e[f]]=g(y[e[D]],nil,t);break end;break;end break;end break;end while(l)/((0x641-864))==1795 do l=(588336)while(0x6f-105)>=a do l-= l l=(111630)while a>(0x1a4/84)do l-= l local a;local c,_;local r;local l;d[e[U]]=t[e[D]];o=o+n;e=x[o];l=e[w];r=d[e[u]];d[l+1]=r;d[l]=r[e[v]];o=o+n;e=x[o];d[e[U]]=t[e[N]];o=o+n;e=x[o];d[e[h]]=e[u];o=o+n;e=x[o];d[e[w]]=e[N];o=o+n;e=x[o];d[e[U]]=e[D];o=o+n;e=x[o];l=e[U]d[l]=d[l](M(d,l+n,e[b]))o=o+n;e=x[o];l=e[w]c,_=p(d[l](M(d,l+1,e[N])))B=_+l-1 a=0;for e=l,B do a=a+n;d[e]=c[a];end;o=o+n;e=x[o];l=e[f]d[l]=d[l](M(d,l+n,B))o=o+n;e=x[o];d[e[h]]();break end while(l)/((-26+0x3ad))==122 do local l=d[e[L]];if not l then o=o+r;else d[e[f]]=l;o=e[b];end;break end;break;end while 476==(l)/((16068/0xd))do l=(14273445)while a<=(59-0x34)do l-= l d[e[O]]={};break;end while 3693==(l)/((0xf57+-62))do l=(2124500)while a>((-95+-0x3)+106)do l-= l local l=e[f]d[l]=d[l](M(d,l+n,e[N]))break end while 2428==(l)/((891+-0x10))do if(d[e[k]]==d[e[L]])then o=o+r;else o=e[b];end;break end;break;end break;end break;end break;end while 3522==(l)/((0x117b-2270))do l=(3612843)while(0xaf0/200)>=a do l-= l l=(10067400)while a<=((80520/0xb7)/0x28)do l-= l l=(624726)while(0x2c6/71)<a do l-= l local l=e[O];local a=d[l+2];local n=d[l]+a;d[l]=n;if(a>0)then if(n<=d[l+1])then o=e[u];d[l+3]=n;end elseif(n>=d[l+1])then o=e[N];d[l+3]=n;end break end while(l)/((0xc2d-1608))==414 do do return end;break end;break;end while(l)/((3612+-0x57))==2856 do l=(189230)while(0x750/156)>=a do l-= l d[e[w]]=P[e[D]];o=o+n;e=x[o];d[e[k]]=#d[e[b]];o=o+n;e=x[o];P[e[u]]=d[e[k]];o=o+n;e=x[o];d[e[U]]=P[e[D]];o=o+n;e=x[o];d[e[h]]=#d[e[b]];o=o+n;e=x[o];P[e[D]]=d[e[U]];o=o+n;e=x[o];do return end;break;end while(l)/((-18+0x28d))==298 do l=(610236)while a>(2639/0xcb)do l-= l if(d[e[U]]==e[m])then o=o+r;else o=e[c];end;break end while(l)/((0x25d-329))==2211 do local l=e[w]d[l]=d[l](M(d,l+n,e[b]))break end;break;end break;end break;end while 1053==(l)/((6899-0xd8c))do l=(2811081)while a<=(561/0x21)do l-= l l=(702834)while(0x6e-95)>=a do l-= l P[e[b]]=d[e[h]];break;end while 463==(l)/((-0x64+1618))do l=(3371984)while a>((0x22e0/93)-0x50)do l-= l local l=e[O];local n=d[l]local a=d[l+2];if(a>0)then if(n>d[l+1])then o=e[b];else d[l+3]=n;end elseif(n<d[l+1])then o=e[c];else d[l+3]=n;end break end while(l)/((541926/0xc6))==1232 do d[e[O]]();break end;break;end break;end while(l)/((2005+-0x5e))==1471 do l=(5069582)while a<=(2160/0x78)do l-= l d[e[h]]=d[e[c]][e[v]];break;end while(l)/((2897-0x5d0))==3598 do l=(7408710)while a>(0x4c+-57)do l-= l local a;local l;d[e[f]]=t[e[i]];o=o+n;e=x[o];d[e[U]]=t[e[c]];o=o+n;e=x[o];d[e[w]]=e[b];o=o+n;e=x[o];d[e[w]]=e[D];o=o+n;e=x[o];d[e[w]]=e[c];o=o+n;e=x[o];l=e[h]d[l]=d[l](M(d,l+n,e[c]))o=o+n;e=x[o];d[e[w]]=d[e[D]][d[e[C]]];o=o+n;e=x[o];l=e[O]d[l]=d[l](d[l+r])o=o+n;e=x[o];a=d[e[v]];if not a then o=o+r;else d[e[w]]=a;o=e[c];end;break end while(l)/((-80+0xfb9))==1878 do local e={d,e};e[r][e[_][k]]=e[n][e[_][S]]+e[r][e[_][D]];break end;break;end break;end break;end break;end break;end while 497==(l)/((0x1626-2883))do l=(2763200)while a<=(7905/0xff)do l-= l l=(121666)while(161-0x88)>=a do l-= l l=(1155264)while(1144/0x34)>=a do l-= l l=(1933424)while a>(0x849/101)do l-= l d[e[O]]=e[c];break end while 596==(l)/((535260/0xa5))do P[e[D]]=d[e[U]];break end;break;end while 547==(l)/((-126+0x8be))do l=(212577)while(-23+0x2e)>=a do l-= l d[e[k]]=d[e[i]]%e[v];break;end while 177==(l)/((-0x41+1266))do l=(498800)while(0x1080/(-0x4b+251))<a do l-= l d[e[w]]=d[e[i]][d[e[m]]];break end while 430==(l)/((2438-0x4fe))do d[e[w]]=e[c];break end;break;end break;end break;end while 958==(l)/((-0x48+199))do l=(184334)while a<=(182-(383-0xe5))do l-= l l=(1249250)while a<=(2938/0x71)do l-= l d[e[f]]=#d[e[b]];break;end while 2375==(l)/((-0x40+590))do l=(11582406)while(-0x33+78)<a do l-= l local l=e[h]local o,e=p(d[l](M(d,l+1,e[i])))B=e+l-1 local e=0;for l=l,B do e=e+n;d[l]=o[e];end;break end while 3366==(l)/((0x96603/179))do d[e[h]]=#d[e[i]];break end;break;end break;end while(l)/((57293/(0x1282/206)))==74 do l=(6154412)while a<=(2900/0x64)do l-= l local e=e[k]d[e]=d[e](d[e+r])break;end while 2293==(l)/((5449-0xacd))do l=(3790608)while a>(185-0x9b)do l-= l local o=e[N];local l=d[o]for e=o+1,e[m]do l=l..d[e];end;d[e[k]]=l;break end while 942==(l)/((0x1fdb-(714663/0xad)))do if(d[e[k]]==e[C])then o=o+r;else o=e[u];end;break end;break;end break;end break;end break;end while(l)/((3239-0x667))==1727 do l=(3077624)while a<=(648/0x12)do l-= l l=(967079)while(0x12f3/147)>=a do l-= l l=(2666973)while(74+-0x2a)<a do l-= l if(d[e[w]]~=d[e[C]])then o=o+r;else o=e[N];end;break end while(l)/((2091+-0x72))==1349 do local l=d[e[C]];if not l then o=o+r;else d[e[k]]=l;o=e[c];end;break end;break;end while(l)/((676124/0xf4))==349 do l=(905625)while(1768/0x34)>=a do l-= l if d[e[k]]then o=o+n;else o=e[u];end;break;end while(l)/((0x16cc-2961))==315 do l=(537999)while(0x222e/250)<a do l-= l local e=e[h]d[e]=d[e](d[e+r])break end while 3927==(l)/((23290/(400-0xe6)))do d[e[k]]=d[e[u]]-d[e[C]];break end;break;end break;end break;end while(l)/((0xd73+-31))==902 do l=(57597)while((0x6a0f5/47)/0xed)>=a do l-= l l=(3320763)while a<=(-114+0x97)do l-= l t[e[D]]=d[e[f]];break;end while 1173==(l)/((0x168d-2942))do l=(8732)while(3724/0x62)<a do l-= l d[e[O]]={};break end while 59==(l)/((237+-0x59))do d[e[h]]();break end;break;end break;end while(l)/((187-0x72))==789 do l=(3283830)while a<=((-0x5-15)+60)do l-= l t[e[i]]=d[e[w]];o=o+n;e=x[o];d[e[f]]={};o=o+n;e=x[o];d[e[k]]={};o=o+n;e=x[o];t[e[u]]=d[e[f]];o=o+n;e=x[o];d[e[O]]=t[e[b]];o=o+n;e=x[o];if(d[e[O]]==e[C])then o=o+r;else o=e[i];end;break;end while 1177==(l)/((-0x13+2809))do l=(15293217)while a>(0x9ee/62)do l-= l local a;local l;d[e[h]]=t[e[D]];o=o+n;e=x[o];d[e[h]]=t[e[c]];o=o+n;e=x[o];d[e[k]]=e[D];o=o+n;e=x[o];d[e[k]]=e[c];o=o+n;e=x[o];d[e[h]]=e[N];o=o+n;e=x[o];l=e[U]d[l]=d[l](M(d,l+n,e[u]))o=o+n;e=x[o];d[e[O]]=d[e[c]][d[e[v]]];o=o+n;e=x[o];l=e[f]d[l]=d[l](d[l+r])o=o+n;e=x[o];a=d[e[S]];if not a then o=o+r;else d[e[U]]=a;o=e[N];end;break end while(l)/((0x649f8/104))==3859 do local r;local a;local l;d[e[w]]=e[N];o=o+n;e=x[o];d[e[f]]=e[b];o=o+n;e=x[o];d[e[w]]=#d[e[i]];o=o+n;e=x[o];d[e[U]]=e[u];o=o+n;e=x[o];l=e[O];a=d[l]r=d[l+2];if(r>0)then if(a>d[l+1])then o=e[i];else d[l+3]=a;end elseif(a<d[l+1])then o=e[u];else d[l+3]=a;end break end;break;end break;end break;end break;end break;end break;end while(l)/((-30+0xe90))==3346 do l=(1249950)while(0x98+-88)>=a do l-= l l=(2534004)while(0x6c+-55)>=a do l-= l l=(6988092)while(9165/0xc3)>=a do l-= l l=(2066928)while a<=(0x318/18)do l-= l l=(7918535)while((16068/0x4e)-0xa3)<a do l-= l local e={d,e};e[r][e[_][w]]=e[n][e[_][S]]+e[r][e[_][D]];break end while(l)/((0x101d-(4302-0x8a2)))==3895 do do return d[e[U]]end break end;break;end while(l)/(((466151-0x38e9b)/92))==816 do l=(4917374)while(-44+0x59)>=a do l-= l local o=e[h];local l=d[e[c]];d[o+1]=l;d[o]=l[e[s]];break;end while 2849==(l)/((3479-0x6d9))do l=(621576)while a>(0x88+-90)do l-= l d[e[w]]=P[e[c]];break end while(l)/((0x1e81c/234))==1164 do local l=e[w];local n=d[l]local a=d[l+2];if(a>0)then if(n>d[l+1])then o=e[b];else d[l+3]=n;end elseif(n<d[l+1])then o=e[u];else d[l+3]=n;end break end;break;end break;end break;end while 2643==(l)/((2672+-0x1c))do l=(2689128)while(0xde-172)>=a do l-= l l=(1939065)while a<=(0x82-82)do l-= l local o=e[u];local l=d[o]for e=o+1,e[S]do l=l..d[e];end;d[e[f]]=l;break;end while 503==(l)/((3901+-0x2e))do l=(7111728)while a>(0x1386/102)do l-= l if(d[e[O]]==d[e[S]])then o=o+r;else o=e[c];end;break end while(l)/((0x41c28/129))==3406 do local e=e[O]d[e]=d[e](M(d,e+n,B))break end;break;end break;end while 2873==(l)/((1994-(0x497+-117)))do l=(4720576)while(0x10bc/84)>=a do l-= l d[e[w]]=d[e[b]][e[C]];break;end while(l)/((71960/0x28))==2624 do l=(1916235)while(0x8c-88)<a do l-= l if d[e[h]]then o=o+n;else o=e[b];end;break end while 1317==(l)/((0xbcd-1566))do if not d[e[O]]then o=o+r;else o=e[u];end;break end;break;end break;end break;end break;end while 1422==(l)/((3582-0x708))do l=(3320478)while(-0x5a+148)>=a do l-= l l=(9676041)while(0xb5-126)>=a do l-= l l=(961170)while((25213-0x3157)/0xe9)<a do l-= l local e={d,e};e[n][e[_][k]]=e[_][C]+e[_][u];break end while(l)/((-0x6a+796))==1393 do local a=y[e[b]];local n;local l={};n=Q({},{__index=function(o,e)local e=l[e];return e[1][e[2]];end,__newindex=function(d,e,o)local e=l[e]e[1][e[2]]=o;end;});for n=1,e[S]do o=o+r;local e=x[o];if e[(137/0x89)]==84 then l[n-1]={d,e[b]};else l[n-1]={P,e[D]};end;j[#j+1]=l;end;d[e[h]]=g(a,n,t);break end;break;end while(l)/((-50+(4145+-0x76)))==2433 do l=(7184360)while(-88+0x90)>=a do l-= l d[e[O]]=P[e[b]];break;end while 3065==(l)/((-0x2b+2387))do l=(6282080)while(191-0x86)<a do l-= l o=e[c];break end while 2485==(l)/((5102-0xa0e))do t[e[i]]=d[e[O]];break end;break;end break;end break;end while(l)/((5625-0xb23))==1197 do l=(5741488)while(179+-0x76)>=a do l-= l l=(8053642)while(0x28cb/177)>=a do l-= l local e=e[k]d[e](d[e+r])break;end while 2531==(l)/((117734/0x25))do l=(11968)while((375-0xd7)+-0x64)<a do l-= l d[e[h]]=(e[b]~=0);break end while(l)/((3168/0x48))==272 do local l;d[e[w]]=t[e[D]];o=o+n;e=x[o];d[e[w]]=t[e[D]];o=o+n;e=x[o];d[e[f]]=e[i];o=o+n;e=x[o];d[e[f]]=e[N];o=o+n;e=x[o];d[e[w]]=e[D];o=o+n;e=x[o];l=e[f]d[l]=d[l](M(d,l+n,e[i]))o=o+n;e=x[o];d[e[h]]=d[e[c]][d[e[C]]];o=o+n;e=x[o];l=e[U]d[l]=d[l](d[l+r])o=o+n;e=x[o];d[e[h]]=d[e[i]];o=o+n;e=x[o];o=e[u];break end;break;end break;end while 1567==(l)/((0xec8+-120))do l=(2155179)while((0x82f5/225)-0x57)>=a do l-= l if not d[e[O]]then o=o+r;else o=e[i];end;break;end while(l)/((0x3d4+-31))==2271 do l=(2134484)while a>((0x4-39)+0x62)do l-= l local e={d,e};e[n][e[_][U]]=e[_][s]+e[_][c];break end while(l)/((0x56fa1/233))==1396 do d[e[f]]=d[e[i]][d[e[C]]];break end;break;end break;end break;end break;end break;end while(l)/((77350/0x77))==1923 do l=(736074)while a<=(-28+0x67)do l-= l l=(10912604)while(-49+(0xd4+-94))>=a do l-= l l=(8118180)while a<=(5082/0x4d)do l-= l l=(3156888)while a>(0x79e/30)do l-= l d[e[f]]=t[e[i]];break end while 1032==(l)/((6174-(0x18c3-3224)))do local o=e[f];local l=d[e[c]];d[o+1]=l;d[o]=l[e[L]];break end;break;end while(l)/((7246-0xe5c))==2274 do l=(8227560)while a<=(9514/0x8e)do l-= l local a=y[e[i]];local n;local l={};n=Q({},{__index=function(o,e)local e=l[e];return e[1][e[2]];end,__newindex=function(d,e,o)local e=l[e]e[1][e[2]]=o;end;});for n=1,e[S]do o=o+r;local e=x[o];if e[(-0x48+73)]==84 then l[n-1]={d,e[D]};else l[n-1]={P,e[u]};end;j[#j+1]=l;end;d[e[h]]=g(a,n,t);break;end while(l)/((3911+-0x74))==2168 do l=(9740247)while(253-0xb9)<a do l-= l local l=e[f];local a=d[l+2];local n=d[l]+a;d[l]=n;if(a>0)then if(n<=d[l+1])then o=e[i];d[l+3]=n;end elseif(n>=d[l+1])then o=e[D];d[l+3]=n;end break end while 3443==(l)/(((42915930/0xcd)/74))do d[e[U]]=(e[c]~=0);o=o+r;break end;break;end break;end break;end while(l)/((450344/0xa4))==3974 do l=(6492800)while(0x43c8/241)>=a do l-= l l=(4339998)while a<=((0x166+-100)-188)do l-= l o=e[b];break;end while 1326==(l)/((-16+0xcd9))do l=(359973)while a>(-0x73+186)do l-= l d[e[h]]=d[e[c]]%e[v];break end while(l)/((0x201-306))==1739 do d[e[U]]=t[e[c]];break end;break;end break;end while 2029==(l)/((0x87280/173))do l=(11840202)while((0x10fb-2230)/0x1d)>=a do l-= l d[e[O]][d[e[c]]]=d[e[S]];break;end while 3069==(l)/((308640/0x50))do l=(2622573)while a>(168+-0x5e)do l-= l d[e[U]]=g(y[e[b]],nil,t);break end while(l)/((0x1b57c/108))==2529 do d[e[O]]=d[e[b]];break end;break;end break;end break;end break;end while 951==(l)/((1643-0x365))do l=(472842)while(4960/(0x80+-66))>=a do l-= l l=(1572896)while(0x107-186)>=a do l-= l l=(2008272)while a>(94+(73-0x5b))do l-= l local a;local l;d[e[U]]=t[e[i]];o=o+n;e=x[o];d[e[O]]=t[e[i]];o=o+n;e=x[o];d[e[h]]=e[i];o=o+n;e=x[o];d[e[f]]=e[N];o=o+n;e=x[o];d[e[k]]=e[c];o=o+n;e=x[o];l=e[w]d[l]=d[l](M(d,l+n,e[u]))o=o+n;e=x[o];d[e[k]]=d[e[u]][d[e[S]]];o=o+n;e=x[o];l=e[k]d[l]=d[l](d[l+r])o=o+n;e=x[o];a=d[e[m]];if not a then o=o+r;else d[e[h]]=a;o=e[i];end;break end while(l)/((3388-0x6b8))==1204 do do return end;break end;break;end while 1976==(l)/((-49+0x34d))do l=(3771625)while(0x4182/215)>=a do l-= l local l=e[U]local o,e=p(d[l](M(d,l+1,e[i])))B=e+l-1 local e=0;for l=l,B do e=e+n;d[l]=o[e];end;break;end while 1375==(l)/((-0x19+2768))do l=(6786790)while a>(0x67b/21)do l-= l local e=e[f]d[e]=d[e](M(d,e+n,B))break end while 1730==(l)/((-87+0xfaa))do d[e[f]][d[e[b]]]=d[e[C]];break end;break;end break;end break;end while(l)/((0x85f95/253))==218 do l=(1813215)while a<=(2324/0x1c)do l-= l l=(7083693)while(19278/0xee)>=a do l-= l local a;local l;d[e[h]]=(e[c]~=0);o=o+n;e=x[o];d[e[O]]=d[e[i]];o=o+n;e=x[o];d[e[k]]=t[e[u]];o=o+n;e=x[o];l=e[O]d[l]=d[l](d[l+r])o=o+n;e=x[o];a=d[e[L]];if not a then o=o+r;else d[e[U]]=a;o=e[i];end;break;end while 3321==(l)/(((-130+0xc)+0x8cb))do l=(504810)while a>(0x67+-21)do l-= l d[e[w]]=(e[i]~=0);break end while(l)/((2416-0x4cf))==426 do local l;local a;d[e[k]]=t[e[u]];o=o+n;e=x[o];d[e[O]]=e[b];o=o+n;e=x[o];d[e[w]]=e[b];o=o+n;e=x[o];a=e[D];l=d[a]for e=a+1,e[v]do l=l..d[e];end;d[e[h]]=l;o=o+n;e=x[o];if d[e[h]]then o=o+n;else o=e[D];end;break end;break;end break;end while(l)/((220691/0xc7))==1635 do l=(5417328)while a<=(197-0x71)do l-= l d[e[U]]=d[e[D]];break;end while 1402==(l)/((475272/0x7b))do l=(6009567)while a>(0x76+-33)do l-= l d[e[U]]=d[e[u]]-d[e[s]];break end while 3401==(l)/((3598-0x727))do do return d[e[k]]end break end;break;end break;end break;end break;end break;end break;end o+= r end;end);end;return g(A(),{},T())()end)_msec({[(9548/0x3e)]='\115\116'..(function(e)return(e and'(6900/0x45)')or'\114\105'or'\120\58'end)((59-(0x33ae/245))==(0xf6/41))..'\110g',[(763+-0x20)]='\108\100'..(function(e)return(e and'(0x13a-214)')or'\101\120'or'\119\111'end)((114+-0x6d)==(0x24-30))..'\112',[(-26+0x110)]=(function(e)return(e and'(-0x20+132)')and'\98\121'or'\100\120'end)(((87980/0x53)/0xd4)==(685/(382-0xf5)))..'\116\101',[(0xa90c/124)]='\99'..(function(e)return(e and'((-114+0x178)-162)')and'\90\19\157'or'\104\97'end)((745/0x95)==(101-0x62))..'\114',[((2702400/0x78)/0x28)]='\116\97'..(function(e)return(e and'(290-0xbe)')and'\64\113'or'\98\108'end)((0x4e0/208)==(-99+0x68))..'\101',[((0x33f7b/201)-0x24f)]=(function(e)return(e and'(0x3200/128)')or'\115\117'or'\78\107'end)((112-0x6d)==(0x65+-70))..'\98',[(0x277c6/193)]='\99\111'..(function(e)return(e and'(0x122-190)')and'\110\99'or'\110\105\103\97'end)((177-0x92)==(0xa1-130))..'\97\116',[(0x14f9a/129)]=(function(e,l)return(e and'(-126+0xe2)')and'\48\159\158\188\10'or'\109\97'end)((375/0x4b)==(77+-0x47))..'\116\104',[(2775-0x57e)]=(function(l,e)return((101-0x60)==(141/0x2f)and'\48'..'\195'or l..((not'\20\95\69'and'\90'..'\180'or e)))or'\199\203\95'end),[(89010/0x5a)]='\105\110'..(function(e,l)return(e and'(-127+0xe3)')and'\90\115\138\115\15'or'\115\101'end)((30+(0x0+-25))==((0x6600/192)-0x69))..'\114\116',[(2169-0x45f)]='\117\110'..(function(e,l)return(e and'(24000/0xf0)')or'\112\97'or'\20\38\154'end)((90+(-0x64+15))==((2+-0x29)+0x46))..'\99\107',[(2498-0x51b)]='\115\101'..(function(e)return(e and'(267-0xa7)')and'\110\112\99\104'or'\108\101'end)((-61+0x42)==(122-0x5b))..'\99\116',[(-53+0x541)]='\116\111\110'..(function(e,l)return(e and'(-124+0xe0)')and'\117\109\98'or'\100\97\120\122'end)((55-0x32)==(-68+0x49))..'\101\114'},{[(0xe6-131)]=((getfenv))},((getfenv))()) end)()


   end,
})
    
    local Rag = Fun:CreateSection("Kinds Animations")

    local Button = Fun:CreateButton({
   Name = "RagRoll (R15)",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/shakk-code/fe-ragdoll-script/refs/heads/main/script.lua', true))()
   end,
})

local Button = Fun:CreateButton({
   Name = "RagRoll (R6)",
   Callback = function()
--[[ 📜 AUTHOR: @4zx16 || TOOL-BASED RAGDOLL (R6) ]]--
wait(0.3)
local Player = game.Players:FindFirstChild(script.Parent.Name)

-- Set up mouse and input service (from original)
local Mouse,mouse,UserInputService,ContextActionService
do
    script.Parent = Player.Character
    local CAS = {Actions={}}
    local Event = Instance.new("RemoteEvent")
    Event.Name = "UserInput_Event"
    Event.Parent = Player.Character
    local fakeEvent = function()
        local t = {_fakeEvent=true}
        t.Connect = function(self,f) self.Function=f end
        t.connect = t.Connect
        return t
    end
    local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
    local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
    function CAS:BindAction(name,fun,touch,...) CAS.Actions[name] = {Name=name,Function=fun,Keys={...}} end
    function CAS:UnbindAction(name) CAS.Actions[name] = nil end
    local function te(self,ev,...) local t = m[ev]; if t and t._fakeEvent and t.Function then t.Function(...) end end
    m.TrigEvent = te
    UIS.TrigEvent = te
    Event.OnServerEvent:Connect(function(plr,io)
        if plr~=Player then return end
        if io.isMouse then
            m.Target = io.Target
            m.Hit = io.Hit
        elseif io.UserInputType == Enum.UserInputType.MouseButton1 then
            if io.UserInputState == Enum.UserInputState.Begin then
                m:TrigEvent("Button1Down")
            else
                m:TrigEvent("Button1Up")
            end
        else
            for n,t in pairs(CAS.Actions) do
                for _,k in pairs(t.Keys) do
                    if k==io.KeyCode then t.Function(t.Name,io.UserInputState,io) end
                end
            end
            if io.UserInputState == Enum.UserInputState.Begin then
                m:TrigEvent("KeyDown",io.KeyCode.Name:lower())
                UIS:TrigEvent("InputBegan",io,false)
            else
                m:TrigEvent("KeyUp",io.KeyCode.Name:lower())
                UIS:TrigEvent("InputEnded",io,false)
            end
        end
    end)
    Mouse,mouse,UserInputService,ContextActionService = m,m,UIS,CAS
end

-- Sounds
local sounds = {}
local soundIds = {"260430060","138087186","131237241","278062209","429400881"}
for i,id in ipairs(soundIds) do
    local s = Instance.new("Sound", Player.Character.Torso)
    s.SoundId = "rbxassetid://"..id
    s.Volume = 5
    if i==4 then s.TimePosition = 0.33 end
    sounds[i] = s
end

local using = false
local ragdolling = false

-- Function to handle ragdoll
local function ragdollify()
    if ragdolling then return end
    ragdolling = true

    local light = Instance.new("SpotLight", Player.Character.Torso)
    Player.Character.Humanoid.PlatformStand = true

    -- Clone joints
    local lshclone = Player.Character.Torso["Left Shoulder"]:Clone()
    local rshclone = Player.Character.Torso["Right Shoulder"]:Clone()
    local lhclone = Player.Character.Torso["Left Hip"]:Clone()
    local rhclone = Player.Character.Torso["Right Hip"]:Clone()

    -- Get limbs
    local leftarm = Player.Character["Left Arm"]
    local rightrm = Player.Character["Right Arm"]
    local leftleg = Player.Character["Left Leg"]
    local rightleg = Player.Character["Right Leg"]

    -- Destroy joints
    Player.Character.Torso["Left Hip"]:Destroy()
    Player.Character.Torso["Right Hip"]:Destroy()
    Player.Character.Torso["Left Shoulder"]:Destroy()
    Player.Character.Torso["Right Shoulder"]:Destroy()

    -- Glue limbs (simplified, full original logic can be copied here)
    local function glueLimb(torso, limb, name, x, y, z)
        local glue = Instance.new("Glue", torso)
        glue.Part0 = torso
        glue.Part1 = limb
        glue.Name = name
        local collider = Instance.new("Part", limb)
        collider.Position = Vector3.new(0,9999,0)
        collider.Size = Vector3.new(1.5,1,1)
        collider.Shape = "Cylinder"
        local weld = Instance.new("Weld", collider)
        weld.Part0 = limb
        weld.Part1 = collider
        weld.C0 = CFrame.new(0,-0.2,0) * CFrame.fromEulerAnglesXYZ(0,0,math.pi/2)
        collider.TopSurface = "Smooth"
        collider.BottomSurface = "Smooth"
        collider.FormFactor = "Symmetric"
        glue.C0 = CFrame.new(x,y,z)
        glue.C1 = CFrame.new(0,1,0)
        collider.Transparency = 1
    end

    glueLimb(Player.Character.Torso,leftleg,"Left leg",-0.5,-1,0)
    glueLimb(Player.Character.Torso,rightleg,"Right leg",0.5,-1,0)
    glueLimb(Player.Character.Torso,rightrm,"Right shoulder",1.5,0.5,0)
    glueLimb(Player.Character.Torso,leftarm,"Left shoulder",-1.5,0.5,0)

    -- Sensors to play sounds
    local function addSensor(pos)
        local sensor = Instance.new("Part", Player.Character.Torso)
        sensor.Size = Vector3.new(1.2,1.1,0.8)
        sensor.CanCollide = false
        sensor.Position = Player.Character.Torso.Position
        local welder = Instance.new("Weld", sensor)
        welder.Part0 = Player.Character.Torso
        welder.Part1 = sensor
        welder.C0 = welder.C0 * CFrame.new(pos)
        sensor.Transparency = 1
        sensor.Touched:Connect(function()
            if not using then
                using = true
                sounds[math.random(1,4)]:Play()
                wait(0.1)
                using = false
            end
        end)
    end

    addSensor(Vector3.new(0,0,1.05))
    addSensor(Vector3.new(0,0,-1.05))
end

-- Attach ragdoll to tool
local tool = script.Parent
tool.Activated:Connect(ragdollify)

   end,
}) --Clean

    local Button = Scripts:CreateButton({
   Name = "226w6 moderator suite",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/LuauIsBluu/BluuGui-by-118o8/refs/heads/main/226w6%20moderator%20suite.Lua"))()

        Rayfield:Notify({
   Title = "226w6 executed!",
   Content = "Enjoy be a moderator :3",
   Duration = 3.1,
   Image = 4483362458,
})                                                        
   end,
})

local Button = Trolling:CreateButton({
   Name = "Mafioso Fe",
   Callback = function()
   --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "walkspeed override"
tool.RequiresHandle = false
tool.CanBeDropped = false

-- Animation setup (replace the AnimationId with a valid one)
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://28440069"

-- Walkspeed override settings
local overrideSpeed = 50
local overrideDuration = 10 -- Changed from 3 to 10 seconds
local humanoid = nil
local animTrack = nil

-- Function to activate walkspeed override
local function activateWalkspeedOverride()
    if not humanoid then return end
    local defaultWalkSpeed = humanoid.WalkSpeed
    humanoid.WalkSpeed = overrideSpeed

    local character = player.Character
    local forwardDirection = character.PrimaryPart.CFrame.LookVector
    local startTime = tick()
    local connection

    -- Play the animation
    animTrack = humanoid:LoadAnimation(animation)
    animTrack:Play()

    -- Move forward and check for collisions
    connection = RunService.Heartbeat:Connect(function()
        if tick() - startTime > overrideDuration then
            humanoid.WalkSpeed = defaultWalkSpeed
            if animTrack then
                animTrack:Stop() -- Stop the animation when override ends
            end
            connection:Disconnect()
        end

        character:TranslateBy(forwardDirection * 0.5) -- Moves forward
    end)

    -- Stop on collision
    character.Touched:Connect(function(hit)
        if hit and hit:IsA("BasePart") and hit.Parent ~= character then
            humanoid.WalkSpeed = defaultWalkSpeed
            if animTrack then
                animTrack:Stop() -- Stop the animation on collision
            end
            connection:Disconnect()
        end
    end)
end

-- Tool activation logic
tool.Activated:Connect(function()
    print("Tool Activated")
    humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        print("Humanoid Found")

        -- Activate walkspeed override
        activateWalkspeedOverride()
    end
end)

-- Add tool to the player's backpack
tool.Parent = backpack



local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

local tool = Instance.new("Tool")
tool.Name = "corrupt nature"
tool.RequiresHandle = false
tool.CanBeDropped = false

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://188853932"

tool.Activated:Connect(function()
    print("Tool Activated")
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        print("Humanoid Found")
        local animTrack = humanoid:LoadAnimation(animation)
        animTrack:Play()
    end
end)

tool.Parent = backpack

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-30401"))()

Rayfield:Notify({
   Title = "You are Mine!",
   Content = "This anims are FE and FOR R6 ONLY!",
   Duration = 6.5,
   Image = 4483362458,
})

   end,
}) --Clean

local Button = Scripts:CreateButton({
   Name = "StrawberryCMD",
   Callback = function()
   --https://discord.gg/bXQfb3QWa8
loadstring(game:HttpGet("https://raw.githubusercontent.com/StrawberryRBLX/Strawberry-Scanner/refs/heads/main/release/scanner.lua"))()
   end,
})

local Button = Scripts:CreateButton({
   Name = "QuirkyCMD",
   Callback = function()
   --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
   end,
})

local Button = Scripts:CreateButton({
   Name = "Dex",
   Callback = function()
   --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
   end,
})

--If a user is reading this Keep working o scripts like me get time and make , code , do scripts this is a bad time for roblox.
