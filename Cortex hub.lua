local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Cortex hub",
    LoadingTitle = "Corhub",
    LoadingSubtitle = "by Cortex",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Cortex hub"
    },
    Discord = {
       Enabled = true,
       Invite = "Cortex Exploits", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local MainTab = Window:CreateTab("Home", nil) -- Title, Image
 local MainSection = MainTab:CreateSection("Main")


 Rayfield:Notify({
    Title = "Thanks for using Corhub",
    Content = "Notification Content",
    Duration = 3,
    Image = nil,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("Thanks!")
       end
    },
 },
 })

 local Button = MainTab:CreateButton({
   Name = "No cooldown",
   Callback = function()
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()
       local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")

       if tool then
           local localscript = tool:FindFirstChildOfClass("LocalScript")
           if localscript then
               while character.Humanoid.Health ~= 0 do
                   local localscriptclone = localscript:Clone()
                   localscript:Destroy()
                   localscriptclone.Parent = tool
                   wait(0.1)
               end
           else
               warn("No LocalScript found in the tool.")
           end
       else
           warn("No tool found in character or backpack.")
       end
   end,
})