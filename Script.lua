local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Farm",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Punch",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Wrestle",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local S3 = T3:AddSection({
     Name = "SELECT ZONE / MAP"
})

local S1 = T3:AddSection({
     Name = "VS BOT"
})

local S2 = T3:AddSection({
     Name = "VS PLAYER"
})

local T4 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Pet",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local workspace = game:GetService("Workspace")
local npc = {}
local zone = {}
local egg = {}
local VSPLAYER = {}
function AddTable(Table_V,LocalName)
for _,v in pairs(Table_V:GetChildren()) do
    table.insert(LocalName,v.Name)
end
end

AddTable(workspace.Zones,zone)

AddTable(workspace.Zones["1"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["2"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["3"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["1"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["2"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["3"].Interactables.ArmWrestling.PVP,VSPLAYER)
-- AddTable(workspace.Folder.Eggs,egg)

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

local treadmill = {
      Tier = "Tier1",
      Number = "1"
}

T1:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G.zone_1 = Value
  end    
})

T2:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G.zone_2 = Value
    treadmill.Number = Value
  end    
})

S3:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G.zone_3 = Value
  end    
})

T2:AddDropdown({
  Name = "Select Punch Tier",
  Default = "Tier1",
  Options = {"Tier1","Tier2","Tier3","Tier4","Tier5","Tier6"},
  Callback = function(Value)
    treadmill.Tier = Value
  end    
})

T2:AddToggle({
  Name = "Auto Punch",
  Default = false,
  Callback = function(Value)
  _G.Tm = Value
    while wait() do
      if _G.Tm == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PunchBagService.RE.onGiveStats:FireServer(treadmill.Number,treadmill.Tier)
      end
  end    
})

S1:AddDropdown({
   Name = "Select NPC",
   Default = "Bully",
   Options = npc,
   Callback = function(Value)
     _G.AI = Value
   end    
})

S1:AddToggle({
  Name = "Auto Wrestle",
  Default = false,
  Callback = function(Value)
  _G.JoinW = Value
    while wait() do
      if _G.JoinW == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(_G.AI,workspace.Zones[_G.zone_3].Interactables.ArmWrestling.NPC[_G.AI],_G.zone_3)
      end
  end    
})

S1:AddToggle({
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

S2:AddDropdown({
   Name = "Select Table",
   Default = "ArmWrestleTable4",
   Options = VSPLAYER,
   Callback = function(Value)
     _G.TABLE_VSPLAYER = Value
   end    
})

S2:AddToggle({
  Name = "Auto Enter Table",
  Default = false,
  Callback = function(Value)
  _G.ENTERTABLE = Value
    while wait() do
      if _G.ENTERTABLE == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterTable:FireServer(workspace.Zones[_G.zone_3].Interactables.ArmWrestling.PVP[_G.TABLE_VSPLAYER])
      end
  end    
})

S2:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.CLICKVSPLAYER = Value
    while wait() do
      if _G.CLICKVSPLAYER == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
      end
  end    
})

local dislist = {"=[ Zone 1 ]=","Earth","Icy","Blackhole","Lava","=[ Zone 2 ]=","Molten","Crystal","Solar","Ice","Burning","Moon",",=[ Zone 3 ]=","Coconut","Palm","Treasure","Poseidon","KingFish","Clam"}

T4:AddDropdown({
   Name = "Select EGG",
   Default = "Earth",
   Options = dislist,
   Callback = function(Value)
     _G.Egg = Value
   end    
})
--[[
local common = {
      mouse = false,
      squirrel = false,
      cat = false
}

T4:AddToggle({
  Name = "Blacklist common pet",
  Default = false,
  Callback = function(Value)
    common.mouse = Value
    common.squirrel = Value
    common.cat = false
  end    
})

local uncommon = {
      dog = false,
      cow = false,
      deer = false,
      parrot = false
}

T4:AddToggle({
  Name = "Blacklist uncommon pet",
  Default = false,
  Callback = function(Value)
    uncommon.dog = Value
    uncommon.cow = Value
    uncommon.deer = Value
    uncommon.parrot = Value
  end    
})

local rare = {
      fox = false,
      wolf = false,
}

T4:AddToggle({
  Name = "Blacklist rare pet",
  Default = false,
  Callback = function(Value)
    rare.fox = Value
  end    
})

local legendary = {
      mouse = false,
      bear = false,
      slime = false,
      grassmage = false,
      monkey = false,
      tiger = false,
      unicorn = false,
}

T4:AddToggle({
  Name = "Blacklist legendary pet",
  Default = false,
  Callback = function(Value)
    legendary.mouse = Value
    legendary.bear = Value
    legendary.slime = Value
    legendary.grassmage = Value
    legendary.monkey = Value
    legendary.tiger = Value
  end    
})

local mythical = {
      watermage = false,
      elephant = false,
      astra = false,
}

T4:AddToggle({
  Name = "Blacklist mythical pet",
  Default = false,
  Callback = function(Value)
    mythical.watermage = Value
    mythical.elephant = Value
  end    
})

local unknown = {
      magicmage = false,
      spooky = false,
      quasar = false,
      axeli = false,
}

T4:AddToggle({
  Name = "Blacklist Unknown pet (Blackhole Egg)",
  Default = false,
  Callback = function(Value)
    unknown.magicmage = Value
    unknown.spooky = Value
  end    
})
--]]
T4:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
  _G.Balls = Value
    while wait() do
      if _G.Balls == false then break end
         --[[local args = {
           [1] = _G.Egg,
           [2] = {
              ["Fox"] = rare.fox,
              ["Slime"] = legendary.slime,
              ["Bear"] = legendary.bear,
              ["Deer"] = uncommon.deer,
              ["Squirrel"] = common.squirrel,
              ["WaterMage"] = mythical.watermage,
              ["GrassMage"] = legendary.grassmage,
              ["Spooky"] = unknown.spooky,
              ["MagicMage"] = unknown.magicmage,
              ["Monkey"] = legendary.monkey,
              ["Parrot"] = uncommon.parot,
              ["Tiger"] = legendary.tiger,
              ["Elephant"] = mythical.elephant,
              ["Cat"] = common.cat,
              ["Dog"] = uncommon.dog,
              ["Cow"] = uncommon.cow,
              ["Mouse"] = legendary.mouse,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              [""] = ,
              
          }
      }
--]]
      game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.purchaseEgg:InvokeServer(_G.Egg,{})
      end
  end    
})
--[[
T5:AddToggle({
  Name = "Auto Gold",
  Default = false,
  Callback = function(Value)
  _G.Dmb = Value
    while wait() do
      if _G.Dmb == false then break end
        if _G.JoinW == false and _G.ClickW == false then
           game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(_G.zone_1,"Dumbells",_G.Prototype_A1)
        end
      end
  end    
})

T5:AddToggle({
  Name = "Auto Craft",
  Default = false,
  Callback = function(Value)
  _G.Dmb = Value
    while wait() do
      if _G.Dmb == false then break end
        if _G.JoinW == false and _G.ClickW == false then
           game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(_G.zone_1,"Dumbells",_G.Prototype_A1)
        end
      end
  end    
})
--]]
T5:AddToggle({
  Name = "Auto Equip Best",
  Default = false,
  Callback = function(Value)
  _G.EB = Value
    while wait() do
      if _G.EB == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.equipBest:InvokeServer(game:GetService("Players").LocalPlayer)
      end
  end    
})

local weight = {"1Kg","2Kg","3Kg","4Kg","5Kg","10Kg","15Kg","20Kg","25Kg","50Kg","100Kg","250Kg"}
--[[
T1:AddDropdown({
   Name = "select weight",
   Default = "1Kg",
   Options = weight,
   Callback = function(Value)
     _G.Prototype_A1 = Value
     _G.Prototype_A2 = Value
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
--[[
T1:AddToggle({
  Name = "Auto Equip Dumbells",
  Default = false,
  Callback = function(Value)
  _G.Dmb = Value
    while wait() do
      if _G.Dmb == false then break end
        if _G.JoinW == false and _G.ClickW == false then
           game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(_G.zone_1,"Dumbells",_G.Prototype_A1)
        end
      end
  end    
})

T1:AddToggle({
  Name = "Auto Equip Grips",
  Default = false,
  Callback = function(Value)
  _G.Grips = Value
    while wait() do
      if _G.Grips == false then break end
         if _G.JoinW == false and _G.ClickW == false then
           game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(_G.zone_1,"Grips",_G.Prototype_A2)
        end
      end
  end    
})
--]]
