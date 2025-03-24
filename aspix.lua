local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "ASPIX.CC",
    Icon = 0,
    LoadingTitle = "aspix.cc",
    LoadingSubtitle = "by Shmoti",
    Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
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
       Note = "Proceed to Luarmor key system", -- Use this to tell the user how to get a key
       FileName = "AspixKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }

    
 })

 local Esp = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/x114/RobloxScripts/main/OpenSourceEsp"))()
-- Boxes --
 Esp.Box = false
 Esp.BoxColor = Color3.fromRGB(255,255,255)
 Esp.BoxOutline = true
 Esp.BoxOutlineColor = Color3.fromRGB(0,0,0)
-- HealthBars --
 Esp.HealthBar = false
 Esp.HealthBarSide = "Left" -- Left,Bottom,Right
-- Names --
 Esp.Names = false
 Esp.NamesColor = Color3.fromRGB(255,255,255)
 Esp.NamesOutline = true
 Esp.NamesFont = 2
 Esp.NamesSize = 13

 local main = Window:CreateTab("Main")
 local esps = main:CreateSection("ESP")

 local about = Window:CreateTab("About")
 local credits = about:CreateSection("Credits")

 local esp = main:CreateButton({
    Name = "ESP V3",
    Callback = function()
        Esp.Box = true
    end,
 })

 local Label = about:CreateLabel("by Shmoti, ", Color3.fromRGB(227, 3, 252), false)
 
 local unload = about:CreateButton({
    Name = "Unload",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 Rayfield:LoadConfiguration()