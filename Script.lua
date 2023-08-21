--[[
Sorry, it takes a long time
]]

local DeleteFuckingPet = nil
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'purchaseEgg' then
DeleteFuckingPet = Args[2]
end
	return namecall(self, ...) 
end)

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})
local TweenService = game:GetService("TweenService")

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

function PlayerProxy(playername)
if playername == "all" then
for _,v in pairs(game.Players:GetPlayers()) do
     return v.Name
end
else
for i,v in pairs(game.Players:GetChildren()) do
    if (string.sub(string.lower(v.Name),1,string.len(playername))) == string.lower(playername) then
      return v.Name
    end
 end
end
end

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
Name = "Egg & Pet",
Icon = "rbxassetid://0",
PremiumOnly = false
})

T4:AddParagraph("New Feature","open the egg and choose the pet you want to choose for deletion")

--local S4 = T4:AddSection({
--     Name = "Golden (Use Private Server)"
--})

--local Detection_A1 = S4:AddParagraph("Pet detection (in workspace)","#PET_DETECTION_ERROR")

--local S5 = T4:AddSection({
--     Name = "Craft (Use Private Server)"
--})

--local Detection_A2 = S5:AddParagraph("Pet detection (in workspace)","#PET_DETECTION_ERROR")

local T5 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T6 = Window:MakeTab({
Name = "Boost",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T7 = Window:MakeTab({
Name = "Event",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T8 = Window:MakeTab({
Name = "Code",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T9 = Window:MakeTab({
Name = "Crate",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local S100 = T3:AddSection({
     Name = "OPEN CRATE"
})

local S101 = T3:AddSection({
     Name = "BUY CRATE"
})

local Event_A3 = T7:AddParagraph("Event Eggs available","#EGG_ERROR")
-- Event_A3:Set("","Event Eggs available")

local workspace = game:GetService("Workspace")
local npc = {}
local zone = {}
local egg = {}
local VSPLAYER = {}
local petIndex = {}
function AddTable(Table_V,LocalName)
for _,v in pairs(Table_V:GetChildren()) do
    table.insert(LocalName,v.Name)
end
end

AddTable(workspace.Zones,zone)

AddTable(workspace.Zones["1"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["2"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["3"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["4"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["1"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["2"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["3"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["4"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.PetFolder,petIndex)

local PetDetect = #petIndex

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

function TPType(type,pos)
   if type == "tween" then
          TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), {CFrame = pos}):Play()
   end
   if type == "teleport" then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
     end
end

function CreateDialogue(title,desc)
OrionLib:MakeNotification({
   Name = title,
   Content = desc,
   Image = "rbxassetid://0",
   Time = 5
  })
end

local treadmill = {
      Tier = "Tier1",
      Number = "1"
}

T6:AddDropdown({
   Name = "Select Boost",
   Default = "Wins",
   Options = {"Wins","Luck","Golden","Void"},
   Callback = function(Value)
     _G.BoostPoison = Value
  end    
})

S100:AddDropdown({
   Name = "Select Crate",
   Default = "Rust",
   Options = {"Rust","Silver","Gold","Diamond"},
   Callback = function(Value)
     _G.CrateSkins = Value
  end    
})

S101:AddDropdown({
   Name = "Select Crate",
   Default = "Rust",
   Options = {"Rust","Silver","Gold","Diamond"},
   Callback = function(Value)
     _G.BuyCrateSkins = Value
  end    
})

S101:AddDropdown({
   Name = "Select Amount",
   Default = "1",
   Options = {"1","5","100"},
   Callback = function(Value)
     _G.AmountCrate = Value
  end    
})

S101:AddButton({
  Name = "Buy Crate",
  Callback = function()
   game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmsService.RF.PurchaseCrates:InvokeServer(_G.BuyCrateSkins,_G.AmountCrate)
end
})

S100:AddToggle({
  Name = "Auto Roll Crate",
  Default = false,
  Callback = function(Value)
  _G.RollSelectedCrate = Value
    while wait() do
      if _G.RollSelectedCrate == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmsService.RF.RollArmCrateForPlayer:InvokeServer(tostring(_G.CrateSkins) .. "Crate")
      end
  end    
})

S100:AddToggle({
  Name = "Auto Roll All Crate",
  Default = false,
  Callback = function(Value)
  _G.RollAllCrate = Value
    while wait() do
      if _G.RollAllCrate == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmsService.RF.RollAllCratesForPlayer:InvokeServer()
      end
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

T5:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G.zone_TP = Value
  end    
})

T5:AddDropdown({
   Name = "Select the teleport type",
   Default = "teleport",
   Options = {"teleport","tween"},
   Callback = function(Value)
     _G.TP_TYPE = Value
  end    
})
--[[
T6:AddButton({ -- fake API, THE ORIGINAL API IS IN THE UI
  Name = "Infinite Biceps / dumbells [ Patched ]",
  Callback = function()
      CreateDialogue("HTTP BAD GATEWAY (505)","this feature has been patched, our API is blocked by anti-cheat.")
  end    
})

T6:AddButton({ -- fake API, THE ORIGINAL API IS IN THE UI
  Name = "Infinite Wins / Trophy [ Patched ]",
  Callback = function()
      CreateDialogue("HTTP BAD GATEWAY (505)","this feature has been patched, our API is blocked by anti-cheat.")
  end    
})

T6:AddButton({ -- fake API, THE ORIGINAL API IS IN THE UI
  Name = "Infinite Knuckles [ Patched ]",
  Callback = function()
      CreateDialogue("HTTP BAD GATEWAY (505)","this feature has been patched, our API is blocked by anti-cheat.")
  end    
})

T6:AddButton({ -- fake API, THE ORIGINAL API IS IN THE UI
  Name = "Infinite Grips [ Patched ]",
  Callback = function()
      CreateDialogue("HTTP BAD GATEWAY (505)","this feature has been patched, our API is blocked by anti-cheat.")
  end    
})
--]]

T8:AddButton({
  Name = "Redeem all codes",
  Callback = function()
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("noob")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("WEDNESDAY")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("FIXED")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("200m")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("enchant")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("Leagues")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("pinksandcastle")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("secret")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("gullible")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("knighty")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("axel")
end
})

T5:AddButton({
  Name = "Teleport",
  Callback = function()
     if _G.zone_TP == "1" then
        TPType(_G.TP_TYPE,CFrame.new(-10326,4,34))
    end
     if _G.zone_TP == "2" then
        TPType(_G.TP_TYPE,CFrame.new(-10324,4,637))
     end
     if _G.zone_TP == "3" then
        TPType(_G.TP_TYPE,CFrame.new(11599,10,-19))
    end
     if _G.zone_TP == "4" then
        TPType(_G.TP_TYPE,CFrame.new(-10274,4,-817))
     end
     if _G.zone_TP == "5" then
        TPType(_G.TP_TYPE,CFrame.new(-10305,-4,-1417))
      end
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
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
      end
  end    
})
--[[
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
})]]

S2:AddDropdown({
   Name = "Select Table",
   Default = "ArmWrestleTable1",
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

local dislist = {"=[ Zone 1 ]=","Earth","Icy","Blackhole","Lava","=[ Zone 2 ]=","Molten","Crystal","Solar","Ice","Burning","Moon","=[ Zone 3 ]=","Coconut","Palm","Treasure","Poseidon","KingFish","Clam","=[ Zone 4 ]=","Rust","Widget","Atom","Nuclear","Mutant","Iridescent","=[ Zone 5 ]=","TRex","Herbivore","Pterodactyl","Gem","DinoFossil","Mystic","=[ Limited Egg ]=","Limited"}

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
      game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.purchaseEgg:InvokeServer(_G.Egg,DeleteFuckingPet)
      end
  end    
})

T4:AddToggle({
  Name = "Auto Gold",
  Default = false,
  Callback = function(Value)
  _G.GoldPet = Value
    while wait() do
      if _G.GoldPet == false then break end
        local PatchGold = petIndex[math.random(1, #petIndex)]
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.goldify:InvokeServer({PatchGold,PatchGold,PatchGold,PatchGold,PatchGold})
     end
  end    
})

T4:AddToggle({
  Name = "Auto Craft",
  Default = false,
  Callback = function(Value)
  _G.Crafter = Value
    while wait() do
      if _G.Crafter == false then break end
        local MasterCraft = petIndex[math.random(1, #petIndex)]
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.craft:InvokeServer(MasterCraft,true)
      end
  end    
})
--]]
T4:AddToggle({
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

T1:AddToggle({
  Name = "Spin lucky draw [Blueprint]",
  Default = false,
  Callback = function(Value)
  _G.blueprint = Value
    while wait() do
      if _G.blueprint == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BlueprintService.RF.LuckyDraw:InvokeServer(false)
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

T6:AddToggle({
  Name = "Use Selected Boost",
  Default = false,
  Callback = function(Value)
  _G.UseBoost = Value
    while wait() do
      if _G.UseBoost == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer(_G.BoostPoison)
      end
  end    
})

T6:AddToggle({
  Name = "Use All Boost",
  Default = false,
  Callback = function(Value)
  _G.UseAllBoost = Value
    while wait() do
      if _G.UseAllBoost == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Luck")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Golden")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Void")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Wins")
      end
  end    
})

--[[
World 1: 
Bully
Teacher
GymRat
MafiaBoss
Champion
]]

local EventSpeed = 0

T7:AddSlider({
  Name = "Farm Speed",
  Min = 0,
  Max = 20,
  Default = 5,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "%",
  Callback = function(Value)
   EventSpeed = tonumber(Value)
  end    
})
--[[
T7:AddToggle({
  Name = "Farm Zone 2",
  Default = false,
  Callback = function(Value)
  _G.Event_AV1 = Value
    while wait() do
      if _G.Event_AV1 == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("ScrapTrader",workspace.Zones["2"].Interactables.ArmWrestling.NPC["ScrapTrader"],2)
         wait(EventSpeed + 1)
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("CyberCop",workspace.Zones["2"].Interactables.ArmWrestling.NPC["CyberCop"],2)
         wait(EventSpeed + 2)
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("SlicerAssassin",workspace.Zones["2"].Interactables.ArmWrestling.NPC["SlicerAssassin"],2)
      end
  end    
})

T7:AddToggle({
  Name = "Farm Zone 3",
  Default = false,
  Callback = function(Value)
  _G.Event_AV1 = Value
    while wait() do
      if _G.Event_AV1 == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("KrakenBoss",workspace.Zones["3"].Interactables.ArmWrestling.NPC["KrakenBoss"],3)
      end
  end    
})

T7:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.Event_AV2 = Value
    while wait() do
      if _G.Event_AV2 == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
      end
  end    
})
]]
T7:AddToggle({
  Name = "Auto Claim Event Egg",
  Default = false,
  Callback = function(Value)
  _G.Event_AV3 = Value
    while wait() do
      if _G.Event_AV3 == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EventService.RF.ClaimEgg:InvokeServer()
      end
  end    
})

while wait() do
if game.Players.LocalPlayer.PlayerGui.GameUI.Menus:FindFirstChild("Event") then
Event_A3:Set(tostring(game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Event.Amount.Text),"Event Eggs available")
end
end
--[[
if PetDetect > 3 then
Detection_A1:Set("The number of Pets exceeds 3 \nplease go to the private server \nto use this feature.","Pet detection (in workspace)")
Detection_A2:Set("The number of Pets exceeds 3 \nplease go to the private server \nto use this feature.","Pet detection (in workspace)")
else
Detection_A1:Set(tostring(PetDetect) .. " (Private Server)","Pet detection (in workspace)")
Detection_A2:Set(tostring(PetDetect) .. " (Private Server)","Pet detection (in workspace)")
end]]
