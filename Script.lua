local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Farm",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Treadmill",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Wrestle",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local workspace = game:GetService("Workspace")
local npc = {}
local zone = {}

function AddTable(Table_V,LocalName)
for _,v in pairs(Table_V:GetChildren()) do
    table.insert(LocalName,v.Name)
end
end

AddTable(workspace.Zones["1"].Interactables.ArmWrestling.NPC,npc)

--[[
T1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.Toggle = Value
    while wait() do
      if _G.Toggle == false then break end
         
      end
  end    
})
--]]

T1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.Click = Value
    while wait() do
      if _G.Click == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onClick:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Spin",
  Default = false,
  Callback = function(Value)
  _G.Spin = Value
    while wait() do
      if _G.Spin == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.SpinService.RE.onSpinRequest:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Reb",
  Default = false,
  Callback = function(Value)
  _G.Rbr = Value
    while wait() do
      if _G.Rbr == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Gift",
  Default = false,
  Callback = function(Value)
  _G.Gift = Value
    while wait() do
      if _G.Gift == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("1")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("2")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("3")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("4")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("5")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("6")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("7")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("8")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("9")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("10")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("11")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("12")
      end
  end    
})

local treadmill = {
      Tier = "Tier1",
      Number = 1
}

T2:AddDropdown({
  Name = "Select Treadmill",
  Default = "Tier1",
  Options = {"Tier1","Tier2","Tier3","Tier4","Tier5","Tier6"},
  Callback = function(Value)
    treadmill.Tier = Value
      if treadmill.Tier == "Tier1" then
         treadmill.Number = 1
      end
      if treadmill.Tier == "Tier2" then
         treadmill.Number = 2
      end
      if treadmill.Tier == "Tier3" then
         treadmill.Number = 3
      end
      if treadmill.Tier == "Tier4" then
         treadmill.Number = 4
      end
      if treadmill.Tier == "Tier5" then
         treadmill.Number = 5
      end
      if treadmill.Tier == "Tier6" then
         treadmill.Number = 6
      end
  end    
})

T2:AddToggle({
  Name = "Auto Treadmill",
  Default = false,
  Callback = function(Value)
  _G.Tm = Value
    while wait() do
      if _G.Tm == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TreadmillService.RE.onGiveStats:FireServer(treadmill.Number,treadmill.Tier)
      end
  end    
})

T3:AddDropdown({
   Name = "Select NPC",
   Default = "Bully",
   Options = npc,
   Callback = function(Value)
     _G.AI = Value
   end    
})

T3:AddToggle({
  Name = "Auto Wrestle",
  Default = false,
  Callback = function(Value)
  _G.JoinW = Value
    while wait() do
      if _G.JoinW == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(_G.AI,workspace.Zones["1"].Interactables.ArmWrestling.NPC[_G.AI],"1")
      end
  end    
})

T3:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.ClickW = Value
    while wait() do
      if _G.ClickW == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
      end
  end    
})
