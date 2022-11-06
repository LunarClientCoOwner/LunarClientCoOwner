loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local uis = game:GetService("UserInputService")
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
	return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end
function securefunc(func)
	task.spawn(function()
		spawn(function()
			pcall(function()
				loadstring(
					func()
				)()
			end)
		end)
	end)
end
function warnnotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "Windows", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "Windows", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function getstate()
	local ClientStoreHandler = require(game.Players.LocalPlayer.Playerscripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.matchState
end
function iscustommatch()
	local ClientStoreHandler = require(game.Players.LocalPlayer.Playerscripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.customMatch
end
function checklagback()
	local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	return isnetworkowner(hrp)
end

GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "v4"
GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "Vape"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "v4"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)

local KitExploit = COB("Utility", {
	["Name"] = "KitMod",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.KitExploit = true
				local kits = {
					["Axolotl"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.axolotl["axolotl-kit"]).AxolotlKit,
					["Beast"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["beast"]["beast-util"]).BeastKit,
					["Dasher"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.dasher["dasher-kit"]).DasherKit,
					["Fisherman"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["fisherman"]["fisherman-util"]).FishermanUtil,
					["IceQueen"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["ice-queen"]["ice-queen-kit"]).IceQueenKit,
					["Santa"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.santa["santa-util"]).SantaUtil,
				}
				kits["Axolotl"]["SWIM_TO_CHARACTER_TIME"] = 0.0000000000001
				kits["Axolotl"]["ACTIVE_COOLDOWN"] = 0.0000000000001
				kits["Beast"]["WALK_SPEED_MULTIPLIER"] = 5
				kits["Beast"]["KNOCKBACK_MULTIPLIER"] = 5
				kits["Dasher"]["DASH_COOLDOWN"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME_BEFORE_CHARGING_STATE"] = 0.0000000000001
				kits["Dasher"]["TOTAL_CHARGE_TIME"] = 0.0000000000001
				kits["Fisherman"]["minigameDuration"] = 60
				kits["Fisherman"]["markerSize"] = UDim2.fromScale(0.05, 1)
				kits["Fisherman"]["totalDecaySpeedSec"] = 2
				kits["Fisherman"]["startingMarkerIncrementSpeed"] = 0.2
				kits["Fisherman"]["holdMinimumMarkerIncrementSpeed"] = 0.1
				kits["Fisherman"]["markerIncrementAmount"] = 0.025
				kits["Fisherman"]["fishZoneSize"] = UDim2.fromScale(0,5, 1)
				kits["Fisherman"]["fishZoneSpeedMultiplier"] = 5
				kits["Fisherman"]["fishZoneMoveCooldown"] = 10
				kits["Fisherman"]["fillAmount"] = 0.1
				kits["Fisherman"]["drainAmount"] = 0.0001
				kits["IceQueen"]["DAMAGE_REQUIREMENT"] = 0.0000000000001
				kits["IceQueen"]["PASSIVE_STACK_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["PROC_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["BAR_COUNT"] = 4
				kits["IceQueen"]["BASE_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["BASE_SPEED_MULTIPLIER"] = 99
				kits["IceQueen"]["BASE_SLOW_LENGHT"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["ICE_SWORD_SLOW_LENGTH"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_STUN_DURATION"] = 99
				kits["IceQueen"]["PASSIVE_EXPIRATION_TIME"] = 99
				kits["Santa"]["BOMB_DROP_DELAY"] = 0.0000000000001
				kits["Santa"]["TOTAL_BOMBS"] = 99
				kits["Santa"]["DROP_HEIGHT"] = 150
				kits["Santa"]["DROP_DELAY"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.KitExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = false
})
local ItemExploit = COB("Utility", {
	["Name"] = "ItemMod",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ItemExploit = true
				local SW = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.stopwatch["stopwatch-constants"]).StopwatchConstants
				local TB = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.twirlblade["twirlblade-util"]).TwirlbladeUtil
				local CS = require(game:GetService("ReplicatedStorage").TS.games.bedwars["charge-shield"]["charge-shield-util"]).ChargeShieldUtil
				local GH = require(game:GetService("ReplicatedStorage").TS["grappling-hook"]["grappling-hook-util"])
				local HM = require(game:GetService("ReplicatedStorage").TS.vehicle.helicopter["helicopter-missile"])
				SW["DURATION"] = 60
				SW["EFFECT_DURATION"] = 60
				TB["SPIN_DAMAGE"] = 100
				CS["CHARGE_SHIELD_COOLDOWN_SEC"] = 0.0000000000001
				CS["CHARGE_DURATION"] = 10
				CS["CHARGE_SPEED_MULTIPLIER"] = 5
				CS["MAX_HIT_DISTANCE"] = 50
				CS["MAX_HIT_ANGLE"] = 360
				CS["MAX_HIT_HEIGHT"] = 100
				CS["HIT_DAMAGE"] = 100
				CS["VERTICAL_KNOCKBACK"] = 5
				CS["HORIZONTAL_KNOCKBACK"] = 5
				GH["SPEED"] = 5000
				GH["FIRE_COOLDOWN"] = 0.0000000000001
				GH["HIT_PLAYER_COOLDOWN"] = 0.0000000000001
				GH["HIT_BLOCK_COOLDOWN"] = 0.0000000000001
				HM["MISSLE_FIRE_RATE"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.ItemExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = false
})
local InfJump = COB("Utility", {
	["Name"] = "FlyJump",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InfJump = true
				game:GetService("UserInputService").JumpRequest:connect(function()
					if not ScriptSettings.InfJump == true then return end
					if not ScriptSettings.InfJump_Alr then
					    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
					    ScriptSettings.InfJump_Alr = true
					    task.wait(0.125)
					    ScriptSettings.InfJump_Alr = false
					else
					    task.wait()
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.InfJump = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = false
})
local MageAnimation = COB("Render", {
	["Name"] = "MageAnim",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.MageAnimation = true
				local Animate = game:GetService("Players").LocalPlayer.Character.Animate
				Animate.idle.Animation1.AnimationId = "http://www.VxpingOnRoblox.com/asset/?id=707742142"
				Animate.idle.Animation2.AnimationId = "http://www.VxpingOnRoblox.com/asset/?id=707855907"
				Animate.walk.WalkAnim.AnimationId = "http://www.VxpingOnRoblox.com/asset/?id=707897309"
				Animate.run.RunAnim.AnimationId = "http://www.VxpingOnRoblox.com/asset/?id=707861613"
				Animate.jump.JumpAnim.AnimationId = "http://www.VxpingOnRoblox.com/asset/?id=707853694"
				Animate.climb.ClimbAnim.AnimationId = "http://www.VxpingOnRoblox.com/asset/?id=707826056"
				Animate.fall.FallAnim.AnimationId = "http://www.VxpingOnRoblox.com/asset/?id=707829716"
			end)
		else
			pcall(function()
				ScriptSettings.MageAnimation = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "epic mage animation"
})
local AnimDisabler = COB("Utility", {
	["Name"]  = "AnimDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnimDisabler = true
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				while task.wait(1.5) do
					if not ScriptSettings.AnimDisabler == true then return end
					repeat task.wait() until game:GetService("Players").LocalPlayer.Character.Animate
					game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				end
			end)
		else
			pcall(function()
				ScriptSettings.AnimDisabler = false
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Removes your animation"
})
local Shaders = COB("Render", {
	["Name"] = "Shaders",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				print("shaders enabled")
				game:GetService("Lighting"):ClearAllChildren()
				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 2

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.14
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.ClockTime = 6.7
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 1000
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)

				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 4

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.3
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.TimeOfDay = "07:30:00"
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 300
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)
			end)
		else
			pcall(function()
				ScriptSettings.Shaders = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Custom Shaders"
})
local HostCrasher = COB("Utility", {
	["Name"] = "HostCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.HostCrasher = true
				for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                    local args = {
                        [1] = "",
                        [2] = {
                            [1] = {
                                ["userId"] = plr.UserId,
                                ["name"] = plr.Name,
                                ["displayName"] = plr.DisplayName
                            }
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:CohostPlayer"):FireServer(unpack(args))
				end
				while task.wait() do
				    if not ScriptSettings.HostCrasher == true then return end
				    for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                        local args = {
                            [1] = "",
                            [2] = {
                                [1] = {
                                    ["userId"] = plr.UserId,
                                    ["name"] = plr.Name,
                                    ["displayName"] = plr.DisplayName
                                },
                                [2] = math.random(1,999999999)
                            }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:SetPlayerMaxHealth"):FireServer(unpack(args))
				    end
				end
			end)
		else
			pcall(function()
				ScriptSettings.HostCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Requires you to be host to let it work"
})

	local night = COB("World", {
	["Name"] = "Night",
	["Hovertext"] = "Changes Day to night",
	["Function"] = function(callback)
		if callback then
			game.Lighting.TimeOfDay = "1:00:00"
		else
			game.Lighting.TimeOfDay = "14:00:00"
		end
	end
})

youtubedetector = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Youtube detector/star detector", 
	["Function"] = function(callback)
		if callback then
			for i, plr in pairs(Players:GetChildren()) do
				if plr:IsInGroup(4199740) and plr:GetRankInGroup(4199740) >= 1 then
					createwarning("Vape", "Youtuber found " .. plr.Name .. "(" .. plr.DisplayName .. ")", 20)
					end
				end
			end
		end
})

local void = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Void",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=9851144466"
            game.Lighting.Sky.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=9851144249"
            game.Lighting.Sky.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=9851144099"
            game.Lighting.Sky.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=9851143942"
            game.Lighting.Sky.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=9851143761"
            game.Lighting.Sky.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=9851143257"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
            game.Lighting.Sky.SkyboxBk = "http://www.VxpingOnRoblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.VxpingOnRoblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.VxpingOnRoblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.VxpingOnRoblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.VxpingOnRoblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.VxpingOnRoblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

local RagdollDisabler = COB("Utility", {
	["Name"]  = "RagdollDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.RagdollDisabler = true
				while task.wait(0.1) do
					if not ScriptSettings.RagdollDisabler == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
					task.wait(0.025)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
		else
			pcall(function()
				ScriptSettings.SlowDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Ragdolls to bypass ac"
})
local TpToForceShield = COB("Utility", {
	["Name"]  = "TpToForceShield",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.TpToForceShield = true
				while task.wait() do
					if not ScriptSettings.TpToForceShield == true then return end
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1000,3009,3900)
        task.wait(1)
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(NewPosition.X,NewPosition.Y,NewPosition.Z)
				end
			end)
		else
			pcall(function()
				ScriptSettings.TpToForceShield = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Get tp to the force shield"
})

local CollectAllDrops = COB("Utility", {
    ["Name"]  = "CollectAllDrops",
    ["Function"] = function(callback)
        if callback then
            pcall(function()
                ScriptSettings.CollectAllDrops = true
                while task.wait() do
                    if not ScriptSettings.CollectAllDrops == true then return end
                    for i,v in pairs(game:GetService("Workspace").ItemDrops:GetChildren()) do
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,2,0)
                    end
                end
            end)
        else
            pcall(function()
                ScriptSettings.CollectAllDrops = false
            end)
        end
    end,
    ["Default"] = false,
    ["HoverText"] = false
})

local AnticheatDisabler = COB("Utility", {
	["Name"] = "AnticheatDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnticheatDisabler = true
                                        local function disablerFunction()
	     local lplr = game.Players.LocalPlayer
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
        repeat task.wait() until lplr.Character.Humanoid.MoveDirection ~= Vector3.zero
        task.wait(0.2)
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        workspace.Gravity = 192.6    
    end
             disablerFunction()
			end)
		else
			pcall(function()
				ScriptSettings.AnticheatDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Disables Anticheat"
})

local CustomAntivoid = COB("World", {
	["Name"] = "CustomAntivoid",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomAntivoid = true
				--repeat task.wait(0.3) until getstate() == 1
				local part = Instance.new("Part")
				part.Name = "AVOID_PART"
				part.Anchored = true
				part.Color = Color3.fromRGB(255,65,65)
				part.Size = Vector3.new(5000,3,5000)
				part.Parent = game:GetService("Workspace")
				part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
				ScriptSettings.CustomAntivoid_Part = part
				part.Touched:Connect(function(v)
					if v.Parent:FindFirstChild("Humanoid") and v.Parent.Parent.Name == game:GetService("Players").LocalPlayer.Name and not v.Parent:FindFirstChild("Humanoid").Health == 0 then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						--[[
							local tptimes = 0
							repeat
								task.wait()
								tptimes = tptimes + 1
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame / 2
							until tptimes = 10
						]]--
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.CustomAntivoid = false
				ScriptSettings.CustomAntivoid_Part:Destroy()
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "custom anti void (broken on beach map)"
})

			Lagbackup = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
				["Name"] = "Lagback up", 
				["Function"] = function(callback)
					if callback then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(99999,99999,99999)
						Lagbackup["ToggleButton"](false)
						end
					end
			})

	Instakillrell = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "fake troll ban",
	["Function"] = function(callback)
		if callback then
			game.Players.LocalPlayer:Kick("You have Been temporarily banned. Remaining ban: 4953 weeks 6 days 3 hours 58 minutes 48 seconds")
		end
	end,
})

local skybox = COB("World", {
	["Name"] = "Purple Skybox",
	["HoverText"] = false
	["Function"] = function(callback)
		if callback then
			local sky = Instance.new("Sky",game.Lighting)
			sky.MoonAngularSize = "0"
			sky.MoonTextureId = "rbxassetid://6444320592"
			sky.SkyboxBk = "rbxassetid://8107841671"
			sky.SkyboxDn = "rbxassetid://6444884785"
			sky.SkyboxFt = "rbxassetid://8107841671"
			sky.SkyboxLf = "rbxassetid://8107841671"
			sky.SkyboxRt = "rbxassetid://8107841671"
			sky.SkyboxUp = "rbxassetid://8107849791"
			sky.SunTextureId = "rbxassetid://6196665106"
		else
			local sky2 = Instance.new("Sky",game.Lighting)
			sky2.MoonAngularSize = "11"
			sky2.MoonTextureId = "rbxasset://sky/moon.jpg"
			sky2.SkyboxBk = "rbxassetid://7018684000"
			sky2.SkyboxDn = "rbxassetid://6334928194"
			sky2.SkyboxFt = "rbxassetid://7018684000"
			sky2.SkyboxLf = "rbxassetid://7018684000"
			sky2.SkyboxRt = "rbxassetid://7018684000"
			sky2.SkyboxUp = "rbxassetid://7018689553"
			sky2.SunTextureId = "rbxasset://sky/sun.jpg"
			sky2.SunAngularSize = "21"
		end
	end
})


local OldAcBypass = COB("Utility", {
    Name = "OldAcBypass",
    Function = function(callback) 
        if callback then
			local lplr = game.Players.LocalPlayer
            local cam = workspace.CurrentCamera
            local oldchar
local clone

oldchar = lplr.Character
oldchar.Archivable = true
clone = oldchar:Clone()
oldchar.PrimaryPart.Anchored = false

local humc = oldchar.Humanoid:Clone()
humc.Parent = lplr.Character
game:GetService("RunService").Stepped:connect(function()
local mag = (clone.PrimaryPart.Position - oldchar.PrimaryPart.Position).Magnitude
if mag >= 20 then
oldchar:SetPrimaryPartCFrame(clone.PrimaryPart.CFrame)
end
end)
pcall(function()
oldchar.PrimaryPart:GetPropertyChangedSignal("CFrame"):connect(function()
clone:SetPrimaryPartCFrame(oldchar.PrimaryPart.CFrame)
end)
end)

cam.CameraSubject = clone.Humanoid 
clone.Parent = workspace
lplr.Character = clone
        else
            print("cope")
	    end
    end,
    Default = false,
})

local GravityFly = COB("Blatant", {
    Name = "GravityFly",
    Function = function(callback) 
        if callback then
			game.Workspace.Gravity = 0
        else
            game.Workspace.Gravity = 192.6
	    end
    end,
    Default = false,
    HoverText = false
})

COB("Utility", {
    Name = "CustomMatchDisabler",
    HoverText = false
    Function = function(v)
        if v then
            local message = "/setAC Disabled"
            wait(0.5)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/setAc Disabled", 'All')
        else
            wait(0.5)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/setAc Enabled", 'All')
        end
    end
})

local executeInfiniteYield = COB("World", {
    Name = "Load da InfiniteYield",
    Function = function(callback) 
        if callback then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
	else
         wait(0.5)
             game.Workspace.Gravity = 192.6
	    end
    end,
	Default = false,
    HoverText = false
})


local AnticheatDisabler = COB("Render", {
    Name = "NickHider",
    Function = function(callback) 
        if callback then
         while game:IsLoaded() == false do wait() end
local fakeplr = {["Name"] = "TanqR", ["UserId"] = "84743203"}
local otherfakeplayers = {["Name"] = "Unskilled", ["UserId"] = "17889321"}
local lplr = game:GetService("Players").LocalPlayer

local function plrthing(obj, property)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v ~= lplr then
            obj[property] = obj[property]:gsub(v.Name, otherfakeplayers["Name"])
            obj[property] = obj[property]:gsub(v.DisplayName, otherfakeplayers["Name"])
            obj[property] = obj[property]:gsub(v.UserId, otherfakeplayers["UserId"])
        else
            obj[property] = obj[property]:gsub(v.Name, fakeplr["Name"])
            obj[property] = obj[property]:gsub(v.DisplayName, fakeplr["Name"])
            obj[property] = obj[property]:gsub(v.UserId, fakeplr["UserId"])
        end
    end
end

local function newobj(v)
    if v:IsA("TextLabel") or v:IsA("TextButton") then
        plrthing(v, "Text")
        v:GetPropertyChangedSignal("Text"):connect(function()
            plrthing(v, "Text")
        end)
    end
    if v:IsA("ImageLabel") then
        plrthing(v, "Image")
        v:GetPropertyChangedSignal("Image"):connect(function()
            plrthing(v, "Image")
        end)
    end
end

for i,v in pairs(game:GetDescendants()) do
    newobj(v)
end
game.DescendantAdded:connect(newobj)
        end
    end,
    Default = false,
    HoverText = false
})

local AnticheatDisabler = COB("World", {
    Name = "Load da Rektsky",
    Function = function(callback) 
        if callback then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/8pmX8/rektsky4roblox/main/mainscript.lua"))()
	else
         wait(0.5)
             game.Workspace.Gravity = 192.6
	    end
    end,
    Default = false,
    HoverText = false
})
