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
       Note = "Proceed to Linkvertise key system", -- Use this to tell the user how to get a key
       FileName = "AspixKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {""} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }

    
 })

 local highlightsEnabled = false  -- Set to false to disable highlights by default

 -- Function to highlight a player's character
 local function highlightPlayer(player)
     -- Check if the player has a character and is not the local player
     if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         -- Create a Highlight instance
         local highlight = Instance.new("Highlight")
         highlight.Adornee = player.Character
 
         -- Apply custom properties
         highlight.FillColor = Color3.fromRGB(0,206,209)
         highlight.FillTransparency = 0.5
         highlight.OutlineColor = Color3.fromRGB(255,255,255)
         highlight.OutlineTransparency = 0

 
         highlight.Parent = player.Character
         return highlight
     end
     return nil
 end
 
 -- Function to remove highlight from a player's character
 local function removeHighlight(player)
     if player.Character and player.Character:FindFirstChildOfClass("Highlight") then
         player.Character:FindFirstChildOfClass("Highlight"):Destroy()
     end
 end
 
 -- Function to handle when a new player joins
 local function onPlayerAdded(player)
     -- Connect to the CharacterAdded event to highlight the character when it appears
     player.CharacterAdded:Connect(function(character)
         if highlightsEnabled then
             highlightPlayer(player)
         end
     end)
 
     -- If the character already exists, highlight it immediately if enabled
     if player.Character and highlightsEnabled then
         highlightPlayer(player)
     end
 end
 
 -- Function to toggle highlights on or off
 local function toggleHighlights(enable)
     highlightsEnabled = enable
 
     -- Iterate through all players and update their highlights accordingly
     local Players = game:GetService("Players")
     for _, player in ipairs(Players:GetPlayers()) do
         if highlightsEnabled then
             highlightPlayer(player)
         else
             removeHighlight(player)
         end
     end
 end
 
 -- Get the Players service
 local Players = game:GetService("Players")
 
 -- Iterate through all existing players
 for _, player in ipairs(Players:GetPlayers()) do
     onPlayerAdded(player)
 end
 
 -- Connect to the PlayerAdded event to handle new players joining
 Players.PlayerAdded:Connect(onPlayerAdded)

 local View = Window:CreateTab("ESP")
 local AIM = Window:CreateTab("Aim-Bot")
 local Player = Window:CreateTab("Player")
 local esps = View:CreateSection("ESP v2")

 local about = Window:CreateTab("About")
 local credits = about:CreateSection("Credits")

 local esp_highlight = View:CreateToggle({
    Name = "ESP Highlight",
    CurrentValue = false,
    Flag = "esp_highlight_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        toggleHighlights(Value)
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