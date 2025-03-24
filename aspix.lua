local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "ASPIX.CC",
    Icon = 0,
    LoadingTitle = "aspix.cc",
    LoadingSubtitle = "by Shmoti",
    Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "aspix.cc"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "ASPIX.CC",
       Subtitle = "Key System",
       Note = "Proceed to Linkvertise key system", -- Use this to tell the user how to get a key
       FileName = "AspixKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {""} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }

    
 })

 local TeamCheck = false
 local TeamColors = false
 local HideFriendly = false
 local HideEnemy = false
 local Storage = game:GetService("CoreGui")
 local Players = game:GetService("Players")
 local RunService = game:GetService("RunService")
 local Neutral = Color3.fromRGB(255, 255, 255)
 local Friendly = Color3.fromRGB(47, 211, 61)
 local Enemy = Color3.fromRGB(211, 47, 47)
 
 
 
 
 
 local tpKillEnabled = false 
 local tpKillKey = Enum.KeyCode.E  
 local Esp = false
 local Names = false
 local ColoEs = Color3.fromRGB(255, 255, 255)
 local ColoNa = Color3.fromRGB(255, 255, 255)
 local HighlightEnabled = false
 local HighlightColor = Color3.fromRGB(175, 25, 255)
 
 
 local TeamCheck = true 
 local tpKillEnabled = false 
 local tpKillKey = Enum.KeyCode.E  
 local Players = game:GetService("Players")
 
 local flyEnabled = false
 local flyKey = Enum.KeyCode.F  
 local flySpeed = 50  
 local userInputService = game:GetService("UserInputService")
 
 
 
 local Camera = game:GetService("Workspace").CurrentCamera
 
 local StarterGui = game:GetService("StarterGui")
 local Settings = {
     Box_Color = Color3.fromRGB(255, 0, 0),
     Tracer_Color = Color3.fromRGB(255, 0, 0),
     Tracer_Thickness = 1,
     Box_Thickness = 1,
     Tracer_Origin = "Bottom", 
     Tracer_FollowMouse = false,
     Tracers = false
 }
 
 local Team_Check = {
     TeamCheck = false, 
     Green = Color3.fromRGB(0, 255, 0),
     Red = Color3.fromRGB(255, 0, 0)
 }
 
 local TeamColor = true
 
 local player = game:GetService("Players").LocalPlayer
 local camera = game:GetService("Workspace").CurrentCamera
 local mouse = player:GetMouse()
 local FillColor = Color3.fromRGB(175,25,255)
 local DepthMode = "AlwaysOnTop"
 local FillTransparency = 0.5
 local OutlineColor = Color3.fromRGB(255,255,255)
 local OutlineTransparency = 0
 
 local CoreGui = game:FindService("CoreGui")
 local Players = game:FindService("Players")
 local lp = Players.LocalPlayer
 local connections = {}
 
 local Storage = Instance.new("Folder")
 Storage.Parent = CoreGui
 Storage.Name = "Highlight_Storage"
 
 local function Highlight(plr)
     local Highlight = Instance.new("Highlight")
     Highlight.Name = plr.Name
     Highlight.FillColor = HighlightColor  
     Highlight.DepthMode = DepthMode
     Highlight.FillTransparency = FillTransparency
     Highlight.OutlineColor = OutlineColor
     Highlight.OutlineTransparency = 0
     Highlight.Enabled = HighlightEnabled  
     Highlight.Parent = Storage
     
     local plrchar = plr.Character
     if plrchar then
         Highlight.Adornee = plrchar
     end
 
     connections[plr] = plr.CharacterAdded:Connect(function(char)
         Highlight.Adornee = char
     end)
 end
 
 for _, player in pairs(Players:GetPlayers()) do
     Highlight(player)
 end
 Players.PlayerAdded:Connect(Highlight)
 Players.PlayerRemoving:Connect(function(plr)
     local highlight = Storage:FindFirstChild(plr.Name)
     if highlight then
         highlight:Destroy()
     end
     if connections[plr] then
         connections[plr]:Disconnect()
     end
 end)
 
 local function NewQuad(thickness, color)
     local quad = Drawing.new("Quad")
     quad.Visible = false
     quad.PointA = Vector2.new(0, 0)
     quad.PointB = Vector2.new(0, 0)
     quad.PointC = Vector2.new(0, 0)
     quad.PointD = Vector2.new(0, 0)
     quad.Color = color
     quad.Filled = false
     quad.Thickness = thickness
     quad.Transparency = 1
     return quad
 end
 
 local function NewLine(thickness, color)
     local line = Drawing.new("Line")
     line.Visible = false
     line.From = Vector2.new(0, 0)
     line.To = Vector2.new(0, 0)
     line.Color = color 
     line.Thickness = thickness
     line.Transparency = 1
     return line
 end
 
 local function NewText(size, color)
     local text = Drawing.new("Text")
     text.Visible = false
     text.Size = size
     text.Color = color
     text.Center = true
     text.Outline = true
     text.OutlineColor = Color3.fromRGB(0, 0, 0) 
     text.Text = ""
     return text
 end
 
 local function Visibility(state, lib)
     for _, x in pairs(lib) do
         x.Visible = state
     end
 end
 
 local black = Color3.fromRGB(0, 0, 0)
 local connections = {}
 local tracers = {} 
 local names = {} 
 
 local function ESPCleanup(plr)
    
     if tracers[plr] then
         for _, tracer in pairs(tracers[plr]) do
             tracer.Visible = false
             tracer:Remove()  
         end
         tracers[plr] = nil  
     end
     
    
     if names[plr] then
         names[plr].Visible = false
         names[plr]:Remove()  
         names[plr] = nil 
     end
     
     
     if connections[plr] then
         connections[plr]:Disconnect()
         connections[plr] = nil
     end
 end
 local function ESP(plr)
    
     local library = {
         blacktracer = NewLine(Settings.Tracer_Thickness * 2, black),
         tracer = NewLine(Settings.Tracer_Thickness, Settings.Tracer_Color),
         black = NewQuad(Settings.Box_Thickness * 2, black),
         box = NewQuad(Settings.Box_Thickness, Settings.Box_Color),
         healthbar = NewLine(3, black),
         greenhealth = NewLine(1.5, black),
         nameText = NewText(15, ColoNa)  
     }
 
  
     tracers[plr] = {library.tracer, library.blacktracer}
     names[plr] = library.nameText
 
     local function Colorize(color)
         for _, x in pairs(library) do
             if x ~= library.healthbar and x ~= library.greenhealth and x ~= library.blacktracer and x ~= library.black then
                 x.Color = color
             end
         end
     end
 
     local function Updater()
         local connection
         connection = game:GetService("RunService").RenderStepped:Connect(function()
             if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") then
                 local HumPos, OnScreen = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                 if OnScreen then
                     local head = camera:WorldToViewportPoint(plr.Character.Head.Position)
                     local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
 
                     local function Size(item)
                         item.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - DistanceY * 2)
                         item.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY * 2)
                         item.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY * 2)
                         item.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + DistanceY * 2)
                     end
 
                     if Esp then
                         Size(library.box)
                         Size(library.black)
 
                       
                         if Names then
                             library.nameText.Position = Vector2.new(head.X, head.Y - 50) 
                             library.nameText.Text = plr.Name
                             library.nameText.Visible = true
                         else
                             library.nameText.Visible = false  
                         end
 
                         if Settings.Tracers then
                             if Settings.Tracer_Origin == "Middle" then
                                 library.tracer.From = camera.ViewportSize * 0.5
                                 library.blacktracer.From = camera.ViewportSize * 0.5
                             elseif Settings.Tracer_Origin == "Bottom" then
                                 library.tracer.From = Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y)
                                 library.blacktracer.From = Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y)
                             end
                             if Settings.Tracer_FollowMouse then
                                 library.tracer.From = Vector2.new(mouse.X, mouse.Y + 36)
                                 library.blacktracer.From = Vector2.new(mouse.X, mouse.Y + 36)
                             end
                             library.tracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY * 2)
                             library.blacktracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY * 2)
                         end
 
                         local d = (Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY * 2) - Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY * 2)).magnitude 
                         local healthoffset = plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth * d
 
                         library.greenhealth.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY * 2)
                         library.greenhealth.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY * 2 - healthoffset)
 
                         library.healthbar.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY * 2)
                         library.healthbar.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y - DistanceY * 2)
 
                         library.greenhealth.Color = Color3.fromRGB(255, 0, 0):lerp(Color3.fromRGB(0, 255, 0), plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth)
 
                         if Team_Check.TeamCheck then
                             if plr.TeamColor == player.TeamColor then
                                 Colorize(Team_Check.Green)
                             else 
                                 Colorize(Team_Check.Red)
                             end
                         else 
                             library.tracer.Color = Settings.Tracer_Color
                             library.box.Color = Settings.Box_Color
                         end
 
                         if TeamColor then
                             Colorize(plr.TeamColor.Color)
                         end
 
                         Visibility(true, library)
                     else
                         Visibility(false, library)  
                     end
                 else 
                     Visibility(false, library)  
                 end
             else 
                 Visibility(false, library)  
                 if game.Players:FindFirstChild(plr.Name) == nil then
                     connection:Disconnect()
                 end
             end
         end)
     end
     coroutine.wrap(Updater)()
 end
 
 local dwCamera = workspace.CurrentCamera
 local dwRunService = game:GetService("RunService")
 local dwUIS = game:GetService("UserInputService")
 local dwEntities = game:GetService("Players")
 local dwLocalPlayer = dwEntities.LocalPlayer
 local dwMouse = dwLocalPlayer:GetMouse()
 local safe = setmetatable({}, {
     __index = function(_, k)
         return game:GetService(k)
     end
 })
 local PlayerTable = {}
 
 for i,v in pairs(game:GetService("Players"):GetPlayers()) do 
     if v ~= dwLocalPlayer then
         table.insert(PlayerTable,v.Name)
     end
 end
 local cam = safe.Workspace.CurrentCamera 
 local lp = safe.Players.LocalPlayer 
 local lpc = safe.Players.LocalPlayer.Character 
 local function inlos(p, ...) 
     return #cam:GetPartsObscuringTarget({p}, {cam, lp.Character, ...}) == 0
 end
 
 
 local settings = {
     Aimbot = false,
     Aiming = false,
     Aimbot_AimPart = "Head",
     Aimbot_TeamCheck = false,
     Aimbot_Draw_FOV = true,
     Aimbot_FOV_Radius = 200,
     Aimbot_FOV_Color = Color3.fromRGB(255,255,255),
     Aimbot_visiblecheck = false,
     Aimbot_Key = Enum.KeyCode.LeftShift,
     Aimbot_Onscreen = true,
     Aimbot_Speed = 10
 }
 
 
 local fovcircle = Drawing.new("Circle")
 fovcircle.Visible = settings.Aimbot_Draw_FOV
 fovcircle.Radius = settings.Aimbot_FOV_Radius
 fovcircle.Color = settings.Aimbot_FOV_Color
 fovcircle.Thickness = 1
 fovcircle.Filled = false
 fovcircle.Transparency = 0
 
 fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)
 
 
 
 dwRunService.RenderStepped:Connect(function()
 
     local dist = math.huge
     local closest_char = nil
     if settings.Aimbot then
         if settings.Aiming then
 
             for i,v in next, dwEntities:GetChildren() do 
                 if v ~= dwLocalPlayer and
                     v.Character and
                     v.Character:FindFirstChild("HumanoidRootPart") and
                     v.Character:FindFirstChild("Humanoid") and
                     v.Character:FindFirstChild("Humanoid").Health > 0 then
 
                     if settings.Aimbot_TeamCheck == true and
                         v.Team ~= dwLocalPlayer.Team or
                         settings.Aimbot_TeamCheck == false then
 
                         local char = v.Character
                         local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[settings.Aimbot_AimPart].Position)
 
                         if is_onscreen and settings.Aimbot_Onscreen or settings.Aimbot_Onscreen == false then
                             local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude
                             if mag < dist and mag < settings.Aimbot_FOV_Radius then
                                 dist = mag
                                 closest_char = char
                             end
                         end
                     end
                 end
             end
 
             if closest_char ~= nil and
                 closest_char:FindFirstChild("HumanoidRootPart") and
                 closest_char:FindFirstChild("Humanoid") and
                 closest_char:FindFirstChild("Humanoid").Health > 0 then
                 local targetPos = closest_char[settings.Aimbot_AimPart].Position
                 if inlos(targetPos, closest_char) and settings.Aimbot_visiblecheck then
                   
                     dwCamera.CFrame = dwCamera.CFrame:Lerp(CFrame.new(dwCamera.CFrame.Position, targetPos), settings.Aimbot_Speed * 0.02)
                 elseif not settings.Aimbot_visiblecheck then
                     dwCamera.CFrame = dwCamera.CFrame:Lerp(CFrame.new(dwCamera.CFrame.Position, targetPos), settings.Aimbot_Speed * 0.02)
                 end
             end
         end
     end
 end)
 
 
 game:GetService('RunService').Stepped:connect(function()
     if aimbotting then
         --MouseTests()
     end
 end)
 
 
 local plr = safe.Players.LocalPlayer
 local mouse = plr:GetMouse()
 
 
 for _, v in pairs(game:GetService("Players"):GetPlayers()) do
     if v.Name ~= player.Name then
         coroutine.wrap(ESP)(v)
     end
 end
 
 game.Players.PlayerAdded:Connect(function(newplr)
     if newplr.Name ~= player.Name then
         coroutine.wrap(ESP)(newplr)
     end
 end)

 local flySpeed = 50

 local View = Window:CreateTab("ESP")
 local AIM = Window:CreateTab("Aim-Bot")
 local man = Window:CreateTab("Player")
 local esps = View:CreateSection("ESP v2")

 local about = Window:CreateTab("About")
 local credits = about:CreateSection("Credits")

 local Box_color = View:CreateColorPicker({
    Name = "",
    Color = Color3.fromRGB(255,255,255),
    Flag = "box_color", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Settings.Box_Color = Value
    end
})

 local ESP_Box = View:CreateToggle({
    Name = "ESP Box",
    CurrentValue = false,
    Flag = "esp_box_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Esp = Value
    end,
 })

 local ESP_name = View:CreateToggle({
    Name = "ESP Name",
    CurrentValue = false,
    Flag = "esp_name_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Names = Value
    end,
 })

 local ESP_toggle_teamcheck = View:CreateToggle({
    Name = "Toggle team check",
    CurrentValue = false,
    Flag = "esp_team_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Team_Check.TeamCheck = Value
    end,
 })

 local ESP_toggle_colors = View:CreateToggle({
    Name = "Toggle team colors",
    CurrentValue = false,
    Flag = "esp_teamcolor_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        TeamColor = Value
    end,
 })

 local ESP_toggle_highlight = View:CreateToggle({
    Name = "Toggle chams",
    CurrentValue = false,
    Flag = "esp_highlight_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        HighlightEnabled = Value
        for _, highlight in pairs(Storage:GetChildren()) do
            highlight.Enabled = HighlightEnabled 
        end
    end,
 })

 local Highlight_color = View:CreateColorPicker({
    Name = "Chams Color",
    Color = Color3.fromRGB(255,255,255),
    Flag = "highlight_color", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        HighlightColor = Value
        for _, highlight in pairs(Storage:GetChildren()) do
            highlight.FillColor = HighlightColor
        end
    end
})

local fovSlider = AIM:CreateSlider({
    Name = "FOV",
    Range = {50, 1500},
    Increment = 1,
    Suffix = "idk",
    CurrentValue = 60,
    Flag = "fov", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        settings.Aimbot_FOV_Radius = Value
        fovcircle.Radius = Value
    end,
 })

 local speedSlider = AIM:CreateSlider({
    Name = "Aim-Bot speed",
    Range = {1, 100},
    Increment = 1,
    Suffix = "idk",
    CurrentValue = 10,
    Flag = "aimspeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        settings.Aimbot_Speed = Value
    end,
 })

 local aimKey = AIM:CreateKeybind({
    Name = "Aimbot KeyBind",
    CurrentKeybind = "LeftShift",
    HoldToInteract = false,
    Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Keybind)
        settings.Aimbot_Key = Keybind
    end,
 })

 local aimbot_slider = AIM:CreateToggle({
    Name = "Toggle Aimbot",
    CurrentValue = false,
    Flag = "aimbot_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        settings.Aimbot = Value
    end,
 })

 local aimbot_draw_fov = AIM:CreateToggle({
    Name = "Draw FOV Circle",
    CurrentValue = false,
    Flag = "circle_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value == true then
            fovcircle.Transparency = 1
            print(1) 
        elseif Value == false then
            fovcircle.Transparency = 0
            print(0) 
        end
    end,
 })

 local aimbot_teamcheck = AIM:CreateToggle({
    Name = "Toggle Team check",
    CurrentValue = false,
    Flag = "aimbot_teamcheck_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        settings.Aimbot_TeamCheck = Value
    end,
 })

 local aimbot_visiblecheck = AIM:CreateToggle({
    Name = "Toggle visible check",
    CurrentValue = false,
    Flag = "aimbot_visiblecheck_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        settings.Aimbot_visiblecheck = Value
    end,
 })

 dwUIS.InputBegan:Connect(function(inputObject,gameProcessed)
	if inputObject.KeyCode == settings.Aimbot_Key then
		settings.Aiming = true

	end
end)

dwUIS.InputEnded:Connect(function(inputObject,gameProcessed)
	if inputObject.KeyCode == settings.Aimbot_Key then
		settings.Aiming = false

	end
end)

local FlyspeedSlider = AIM:CreateSlider({
    Name = "Fly speed",
    Range = {1, 100},
    Increment = 1,
    Suffix = "",
    CurrentValue = 50,
    Flag = "flyspeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        flySpeed = Value
    end,
 })


local fly = man:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "fly_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        flyEnabled = Value
    end,
 })

 local Label = about:CreateLabel("by Shmoti, :)", Color3.fromRGB(227, 3, 252), false)
 
 local unload = about:CreateButton({
    Name = "Unload",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 Rayfield:LoadConfiguration()