local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/qvrwd/etarry/main/libraries/notification/akalinotif"))()
_G.NotifCredits = false
local AimBone = "UpperTorso" -- this is default change if u want
getgenv().pingsets = 0.12837465 -- this is default change if u want

if _G.NotifCredits == true then
local Notify = NotifyLibrary.Notify
Notify({
	Title = "Vape4DH",
	Description = "Credits to: Xylex (ui library), then and kittenassist src",
	Duration = 2
})
else
print("a")
end

local Notify = NotifyLibrary.Notify
Notify({
	Title = "Vape4DH",
	Description = "Loading",
	Duration = 2
})
wait("0.1")

local CC = game:GetService'Workspace'.CurrentCamera
local Plr
local enabled = false
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
local guimain = Instance.new("Folder", game.CoreGui)
placemarker.Name = "Placemarkerverypro"

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(1, 0, 1, 0)
    a.BackgroundTransparency = 0
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(30, 30)
    return(e)
end

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat wait() until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild(AimBone), Color3.fromRGB(0, 76, 153), 0.0, 0)
    handler.Name = player.Name
    player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(AimBone) end)
    
	local TextLabel = Instance.new("TextLabel", handler)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, -50)
	TextLabel.Size = UDim2.new(0, 100, 0, 100)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.TextSize = 14
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	TextLabel.Text = 'Name: '..player.Name
	TextLabel.ZIndex = 10
	
	spawn(function()
        while wait() do
            if player.Character then
                --TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
            end
        end
	end)
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(function(Player)
    noob(Player)
end)

game.Players.PlayerRemoving:Connect(function(player)
    guimain[player.Name]:Destroy()
end)

spawn(function()
    placemarker.Anchored = true
    placemarker.CanCollide = false
    placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
    placemarker.Transparency = 10
    makemarker(placemarker, placemarker, Color3.fromRGB(255, 98, 0), 2, 0)
end)    

mouse.KeyDown:Connect(function(k)
    if k ~= "c" then return end
    if enabled then
        enabled = false
		if getgenv().NotifMode == true then
			local Notify = NotifyLibrary.Notify
			Notify({
				Title = "Vape4DH",
				Description = "Unlocked",
				Duration = 2
			})
		end
		if getgenv().ViewMode == true then
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		end
		if getgenv().ChatMode == true then
			local A_1 = "V4DH : Unlocked"
			local A_2 = "All"
			local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
			Event:FireServer(A_1, A_2)
		end
        getgenv().targetenabled = false
		getgenv().targetenabledV2 = false
    else
        getgenv().targetenabled = true
		getgenv().targetenabledV2 = true
        enabled = true 
        Plr = getClosestPlayerToCursor()
			if getgenv().NotifMode == true then
				local Notify = NotifyLibrary.Notify
				Notify({
					Title = "Vape4DH",
					Description = ""..Plr.DisplayName.."/"..Plr.Name,
					Duration = 2
				})
			end
			if getgenv().ViewMode == true then
				local person = Plr
				game.Workspace.CurrentCamera.CameraSubject = person.Character
			end
			if getgenv().ChatMode == true then
				local A_3 = "V4DH : "..Plr.DisplayName.."/"..Plr.Name
				local A_4 = "All"
				local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
				Event:FireServer(A_3, A_4)
			end
			if getgenv().TargetStrafe == true then
				repeat
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(Plr.Character).CFrame + Vector3.new(getgenv().TargetStrafeX, nil, nil)
					wait(getgenv().TargetStrafeDelay)
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(Plr.Character).CFrame + Vector3.new(getgenv().TargetStrafeX2, nil, nil)
					wait(getgenv().TargetStrafeDelay)
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(Plr.Character).CFrame + Vector3.new(nil, getgenv().TargetStrafeY, nil)
					wait(getgenv().TargetStrafeDelay)
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(Plr.Character).CFrame + Vector3.new(nil, getgenv().TargetStrafeY2, nil)
					wait(getgenv().TargetStrafeDelay)
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(Plr.Character).CFrame + Vector3.new(nil, nil, getgenv().TargetStrafeZ)
					wait(getgenv().TargetStrafeDelay)
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(Plr.Character).CFrame + Vector3.new(nil, nil, getgenv().TargetStrafeZ2)
				until 		getgenv().targetenabled == false
		end
        if getgenv().TargetStrafeV2 == true then
			repeat
                wait()
				getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(Plr.Character).CFrame + Vector3.new(getgenv().TargetStrafeXV2, getgenv().TargetStrafeYV2, getgenv().TargetStrafeZV2)
			until getgenv().targetenabledV2 == false
        end
    end    
end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
   return closestPlayer
end

	game:GetService"RunService".Stepped:connect(function()
		if enabled and Plr.Character and Plr.Character:FindFirstChild(AimBone) then
			placemarker.CFrame = CFrame.new(Plr.Character[AimBone].Position+(Plr.Character[AimBone].Velocity*getgenv().pingsets))
		else
			placemarker.CFrame = CFrame.new(0, 9999, 0)
		end
	end)

	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character[AimBone].Position+(Plr.Character[AimBone].Velocity*getgenv().pingsets)
			return old(unpack(args))
		end
		return old(...)
	end)


shared.VapeIndependent = true
shared.CustomSaveVape = "VapeUntitled"
local uilib = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()

local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local uis = game:GetService("UserInputService")
local cam = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):connect(function()
	cam = (workspace.CurrentCamera or workspace:FindFirstChild("Camera") or Instance.new("Camera"))
end)
local function runcode(func)
	func()
end
local RenderStepTable = {}
local StepTable = {}
local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end
local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end
local healthColorToPosition = {
	[Vector3.new(Color3.fromRGB(255, 28, 0).r,
  Color3.fromRGB(255, 28, 0).g,
  Color3.fromRGB(255, 28, 0).b)] = 0.1;
	[Vector3.new(Color3.fromRGB(250, 235, 0).r,
  Color3.fromRGB(250, 235, 0).g,
  Color3.fromRGB(250, 235, 0).b)] = 0.5;
	[Vector3.new(Color3.fromRGB(27, 252, 107).r,
  Color3.fromRGB(27, 252, 107).g,
  Color3.fromRGB(27, 252, 107).b)] = 0.8;
}
local min = 0.1
local minColor = Color3.fromRGB(255, 28, 0)
local max = 0.8
local maxColor = Color3.fromRGB(27, 252, 107)

local function HealthbarColorTransferFunction(healthPercent)
	if healthPercent < min then
		return minColor
	elseif healthPercent > max then
		return maxColor
	end


	local numeratorSum = Vector3.new(0,0,0)
	local denominatorSum = 0
	for colorSampleValue, samplePoint in pairs(healthColorToPosition) do
		local distance = healthPercent - samplePoint
		if distance == 0 then
			
			return Color3.new(colorSampleValue.x, colorSampleValue.y, colorSampleValue.z)
		else
			local wi = 1 / (distance*distance)
			numeratorSum = numeratorSum + wi * colorSampleValue
			denominatorSum = denominatorSum + wi
		end
	end
	local result = numeratorSum / denominatorSum
	return Color3.new(result.x, result.y, result.z)
end
local function CalculateObjectPosition(pos)
	local newpos = cam:WorldToViewportPoint(cam.CFrame:pointToWorldSpace(cam.CFrame:pointToObjectSpace(pos)))
	return Vector2.new(newpos.X, newpos.Y)
end

local function CalculateLine(startVector, endVector, obj)
	local Distance = (startVector - endVector).Magnitude
	obj.Size = UDim2.new(0, Distance, 0, 2)
	obj.Position = UDim2.new(0, (startVector.X + endVector.X) / 2, 0, ((startVector.Y + endVector.Y) / 2) - 36)
	obj.Rotation = math.atan2(endVector.Y - startVector.Y, endVector.X - startVector.X) * (180 / math.pi)
end

shared.vapeteamcheck = function(plr)
	return (uilib["ObjectsThatCanBeSaved"]["Teams by colorToggle"]["Api"]["Enabled"] and (plr.Team ~= lplr.Team or (lplr.Team == nil or #lplr.Team:GetPlayers() == #game:GetService("Players"):GetChildren())) or uilib["ObjectsThatCanBeSaved"]["Teams by colorToggle"]["Api"]["Enabled"] == false)
end
local function targetCheck(plr, check)
	if not check then
		return true
	end
	local check2 = true
	if check2 then
		check = plr.Character ~= nil
	end
	if check2 then
		check2 = plr.Character.Humanoid.GetState(plr.Character.Humanoid) ~= Enum.HumanoidStateType.Dead
	end
	if check2 then
		check2 = plr.Character.FindFirstChild(plr.Character, "ForceField") == nil
	end
	return check2
end
local function friendCheck(plr, recolor)
	if uilib["ObjectsThatCanBeSaved"]["Use FriendsToggle"]["Api"]["Enabled"] then
		local friend = (table.find(uilib["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name) and uilib["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectListEnabled"][table.find(uilib["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name)] and true or nil)
		if recolor then
			return (friend and uilib["ObjectsThatCanBeSaved"]["Recolor visualsToggle"]["Api"]["Enabled"] and true or nil)
		else
			return friend
		end
	end
	return nil
end
local function getPlayerColor(plr)
	return (friendCheck(plr, true) and Color3.fromHSV(uilib["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Hue"], uilib["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Sat"], uilib["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Value"]) or tostring(plr.TeamColor) ~= "White" and plr.TeamColor.Color)
end
local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end
isPlayerTargetable = function(plr)
    return lplr ~= plr and shared.vapeteamcheck(plr) and friendCheck(plr) == nil
end
local function isPlayerTargetable(plr, target, friend)
    return plr ~= lplr and plr and (friend and friendCheck(plr) == nil or (not friend)) and isAlive(plr) and targetCheck(plr, target) and shared.vapeteamcheck(plr)
end

local Combat = uilib["ObjectsThatCanBeSaved"]["CombatWindow"]["Api"]

local Blatant = uilib["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"]

local Render = uilib["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"]

local Utility = uilib["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"]

local World = uilib["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"]

local radarcam = Instance.new("Camera")
radarcam.FieldOfView = 45
local Radar = uilib.CreateCustomWindow({
	["Name"] = "Radar", 
	["Icon"] = "vape/assets/RadarIcon1.png",
	["IconSize"] = 16
})
local RadarColor = Radar.CreateColorSlider({
	["Name"] = "Player Color", 
	["Function"] = function(val) end
})
local RadarFrame = Instance.new("Frame")
RadarFrame.BackgroundColor3 = Color3.new(0, 0, 0)
RadarFrame.BorderSizePixel = 0
RadarFrame.BackgroundTransparency = 0.5
RadarFrame.Size = UDim2.new(0, 250, 0, 250)
RadarFrame.Parent = Radar.GetCustomChildren()
local RadarBorder1 = RadarFrame:Clone()
RadarBorder1.Size = UDim2.new(0, 6, 0, 250)
RadarBorder1.Parent = RadarFrame
local RadarBorder2 = RadarBorder1:Clone()
RadarBorder2.Position = UDim2.new(0, 6, 0, 0)
RadarBorder2.Size = UDim2.new(0, 238, 0, 6)
RadarBorder2.Parent = RadarFrame
local RadarBorder3 = RadarBorder1:Clone()
RadarBorder3.Position = UDim2.new(1, -6, 0, 0)
RadarBorder3.Size = UDim2.new(0, 6, 0, 250)
RadarBorder3.Parent = RadarFrame
local RadarBorder4 = RadarBorder1:Clone()
RadarBorder4.Position = UDim2.new(0, 6, 1, -6)
RadarBorder4.Size = UDim2.new(0, 238, 0, 6)
RadarBorder4.Parent = RadarFrame
local RadarBorder5 = RadarBorder1:Clone()
RadarBorder5.Position = UDim2.new(0, 0, 0.5, -1)
RadarBorder5.BackgroundColor3 = Color3.new(1, 1, 1)
RadarBorder5.Size = UDim2.new(0, 250, 0, 2)
RadarBorder5.Parent = RadarFrame
local RadarBorder6 = RadarBorder1:Clone()
RadarBorder6.Position = UDim2.new(0.5, -1, 0, 0)
RadarBorder6.BackgroundColor3 = Color3.new(1, 1, 1)
RadarBorder6.Size = UDim2.new(0, 2, 0, 124)
RadarBorder6.Parent = RadarFrame
local RadarBorder7 = RadarBorder1:Clone()
RadarBorder7.Position = UDim2.new(0.5, -1, 0, 126)
RadarBorder7.BackgroundColor3 = Color3.new(1, 1, 1)
RadarBorder7.Size = UDim2.new(0, 2, 0, 124)
RadarBorder7.Parent = RadarFrame
local RadarMainFrame = Instance.new("Frame")
RadarMainFrame.BackgroundTransparency = 1
RadarMainFrame.Size = UDim2.new(0, 250, 0, 250)
RadarMainFrame.Parent = RadarFrame
Radar.GetCustomChildren().Parent:GetPropertyChangedSignal("Size"):connect(function()
	RadarFrame.Position = UDim2.new(0, 0, 0, (Radar.GetCustomChildren().Parent.Size.Y.Offset == 0 and 45 or 0))
end)
players.PlayerRemoving:connect(function(plr)
	if RadarMainFrame:FindFirstChild(plr.Name) then
		RadarMainFrame[plr.Name]:Remove()
	end
end)
uilib["ObjectsThatCanBeSaved"]["GUIWindow"]["Api"].CreateCustomToggle({
	["Name"] = "Radar", 
	["Icon"] = "vape/assets/RadarIcon2.png", 
	["Function"] = function(callback)
		Radar.SetVisible(callback)
		if callback then
			BindToRenderStep("Radar", 1, function() 
				local v278 = (CFrame.new(0, 0, 0):inverse() * cam.CFrame).p * 0.2 * Vector3.new(1, 1, 1);
				local v279, v280, v281 = cam.CFrame:ToOrientation();
				local u90 = v280 * 180 / math.pi;
				local v277 = 0 - u90;
				local v276 = v278 + Vector3.new(0, 0, 0);
				radarcam.CFrame = CFrame.new(v276 + Vector3.new(0, 50, 0)) * CFrame.Angles(0, -v277 * (math.pi / 180), 0) * CFrame.Angles(-90 * (math.pi / 180), 0, 0)
				for i,plr in pairs(players:GetChildren()) do
					local thing
					if RadarMainFrame:FindFirstChild(plr.Name) then
						thing = RadarMainFrame[plr.Name]
						if thing.Visible then
							thing.Visible = false
						end
					else
						thing = Instance.new("Frame")
						thing.BackgroundTransparency = 0
						thing.Size = UDim2.new(0, 4, 0, 4)
						thing.BorderSizePixel = 1
						thing.BorderColor3 = Color3.new(0, 0, 0)
						thing.BackgroundColor3 = Color3.new(0, 0, 0)
						thing.Visible = false
						thing.Name = plr.Name
						thing.Parent = RadarMainFrame
					end
					
					if isPlayerTargetable(plr, false, false) then
						local v238, v239 = radarcam:WorldToViewportPoint((CFrame.new(0, 0, 0):inverse() * plr.Character.HumanoidRootPart.CFrame).p * 0.2)
						thing.Visible = true
						thing.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(RadarColor["Hue"], RadarColor["Sat"], RadarColor["Value"])
						thing.Position = UDim2.new(math.clamp(v238.X, 0.03, 0.97), -2, math.clamp(v238.Y, 0.03, 0.97), -2)
					end
				end
			end)
		else
			UnbindFromRenderStep("Radar")
			RadarMainFrame:ClearAllChildren()
		end
	end, 
	["Priority"] = 1
})


local function Cape(char, texture)
	for i,v in pairs(char:GetDescendants()) do
		if v.Name == "Cape" then
			v:Remove()
		end
	end
			local hum = char:WaitForChild("Humanoid")
			local torso = nil
			if hum.RigType == Enum.HumanoidRigType.R15 then
			torso = char:WaitForChild("UpperTorso")
			else
			torso = char:WaitForChild("Torso")
			end
			local p = Instance.new("Part", torso.Parent)
			p.Name = "Cape"
			p.Anchored = false
			p.CanCollide = false
			p.TopSurface = 0
			p.BottomSurface = 0
			p.FormFactor = "Custom"
			p.Size = Vector3.new(0.2,0.2,0.2)
			p.Transparency = 1
			local decal = Instance.new("Decal", p)
			decal.Texture = texture
			decal.Face = "Back"
			local msh = Instance.new("BlockMesh", p)
			msh.Scale = Vector3.new(9,17.5,0.5)
			local motor = Instance.new("Motor", p)
			motor.Part0 = p
			motor.Part1 = torso
			motor.MaxVelocity = 0.01
			motor.C0 = CFrame.new(0,2,0) * CFrame.Angles(0,math.rad(90),0)
			motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
			local wave = false
			repeat wait(1/44)
				decal.Transparency = torso.Transparency
				local ang = 0.1
				local oldmag = torso.Velocity.magnitude
				local mv = 0.002
				if wave then
					ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
					wave = false
				else
					wave = true
				end
				ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
				motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) --+ mv
				motor.DesiredAngle = -ang
				if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
					motor.MaxVelocity = 0.04
				end
				repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
				if torso.Velocity.magnitude < 0.1 then
					wait(0.1)
				end
			until not p or p.Parent ~= torso.Parent
end

local FixLock = Combat.CreateOptionsButton({
    ["Name"] = "FixLock", 
    ["Function"] = function(callback) 
        if callback then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
					v:Destroy()
				end
			end
			game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
				repeat
					wait()
				until game.Players.LocalPlayer.Character
				char.ChildAdded:Connect(function(child)
					if child:IsA("Script") then 
						wait(0.1)
						if child:FindFirstChild("LocalScript") then
							child.LocalScript:FireServer()
            else
        print('Only From Vape V4 Cirus Edit')
                        end
					end
				end)
			end)
        end
    end,
    ["HoverText"] = "Fixes aimlock/silent aim", 
    ["Default"] = false,
})

local Silent = Combat.CreateOptionsButton({
    ["Name"] = "SilentAim", 
    ["Function"] = function(callback) 
        if callback then
        print("Enabled!")
        else
        print("Disabled!")
        end
    end,
    ["HoverText"] = "Keybind is C", 
    ["Default"] = false,
    ["ExtraText"] = function() return "DaHood" end
})

getgenv().pingsets = 0.12837465
Silent.CreateSlider({
    ["Name"] = "Prediction",
    ["Min"] = 0, 
	["Max"] = 1,
    ["HoverText"] = "Prediction",
    ["Function"] = function(val)
		getgenv().pingsets = val
    end,
	["Default"] = 0.129483474
})

local AimBoneVal = {["Value"] = "Head"}
AimBone = "UpperTorso"
Silent.CreateDropdown({
    ["Name"] = "Aimbone",
	["List"] = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso/Penis"},
    ["HoverText"] = "AimBone!!!",
    ["Function"] = function(value)
	AimBoneVal["Value"] = value
	if AimBoneVal["Value"] == "Head" then
		AimBone = "Head"
	end
	if AimBoneVal["Value"] == "UpperTorso" then
		AimBone = "UpperTorso"
	end
	if AimBoneVal["Value"] == "HumanoidRootPart" then
		AimBone = "HumanoidRootPart"
	end
	if AimBoneVal["Value"] == "LowerTorso/Penis" then
		AimBone = "LowerTorso"
	end
    end,
})

local Veryfirepro = Instance.new("Fire", game.Workspace)
Veryfirepro.Parent = game.Workspace.Placemarkerverypro

FireMode = Silent.CreateToggle({
	["Name"] = "Fire Mode",
	["Function"] = function(callback)
    if callback then
        Veryfirepro.Enabled = true
        else
        Veryfirepro.Enabled = false
        end
    end,
})

Silent.CreateColorSlider({
    ["Name"] = "Fire Color",
    ["HoverText"] = "fire color",
    ["Function"] = function(hue, sat, val)
        Veryfirepro.Color = Color3.fromHSV(hue, sat, val)
    end
})

Silent.CreateSlider({
    ["Name"] = "Fire Size",
    ["Min"] = 0, 
	["Max"] = 100,
    ["HoverText"] = "fire size",
    ["Function"] = function(val)
        Veryfirepro.Size = val
    end
})

Silent.CreateSlider({
    ["Name"] = "Fire Heat",
    ["Min"] = 0, 
	["Max"] = 100,
    ["HoverText"] = "fire heat",
    ["Function"] = function(val)
        Veryfirepro.Heat = val
    end
})

Silent.CreateToggle({
	["Name"] = "View Mode",
	["Function"] = function(state)
	    getgenv().ViewMode = state
    end,
})

Silent.CreateToggle({
	["Name"] = "Notification Mode",
	["Function"] = function(state)
	    getgenv().NotifMode = state
    end,
})

Silent.CreateToggle({
	["Name"] = "Chat Mode",
	["Function"] = function(state)
		getgenv().ChatMode = state
    end,
})

Silent.CreateToggle({
	["Name"] = "Dot Mode",
	["Function"] = function(state)
    end,
})

Silent.CreateColorSlider({
    ["Name"] = "Dot Color",
    ["HoverText"] = "dot color",
    ["Function"] = function(hue, sat, val)
        Workspace.Placemarkerverypro.PP.Frame.BackgroundColor3 = Color3.fromHSV(hue, sat, val)
    end
})

Silent.CreateSlider({
    ["Name"] = "Dot Transparency",
    ["Min"] = 0, 
	["Max"] = 1,
    ["HoverText"] = "transparency",
    ["Function"] = function(val)
        Workspace.Placemarkerverypro.PP.Frame.BackgroundTransparency = val
    end
})

Silent.CreateSlider({
    ["Name"] = "Dot Size",
    ["Min"] = 0, 
	["Max"] = 100,
    ["HoverText"] = "dot size",
    ["Function"] = function(val)
        Workspace.Placemarkerverypro.PP.Size = UDim2.new(val, 0, val, 0)
    end
})

Silent.CreateToggle({
	["Name"] = "Part Mode",
	["Function"] = function(state)
    end,
})

local partsizeX = {["Value"] = 1}
local partsizeY = {["Value"] = 1}
local partsizeZ = {["Value"] = 1}
Silent.CreateSlider({
    ["Name"] = "X",
    ["Min"] = 0, 
	["Max"] = 100,
    ["HoverText"] = "part size",
    ["Function"] = function(val)
    partsizeX["Value"] = val
        Workspace.Placemarkerverypro.Size = Vector3.new(partsizeX["Value"], partsizeY["Value"], partsizeZ["Value"])
    end
})

Silent.CreateSlider({
    ["Name"] = "Y",
    ["Min"] = 0, 
	["Max"] = 100,
    ["HoverText"] = "part size",
    ["Function"] = function(val)
    partsizeY["Value"] = val
        Workspace.Placemarkerverypro.Size = Vector3.new(partsizeX["Value"], partsizeY["Value"], partsizeZ["Value"])
    end
})

Silent.CreateSlider({
    ["Name"] = "Z",
    ["Min"] = 0, 
	["Max"] = 100,
    ["HoverText"] = "part size",
    ["Function"] = function(val)
    partsizeZ["Value"] = val
        Workspace.Placemarkerverypro.Size = Vector3.new(partsizeX["Value"], partsizeY["Value"], partsizeZ["Value"])
    end
})

local parttexture = {["Value"] = "Plastic"}
parttext = Silent.CreateDropdown({
	["Name"] = "Part Texture",
	["List"] = {"Brick", "Cobblestone", "Concrete", "CorrodedMetal", "DiamondPlate", "Fabric", "Foil", "Forcefield", "Granite", "Glass", "Grass", "Ice", "Marble", "Metal", "Neon", "Pebble", "Plastic", "Sand", "SmoothPlastic", "Slate", "Wood", "WoodPlanks"},
	["Function"] = function(value)
    parttexture["Value"] = value
    if parttexture["Value"] == "Brick" then
    Workspace.Placemarkerverypro.Material = "Brick"
end
if parttexture["Value"] == "Cobblestone" then
    Workspace.Placemarkerverypro.Material = "Cobblestone"
end
if parttexture["Value"] == "Concrete" then
    Workspace.Placemarkerverypro.Material = "Concrete"
end
if parttexture["Value"] == "CorrodedMetal" then
    Workspace.Placemarkerverypro.Material = "CorrodedMetal"
end
if parttexture["Value"] == "DiamondPlate" then
    Workspace.Placemarkerverypro.Material = "DiamondPlate"
end
if parttexture["Value"] == "Fabric" then
    Workspace.Placemarkerverypro.Material = "Fabric"
end
if parttexture["Value"] == "Foil" then
    Workspace.Placemarkerverypro.Material = "Foil"
end
if parttexture["Value"] == "Forcefield" then
    Workspace.Placemarkerverypro.Material = "ForceField"
end
if parttexture["Value"] == "Granite" then
    Workspace.Placemarkerverypro.Material = "Granite"
end
if parttexture["Value"] == "Glass" then
    Workspace.Placemarkerverypro.Material = "Glass"
end
if parttexture["Value"] == "Grass" then
    Workspace.Placemarkerverypro.Material = "Grass"
end
if parttexture["Value"] == "Ice" then
    Workspace.Placemarkerverypro.Material = "Ice"
end
if parttexture["Value"] == "Marble" then
    Workspace.Placemarkerverypro.Material = "Marble"
end
if parttexture["Value"] == "Metal" then
    Workspace.Placemarkerverypro.Material = "Metal"
end
if parttexture["Value"] == "Neon" then
    Workspace.Placemarkerverypro.Material = "Neon"
end
if parttexture["Value"] == "Pebble" then
    Workspace.Placemarkerverypro.Material = "Pebble"
end
if parttexture["Value"] == "Plastic" then
    Workspace.Placemarkerverypro.Material = "Plastic"
end
if parttexture["Value"] == "Sand" then
    Workspace.Placemarkerverypro.Material = "Sand"
end
if parttexture["Value"] == "SmoothPlastic" then
    Workspace.Placemarkerverypro.Material = "SmoothPlastic"
end
if parttexture["Value"] == "Slate" then
    Workspace.Placemarkerverypro.Material = "Slate"
end
if parttexture["Value"] == "Wood" then
    Workspace.Placemarkerverypro.Material = "Wood"
end
if parttexture["Value"] == "WoodPlanks" then
    Workspace.Placemarkerverypro.Material = "WoodPlanks"
end
    end

})

Silent.CreateSlider({
    ["Name"] = "Part Transparency",
    ["Min"] = 0, 
	["Max"] = 1,
    ["HoverText"] = "transparency",
    ["Function"] = function(val)
        Workspace.Placemarkerverypro.Transparency = val
    end
})

Silent.CreateSlider({
    ["Name"] = "Part Reflectance",
    ["Min"] = 0, 
	["Max"] = 1000,
    ["HoverText"] = "uwu reflectance",
    ["Function"] = function(val)
        Workspace.Placemarkerverypro.Reflectance = val
    end
})

Silent.CreateColorSlider({
    ["Name"] = "Part Color",
    ["HoverText"] = "part color",
    ["Function"] = function(hue, sat, val)
        Workspace.Placemarkerverypro.Color = Color3.fromHSV(hue, sat, val)
    end
})



local autoclickercps = {["GetRandomValue"] = function() return 1 end}
local autoclicker = {["Enabled"] = false}
local autoclickermode = {["Value"] = "Sword"}
local autoclickertick = tick()
autoclicker = Combat.CreateOptionsButton({
	["Name"] = "AutoClicker", 
	["Function"] = function(callback)
		if callback then
			BindToRenderStep("AutoClicker", 1, function() 
				if isAlive and autoclickertick <= tick() then
					if autoclickermode["Value"] == "Sword" then
						local tool = lplr and lplr.Character and lplr.Character:FindFirstChildWhichIsA("Tool")
						if tool and uis:IsMouseButtonPressed(0) then
							tool:Activate()
							autoclickertick = tick() + (1 / autoclickercps["GetRandomValue"]()) * Random.new().NextNumber(Random.new(), 0.75, 1)
						end
					else
						if mouse1click and iswindowactive then
							if iswindowactive() and uilib["MainGui"].ScaledGui.ClickGui.Visible == false then
								mouse1click()
								autoclickertick = tick() + (1 / autoclickercps["GetRandomValue"]()) * Random.new().NextNumber(Random.new(), 0.75, 1)
							end
						else
							print("Real Click DOES NOT WORK!")
							if autoclicker["Enabled"] then
								autoclicker["ToggleButton"](false)
							end
						end
					end
				end
			end)
		else
			UnbindFromRenderStep("AutoClicker")
		end
	end
})
autoclickermode = autoclicker.CreateDropdown({
	["Name"] = "Mode",
	["List"] = {"Sword", "RealClick"},
	["Function"] = function() end
})
autoclickercps = autoclicker.CreateTwoSlider({
	["Name"] = "CPS",
	["Min"] = 1,
	["Max"] = 100, 
	["Default"] = 8,
	["Default2"] = 20
})

local NAR = Blatant.CreateOptionsButton({
    ["Name"] = "NoAutoRotate", 
    ["Function"] = function(callback) 
        if callback then
			local humanoid = game.Players.LocalPlayer.Character.Humanoid
            humanoid.AutoRotate = false         
        else
			local humanoid = game.Players.LocalPlayer.Character.Humanoid
            humanoid.AutoRotate = true
    end
end,
    ["HoverText"] = "Does not work after death",
    ["Default"] = false,
})

_G.fakelagEnabledState = false
local fakelagspeed = {["Value"] = 0.00000000000001}
local Player = game:GetService("Players").LocalPlayer
local runService = game:service('RunService')
local fakelag = Blatant.CreateOptionsButton({
    ["Name"] = "FakeLag", 
    ["Function"] = function(state)
    if state == true then
        _G.fakelagEnabledState = true
        while _G.fakelagEnabledState == true do
            Player.Character.HumanoidRootPart.Anchored = true
            wait(fakelagspeed["Value"])
            Player.Character.HumanoidRootPart.Anchored = false
            wait()
        end
    else
        _G.fakelagEnabledState = false
    end
end,
    ["HoverText"] = "Fake lag", 
    ["Default"] = false,
})

fakelag.CreateSlider({
	["Name"] = "Fake lag speed",
	["Min"] = 0,
	["Max"] = 50, 
	["Default"] = 0.00000000001,
    ["Function"] = function(val)
    fakelagspeed["Value"] = val
    end
})

runcode(function()
	local flyspeed = {["Value"] = 1}
	local flyverticalspeed = {["Value"] = 1}
	local flywall = {["Enabled"] = false}
	local flyupanddown = {["Enabled"] = false}
	local flymethod = {["Value"] = "Normal"}
	local flymovemethod = {["Value"] = "MoveDirection"}
	local flykeys = {["Value"] = "Space/LeftControl"}
	local flyplatformtoggle = {["Enabled"] = false}
	local flyplatformstanding = {["Enabled"] = false}
	local flyplatform
	local flyposy = 0
	local flyup = false
	local flydown = false
	local flypress
	local flyendpress
	local flyjumpcf = CFrame.new(0, 0, 0)
	local flyalivecheck = false
	local bodyvelofly
	local w = 0
	local s = 0
	local a = 0
	local d = 0
	local fly = Blatant.CreateOptionsButton({
		["Name"] = "Fly", 
		["Function"] = function(callback)
			if callback then
				if isAlive then
					flyposy = lplr.Character.HumanoidRootPart.CFrame.p.Y
					flyalivecheck = true
				end
				flypress = game:GetService("UserInputService").InputBegan:connect(function(input1)
					if game:GetService("UserInputService"):GetFocusedTextBox() == nil then
						if input1.KeyCode == Enum.KeyCode.W then
							w = -1
						end
						if input1.KeyCode == Enum.KeyCode.S then
							s = 1
						end
						if input1.KeyCode == Enum.KeyCode.A then
							a = -1
						end
						if input1.KeyCode == Enum.KeyCode.D then
							d = 1
						end
						if flyupanddown["Enabled"] then
							local divided = flykeys["Value"]:split("/")
							if input1.KeyCode == Enum.KeyCode[divided[1]] then
								flyup = true
							end
							if input1.KeyCode == Enum.KeyCode[divided[2]] then
								flydown = true
							end
						end
					end
				end)
				flyendpress = game:GetService("UserInputService").InputEnded:connect(function(input1)
					local divided = flykeys["Value"]:split("/")
					if input1.KeyCode == Enum.KeyCode.W then
						w = 0
					end
					if input1.KeyCode == Enum.KeyCode.S then
						s = 0
					end
					if input1.KeyCode == Enum.KeyCode.A then
						a = 0
					end
					if input1.KeyCode == Enum.KeyCode.D then
						d = 0
					end
					if input1.KeyCode == Enum.KeyCode[divided[1]] then
						flyup = false
					end
					if input1.KeyCode == Enum.KeyCode[divided[2]] then
						flydown = false
					end
				end)
				if flymethod["Value"] == "Jump" and isAlive then
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
				BindToStepped("Fly", 1, function(time, delta) 
					if isAlive then
						lplr.Character.Humanoid.PlatformStand = flyplatformstanding["Enabled"]
						if flyalivecheck == false then
							flyposy = lplr.Character.HumanoidRootPart.CFrame.p.Y
							flyalivecheck = true
						end
						local movevec = (flymovemethod["Value"] == "Manual" and (not (w or s or a or d)) and Vector3.new(0, 0, 0) or lplr.Character.Humanoid.MoveDirection).Unit
						movevec = movevec == movevec and movevec or Vector3.new(0, 0, 0)
						if flymethod["Value"] == "Normal" then
							if flyplatformstanding["Enabled"] then
								lplr.Character.HumanoidRootPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.CFrame.p, lplr.Character.HumanoidRootPart.CFrame.p + cam.CFrame.lookVector)
							end
							lplr.Character.HumanoidRootPart.Velocity = (movevec * flyspeed["Value"]) + Vector3.new(0, 0.85 + (flyup and flyverticalspeed["Value"] or 0) + (flydown and -flyverticalspeed["Value"] or 0), 0)
						else
							if flyup then
								flyposy = flyposy + (flyverticalspeed["Value"] * delta)
							end
							if flydown then
								flyposy = flyposy - (flyverticalspeed["Value"] * delta)
							end
							local flypos = (movevec * (math.clamp(flyspeed["Value"] - lplr.Character.Humanoid.WalkSpeed, 0, 1000000000000) * delta))
							flypos = Vector3.new(flypos.X, (flyposy - lplr.Character.HumanoidRootPart.CFrame.p.Y), flypos.Z)
							if flywall["Enabled"] then
								local raycastparameters = RaycastParams.new()
								raycastparameters.FilterType = Enum.RaycastFilterType.Blacklist
								raycastparameters.FilterDescendantsInstances = {lplr.Character}
								local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, flypos, raycastparameters)
								if ray then flypos = (ray.Position - lplr.Character.HumanoidRootPart.Position) flyposy = lplr.Character.HumanoidRootPart.CFrame.p.Y end
							end
							if flymethod["Value"] ~= "Jump" then
								lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + flypos
								if flyplatformstanding["Enabled"] then
									lplr.Character.HumanoidRootPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.CFrame.p, lplr.Character.HumanoidRootPart.CFrame.p + cam.CFrame.lookVector)
								end
								lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
							else
								lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(flypos.X, 0, flypos.Z)
								if lplr.Character.HumanoidRootPart.Velocity.Y < -(lplr.Character.Humanoid.JumpPower - ((flyup and flyverticalspeed["Value"] or 0) - (flydown and flyverticalspeed["Value"] or 0))) then
									flyjumpcf = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -lplr.Character.Humanoid.HipHeight, 0)
									lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
								end
							end
						end
						if flyplatform then
							flyplatform.CFrame = (flymethod["Value"] == "Jump" and flyjumpcf or lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -lplr.Character.Humanoid.HipHeight * 2, 0))
							flyplatform.Parent = cam
						end
					else
						flyalivecheck = false
					end
				end)
			else
				flyup = false
				flydown = false
				flyalivecheck = false
				flypress:Disconnect()
				flyendpress:Disconnect()
				UnbindFromStepped("Fly")
				if isAlive then
					lplr.Character.Humanoid.PlatformStand = false
				end
				if flyplatform then
					flyplatform:Remove()
				end
			end
		end,
		["ExtraText"] = function() return flymethod["Value"] end
	})
	flymethod = fly.CreateDropdown({
		["Name"] = "Mode", 
		["List"] = {"Normal", "CFrame", "Jump"},
		["Function"] = function(val)
			if isAlive then
				flyposy = lplr.Character.HumanoidRootPart.CFrame.p.Y
			end
		end
	})
	flymovemethod = fly.CreateDropdown({
		["Name"] = "Movement", 
		["List"] = {"MoveDirection", "Manual"},
		["Function"] = function(val) end
	})
	flykeys = fly.CreateDropdown({
		["Name"] = "Keys", 
		["List"] = {"Space/LeftControl", "Space/LeftShift", "E/Q", "Space/Q"},
		["Function"] = function(val) end
	})
	flyspeed = fly.CreateSlider({
		["Name"] = "Speed",
		["Min"] = 1,
		["Max"] = 150, 
		["Function"] = function(val) end
	})
	flyverticalspeed = fly.CreateSlider({
		["Name"] = "Vertical Speed",
		["Min"] = 1,
		["Max"] = 150, 
		["Function"] = function(val) end
	})
	flywall = fly.CreateToggle({
		["Name"] = "Wall Check",
		["Function"] = function() end,
		["Default"] = true
	})
	flyplatformtoggle = fly.CreateToggle({
		["Name"] = "FloorPlatform", 
		["Function"] = function(callback)
			if callback then
				flyplatform = Instance.new("Part")
				flyplatform.Anchored = true
				flyplatform.CanCollide = true
				flyplatform.Size = Vector3.new(2, 1, 2)
				flyplatform.Transparency = 1
			else
				if flyplatform then 
					flyplatform:Remove() 
				end
			end
		end
	})
	flyplatformstanding = fly.CreateToggle({
		["Name"] = "PlatformStand",
		["Function"] = function() end
	})
	flyupanddown = fly.CreateToggle({
		["Name"] = "Y Level", 
		["Function"] = function() end
	})
end)

runcode(function()
	local speedval = {["Value"] = 1}
	local speedmethod = {["Value"] = "AntiCheat A"}
	local speedmovemethod = {["Value"] = "MoveDirection"}
	local speeddelay = {["Value"] = 0.7}
	local speedwallcheck = {["Enabled"] = true}
	local speedjump = {["Enabled"] = false}
	local speedjumpheight = {["Value"] = 20}
	local speedjumpalways = {["Enabled"] = false}
	local speedup
	local speeddown
	local w = 0
	local s = 0
	local a = 0
	local d = 0
	local bodyvelo
	local speeddelayval = tick()

	local speed = Blatant.CreateOptionsButton({
		["Name"] = "Speed", 
		["Function"] = function(callback)
			if callback then
				speeddown = game:GetService("UserInputService").InputBegan:connect(function(input1)
					if game:GetService("UserInputService"):GetFocusedTextBox() == nil then
						if input1.KeyCode == Enum.KeyCode.W then
							w = true
						end
						if input1.KeyCode == Enum.KeyCode.S then
							s = true
						end
						if input1.KeyCode == Enum.KeyCode.A then
							a = true
						end
						if input1.KeyCode == Enum.KeyCode.D then
							d = true
						end
					end
				end)
				speedup = game:GetService("UserInputService").InputEnded:connect(function(input1)
					if input1.KeyCode == Enum.KeyCode.W then
						w = false
					end
					if input1.KeyCode == Enum.KeyCode.S then
						s = false
					end
					if input1.KeyCode == Enum.KeyCode.A then
						a = false
					end
					if input1.KeyCode == Enum.KeyCode.D then
						d = false
					end
				end)
				BindToStepped("Speed", 1, function(time, delta)
					if isAlive then
						local jumpcheck = killauranear and Killaura["Enabled"]
						local movevec = (speedmovemethod["Value"] == "Manual" and (not (w or s or a or d)) and Vector3.new(0, 0, 0) or lplr.Character.Humanoid.MoveDirection).Unit
						movevec = movevec == movevec and movevec or Vector3.new(0, 0, 0)
						if speedmethod["Value"] == "Velocity" then
							local newvelo = movevec * speedval["Value"]
							lplr.Character.HumanoidRootPart.Velocity = Vector3.new(newvelo.X, lplr.Character.HumanoidRootPart.Velocity.Y, newvelo.Z)
						elseif speedmethod["Value"] == "CFrame" then
							local newpos = (movevec * (math.clamp(speedval["Value"] - lplr.Character.Humanoid.WalkSpeed, 0, 1000000000) * delta))
							if speedwallcheck["Enabled"] then
								local raycastparameters = RaycastParams.new()
								raycastparameters.FilterDescendantsInstances = {lplr.Character}
								local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
								if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
							end
							lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
						elseif speedmethod["Value"] == "TP" then
							if speeddelayval <= tick() then
								speeddelayval = tick() + (speeddelay["Value"] / 10)
								local newpos = (movevec * (math.clamp(speedval["Value"] - lplr.Character.Humanoid.WalkSpeed, 0, 1000000000)))
								if speedwallcheck["Enabled"] then
									local raycastparameters = RaycastParams.new()
									raycastparameters.FilterDescendantsInstances = {lplr.Character}
									local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
									if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
								end
								lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
							end
						end
						if speedjump["Enabled"] and (speedjumpalways["Enabled"] or jumpcheck) then
							if (lplr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air) and lplr.Character.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
								lplr.Character.HumanoidRootPart.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X, speedjumpheight["Value"], lplr.Character.HumanoidRootPart.Velocity.Z)
							end
						end
					end
				end)
			else
				speeddelayval = 0
				if speedup then
					speedup:Disconnect()
				end
				if speeddown then
					speeddown:Disconnect()
				end
				if bodyvelo then
					bodyvelo:Remove()
				end
				UnbindFromStepped("Speed")
			end
		end,
		["ExtraText"] = function() return " "..speedmethod["Value"] end
	})
	speedmethod = speed.CreateDropdown({
		["Name"] = "Mode", 
		["List"] = {"Velocity", "CFrame", "TP"},
		["Function"] = function(val)
			speeddelay["Object"].Visible = val == "TP"
		end
	})
	speedmovemethod = speed.CreateDropdown({
		["Name"] = "Movement", 
		["List"] = {"MoveDirection", "Manual"},
		["Function"] = function(val) end
	})
	speedval = speed.CreateSlider({
		["Name"] = "Speed", 
		["Min"] = 1,
		["Max"] = 150, 
		["Function"] = function(val) end
	})
	speeddelay = speed.CreateSlider({
		["Name"] = "Delay", 
		["Min"] = 1,
		["Max"] = 50, 
		["Function"] = function(val)
			speeddelayval = tick() + (val / 10)
		end,
		["Default"] = 7
	})
	speedjumpheight = speed.CreateSlider({
		["Name"] = "Jump Height",
		["Min"] = 0,
		["Max"] = 150,
		["Default"] = 25,
		["Function"] = function() end
	})
	speedjump = speed.CreateToggle({
		["Name"] = "AutoJump", 
		["Function"] = function(callback) 
			if speedjumpalways["Object"] then
				speedjump["Object"].ToggleArrow.Visible = callback
				speedjumpalways["Object"].Visible = callback
			end
		end,
		["Default"] = true
	})
	speedjumpalways = speed.CreateToggle({
		["Name"] = "Always Jump",
		["Function"] = function() end
	})
	speedwallcheck = speed.CreateToggle({
		["Name"] = "Wall Check",
		["Function"] = function() end,
		["Default"] = true
	})
	speedjumpalways["Object"].BackgroundTransparency = 0
	speedjumpalways["Object"].BorderSizePixel = 0
	speedjumpalways["Object"].BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	speedjumpalways["Object"].Visible = speedjump["Enabled"]
end)

runcode(function()
	local bodyspin
	local spinbotspeed = {["Value"] = 1}
	local spinbot = Blatant.CreateOptionsButton({
		["Name"] = "SpinBot",
		["Function"] = function(callback)
			if callback then
				BindToRenderStep("SpinBot", 1, function()
					if isAlive then
						if (bodyspin == nil or bodyspin ~= nil and bodyspin.Parent ~= lplr.Character.HumanoidRootPart) then
							bodyspin = Instance.new("BodyAngularVelocity")
							bodyspin.MaxTorque = Vector3.new(0, math.huge, 0)
							bodyspin.AngularVelocity = Vector3.new(0, spinbotspeed["Value"], 0)
							bodyspin.Parent = lplr.Character.HumanoidRootPart
						else
							bodyspin.AngularVelocity = Vector3.new(0, spinbotspeed["Value"], 0)
						end
					end
				end)
			else
				if bodyspin then
					bodyspin:Remove()
				end
				UnbindFromRenderStep("SpinBot")
			end
		end,
		["HoverText"] = "Makes your character spin around in circles (does not work in first person)"
	})
	spinbotspeed = spinbot.CreateSlider({
		["Name"] = "Speed",
		["Min"] = 1,
		["Max"] = 100,
		["Default"] = 40,
		["Function"] = function() end
	})
end)

local ChatSpammer = {["Enabled"] = false}
local ChatSpammerDelay = {["Value"] = 10}
local ChatSpammerHideWait = {["Enabled"] = true}
local ChatSpammerMessages = {["ObjectList"] = {}}
local chatspammerfirstexecute = true
local waitnum = 0
ChatSpammer = Blatant.CreateOptionsButton({
	["Name"] = "TrashTalk",
	["Function"] = function(callback)
		if callback then
			if chatspammerfirstexecute then
				lplr.PlayerGui:WaitForChild("Chat", 10)
			end
			if lplr.PlayerGui:FindFirstChild("Chat") and lplr.PlayerGui.Chat:FindFirstChild("Frame") and lplr.PlayerGui.Chat.Frame:FindFirstChild("ChatChannelParentFrame") and game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
				spawn(function()
					repeat
						if ChatSpammer["Enabled"] then
							pcall(function()
								game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer((#ChatSpammerMessages["ObjectList"] > 0 and ChatSpammerMessages["ObjectList"][math.random(1, #ChatSpammerMessages["ObjectList"])] or "vxpe on top"), "All")
								local framelabel = lplr.PlayerGui:WaitForChild("Chat").Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Wait()
								local textlabel = framelabel:WaitForChild("TextLabel")
								if textlabel.Text:sub(1, 13) == "You must wait" then
									waitnum = tonumber(textlabel.Text:sub(15, textlabel.Text:len() - 40))
									if ChatSpammerHideWait["Enabled"] then
										framelabel.Size = UDim2.new(0, 0, 0, 0)
										framelabel:GetPropertyChangedSignal("Size"):connect(function()
											framelabel.Size = UDim2.new(0, 0, 0, 0)
										end)
									end
								end
							end)
						end
						if waitnum ~= 0 then
							wait(waitnum)
							waitnum = 0
						else
							wait(ChatSpammerDelay["Value"] / 10)
						end
					until ChatSpammer["Enabled"] == false
				end)				
			else
				print("chat not found")
				if ChatSpammer["Enabled"] then
					ChatSpammer["ToggleButton"](false)
				end
			end
		else
			waitnum = 0
		end
	end,
	["HoverText"] = "Spam insults at skids"
})
ChatSpammerDelay = ChatSpammer.CreateSlider({
	["Name"] = "Delay",
	["Min"] = 1,
	["Max"] = 50,
	["Default"] = 10,
	["Function"] = function() end
})
ChatSpammerHideWait = ChatSpammer.CreateToggle({
	["Name"] = "Hide Wait Message",
	["Function"] = function() end,
	["Default"] = true
})
ChatSpammerMessages = ChatSpammer.CreateTextList({
	["Name"] = "Message",
	["TempText"] = "Trash talk message",
	["Function"] = function() end
})

local HighJumpMethod = {["Value"] = "Toggle"}
local HighJumpBoost = {["Value"] = 1}
local HighJumpDelay = {["Value"] = 20}
local HighJumpTick = tick()
local highjumpbound = true
local HighJump = {["Enabled"] = false}
HighJump = Blatant.CreateOptionsButton({
	["Name"] = "HighJump", 
	["Function"] = function(callback)
		if callback then
			highjumpbound = false
			if HighJumpMethod["Value"] == "Toggle" then
				if HighJumpTick > tick()  then
					createwarning("LongJump", "Wait "..math.round(HighJumpTick - tick()).." before retoggling.", 1)
				end
				if HighJumpTick <= tick() and isAlive and (lplr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Running or lplr.Character.Humanoid:GetState() == Enum.HumanoidStateType.RunningNoPhysics) then
					HighJumpTick = tick() + (HighJumpDelay["Value"] / 10)
					lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, HighJumpBoost["Value"], 0)
				end
				HighJump["ToggleButton"](false)
			else
				highjumpbound = true
				BindToRenderStep("HighJump", 1, function()
					if HighJumpTick <= tick() and isAlive and (lplr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Running or lplr.Character.Humanoid:GetState() == Enum.HumanoidStateType.RunningNoPhysics) and uis:IsKeyDown(Enum.KeyCode.Space) then
						HighJumpTick = tick() + (HighJumpDelay["Value"] / 10)
						lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, HighJumpBoost["Value"], 0)
					end
				end)
			end
		else
			if highjumpbound then
				UnbindFromRenderStep("HighJump")
			end
		end
	end,
	["HoverText"] = "Lets you jump higher"
})
HighJumpMethod = HighJump.CreateDropdown({
	["Name"] = "Mode", 
	["List"] = {"Toggle", "Normal"},
	["Function"] = function(val) end
})
HighJumpBoost = HighJump.CreateSlider({
	["Name"] = "Boost",
	["Min"] = 1,
	["Max"] = 150, 
	["Function"] = function(val) end,
	["Default"] = 100
})
HighJumpDelay = HighJump.CreateSlider({
	["Name"] = "Delay",
	["Min"] = 0,
	["Max"] = 50, 
	["Function"] = function(val) end,
})

local longjumpboost = {["Value"] = 1}
local longjumpdisabler = {["Enabled"] = false}
local longjumpfall = false
local longjumpjump = {["Enabled"] = false}
local longjump = {["Enabled"] = false}
longjump = Blatant.CreateOptionsButton({
	["Name"] = "LongJump", 
	["Function"] = function(callback)
		if callback then
			if longjumpjump then
				if isAlive then
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
			BindToRenderStep("LongJump", 1, function() 
				if isAlive then
					if (lplr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall or lplr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping) and lplr.Character.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
						local velo = lplr.Character.Humanoid.MoveDirection * longjumpboost["Value"]
						lplr.Character.HumanoidRootPart.Velocity = Vector3.new(velo.X, lplr.Character.HumanoidRootPart.Velocity.Y, velo.Z)
					end
					if lplr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
						longjumpfall = true
					else
						if longjumpfall and longjumpdisabler["Enabled"] then
							longjumpfall = false
							longjump["ToggleButton"](true)
						end
					end
				end
			end)
		else
			UnbindFromRenderStep("LongJump")
			longjumpfall = false
		end
	end
})
longjumpboost = longjump.CreateSlider({
	["Name"] = "Boost",
	["Min"] = 1,
	["Max"] = 150, 
	["Function"] = function(val) end
})
longjumpjump = longjump.CreateToggle({
	["Name"] = "Jump",
	["Function"] = function()
	end,
	["Default"] = true
})
longjumpdisabler = longjump.CreateToggle({
	["Name"] = "Auto Disable",
	["Function"] = function()
	end,
	["Default"] = true
})


local phase = {["Enabled"] = false}
local spidergoinup = false
local holdingshift = false
local phasemode = {["Value"] = "Normal"}
local phaselimit = {["Value"] = 1}
local phaseparts = {}

phase = Blatant.CreateOptionsButton({
	["Name"] = "Phase", 
	["Function"] = function(callback)
		if callback then
			BindToStepped("Phase", 1, function()
				if isAlive then
					if phasemode["Value"] == "Normal" then
						for i, part in pairs(lplr.Character:GetDescendants()) do
							if part:IsA("BasePart") and part.CanCollide == true then
								phaseparts[part] = true
								part.CanCollide = (uilib["ObjectsThatCanBeSaved"]["SpiderOptionsButton"]["Api"]["Enabled"] and (not holdingshift))
							end
						end
					else
						local chars = {}
						for i,v in pairs(players:GetChildren()) do
							table.insert(chars, v.Character)
						end
						local pos = lplr.Character.HumanoidRootPart.CFrame.p - Vector3.new(0, 1, 0)
						local pos2 = lplr.Character.HumanoidRootPart.CFrame.p + Vector3.new(0, 1, 0)
						local pos3 = lplr.Character.Head.CFrame.p
						local raycastparameters = RaycastParams.new()
						raycastparameters.FilterDescendantsInstances = chars
						raycastparameters.FilterType = Enum.RaycastFilterType.Blacklist
						local newray = workspace:Raycast(pos3, lplr.Character.Humanoid.MoveDirection, raycastparameters)
						if newray and (uilib["ObjectsThatCanBeSaved"]["SpiderOptionsButton"]["Api"]["Enabled"] and holdingshift or uilib["ObjectsThatCanBeSaved"]["SpiderOptionsButton"]["Api"]["Enabled"] == false) then
							local dir = newray.Normal.Z ~= 0 and "Z" or "X"
							if newray.Instance.Size[dir] <= phaselimit["Value"] then
								lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + (newray.Normal * (-(newray.Instance.Size[dir]) - 2))
							end
							--[[if isPointInMapOccupied(getScaffold(pos, false) + (newray.Normal * -6)) and isPointInMapOccupied(getScaffold(pos2, false) + (newray.Normal * -6)) then
								phasedelay = tick() + 0.075
								phasedelay2 = tick() + 0.1
								slowdownspeed = true
								nocheck = true
								lplr.Character.HumanoidRootPart.CFrame = addvectortocframe(lplr.Character.HumanoidRootPart.CFrame, (newray.Normal * -2.5))
							end]]
						end
					end
				end
			end)
		else
			UnbindFromStepped("Phase")
			for i,v in pairs(phaseparts) do
				if i then
					i.CanCollide = true
				end
			end
			table.clear(phaseparts)
		end
	end,
	["HoverText"] = "Lets you Phase/Clip through walls. (Hold shift to use phase over spider)"
})
phasemode = phase.CreateDropdown({
	["Name"] = "Mode",
	["List"] = {"Normal", "AntiCheat"},
	["Function"] = function(val) 
		if phaselimit["Object"] then
			phaselimit["Object"].Visible = val == "AntiCheat"
		end
	end
})
phaselimit = phase.CreateSlider({
	["Name"] = "Studs",
	["Function"] = function() end,
	["Min"] = 1,
	["Max"] = 20,
	["Default"] = 5,
})
phaselimit["Object"].Visible = phasemode["Value"] == "AntiCheat"

runcode(function()
	local spiderspeed = {["Value"] = 0}
	Spider = Blatant.CreateOptionsButton({
		["Name"] = "Spider",
		["Function"] = function(callback)
			if callback then
				BindToStepped("Spider", 1, function()
					if isAlive then
						local chars = {}
						for i,v in pairs(players:GetChildren()) do
							table.insert(chars, v.Character)
						end
						local vec = (lplr.Character.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) and lplr.Character.Humanoid.MoveDirection.Unit * 2 or Vector3.new(0, 0, 0))
						local raycastparameters = RaycastParams.new()
						raycastparameters.FilterDescendantsInstances = chars
						raycastparameters.FilterType = Enum.RaycastFilterType.Blacklist
						local newray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, vec + Vector3.new(0, 0.1, 0), raycastparameters)
						local newray2 = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, vec - Vector3.new(0, lplr.Character.Humanoid.HipHeight, 0), raycastparameters)
						if spidergoinup and (not newray) and (not newray2) then
							lplr.Character.HumanoidRootPart.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X, 0, lplr.Character.HumanoidRootPart.Velocity.Z)
						end
						spidergoinup = ((newray or newray2) and true or false)
						holdingshift = uis:IsKeyDown(Enum.KeyCode.LeftShift)
						if (newray or newray2) and (newray or newray2).Normal.Y == 0 then
							if (newray or newray2) and (uilib["ObjectsThatCanBeSaved"]["PhaseOptionsButton"]["Api"]["Enabled"] and holdingshift == false or uilib["ObjectsThatCanBeSaved"]["PhaseOptionsButton"]["Api"]["Enabled"] == false) then
								lplr.Character.HumanoidRootPart.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X - (lplr.Character.HumanoidRootPart.CFrame.lookVector.X / 2), spiderspeed["Value"], lplr.Character.HumanoidRootPart.Velocity.Z - (lplr.Character.HumanoidRootPart.CFrame.lookVector.Z / 2))
							end
						end
					end
				end)
			else
				UnbindFromStepped("Spider")
			end
		end,
		["HoverText"] = "Lets you climb up walls"
	})
	spiderspeed = Spider.CreateSlider({
		["Name"] = "Speed",
		["Min"] = 0,
		["Max"] = 100,
		["Function"] = function() end,
		["Default"] = 30
	})
end)

local TargetStrafe = Blatant.CreateOptionsButton({
    ["Name"] = "TargetStrafe", 
    ["Function"] = function(state)
		getgenv().TargetStrafe = state
	end,
    ["Default"] = false,
})

TargetStrafe.CreateSlider({
	["Name"] = "X",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeX = val
	end,
	["Default"] = 5
})

TargetStrafe.CreateSlider({
	["Name"] = "Y",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeY = val
	end,
	["Default"] = 5
})

TargetStrafe.CreateSlider({
	["Name"] = "Z",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeZ = val
	end,
	["Default"] = 5
})

TargetStrafe.CreateSlider({
	["Name"] = "X2",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeX2 = val
	end,
	["Default"] = 5
})

TargetStrafe.CreateSlider({
	["Name"] = "Y2",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeY2 = val
	end,
	["Default"] = 5
})

TargetStrafe.CreateSlider({
	["Name"] = "Z2",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeZ2 = val
	end,
	["Default"] = 5
})

TargetStrafe.CreateSlider({
	["Name"] = "Delay",
	["Min"] = 0,
	["Max"] = 50,
	["Function"] = function(val)
		getgenv().TargetStrafeDelay = val
	end,
	["Default"] = 0.01
})

local TargetStrafeV2 = Blatant.CreateOptionsButton({
    ["Name"] = "TargetStrafeV2", 
    ["Function"] = function(state)
		getgenv().TargetStrafeV2 = state
	end,
    ["Default"] = false,
})

TargetStrafeV2.CreateSlider({
	["Name"] = "X",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeXV2 = val
	end,
	["Default"] = 5
})

TargetStrafeV2.CreateSlider({
	["Name"] = "Y",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeYV2 = val
	end,
	["Default"] = 5
})

TargetStrafeV2.CreateSlider({
	["Name"] = "Z",
	["Min"] = 0,
	["Max"] = 100,
	["Function"] = function(val)
		getgenv().TargetStrafeZV2 = val
	end,
	["Default"] = 5
})

local HealthText = Instance.new("TextLabel")
HealthText.Font = Enum.Font.SourceSans
HealthText.TextSize = 35
HealthText.Text = "100 HP"
HealthText.Position = UDim2.new(0.5, 0, 0.5, 70)
HealthText.BackgroundTransparency = 1
HealthText.TextColor3 = Color3.fromRGB(255, 0, 0)
HealthText.Size = UDim2.new(0, 0, 0, 0)
HealthText.Visible = false
HealthText.Parent = uilib["MainGui"]
local Health = Render.CreateOptionsButton({
	["Name"] = "Health", 
	["Function"] = function(callback) 
		if callback then
			HealthText.Visible = true
			BindToRenderStep("Health", 1, function()
				if isAlive then
					HealthText.Text = tostring(math.round(lplr.Character.Humanoid.Health)).."HP"
				end
			end)
		else
			HealthText.Visible = false
			UnbindFromRenderStep("Health")
		end
	end,
	["HoverText"] = "Displays your health in the center of your screen."
})


local playerchamsenabled = false
local PlayerChams = Render.CreateOptionsButton({
    ["Name"] = "PlayerChams", 
    ["Function"] = function(callback) 
        if callback then
		local playerchamsenabled = true
        repeat
			wait()
			game.Players.LocalPlayer.Character.LeftHand.Material = "ForceField"
			game.Players.LocalPlayer.Character.RightHand.Material = "ForceField"
			game.Players.LocalPlayer.Character.LeftLowerArm.Material = "ForceField"
			game.Players.LocalPlayer.Character.RightLowerArm.Material = "ForceField"
			game.Players.LocalPlayer.Character.LeftUpperArm.Material = "ForceField"
			game.Players.LocalPlayer.Character.RightUpperArm.Material = "ForceField"
			game.Players.LocalPlayer.Character.LeftFoot.Material = "ForceField"
			game.Players.LocalPlayer.Character.RightFoot.Material = "ForceField"
			game.Players.LocalPlayer.Character.LeftLowerLeg.Material = "ForceField"
			game.Players.LocalPlayer.Character.RightLowerLeg.Material = "ForceField"
			game.Players.LocalPlayer.Character.UpperTorso.Material = "ForceField"
			game.Players.LocalPlayer.Character.LowerTorso.Material = "ForceField"
			game.Players.LocalPlayer.Character.LeftUpperLeg.Material = "ForceField"
			game.Players.LocalPlayer.Character.RightUpperLeg.Material = "ForceField"
			game.Players.LocalPlayer.Character.Head.Material = "ForceField"
		until playerchamsenabled == false
        else
			local playerchamsenabled = false
			game.Players.LocalPlayer.Character.LeftHand.Material = "Plastic"
			game.Players.LocalPlayer.Character.RightHand.Material = "Plastic"
			game.Players.LocalPlayer.Character.LeftLowerArm.Material = "Plastic"
			game.Players.LocalPlayer.Character.RightLowerArm.Material = "Plastic"
			game.Players.LocalPlayer.Character.LeftUpperArm.Material = "Plastic"
			game.Players.LocalPlayer.Character.RightUpperArm.Material = "Plastic"
			game.Players.LocalPlayer.Character.LeftFoot.Material = "Plastic"
			game.Players.LocalPlayer.Character.RightFoot.Material = "Plastic"
			game.Players.LocalPlayer.Character.LeftLowerLeg.Material = "Plastic"
			game.Players.LocalPlayer.Character.RightLowerLeg.Material = "Plastic"
			game.Players.LocalPlayer.Character.UpperTorso.Material = "Plastic"
			game.Players.LocalPlayer.Character.LowerTorso.Material = "Plastic"
			game.Players.LocalPlayer.Character.LeftUpperLeg.Material = "Plastic"
			game.Players.LocalPlayer.Character.RightUpperLeg.Material = "Plastic"
			game.Players.LocalPlayer.Character.Head.Material = "Plastic"
        end
    end,
    ["HoverText"] = "Changes your player texture", 
    ["Default"] = false,
})

PlayerChams.CreateColorSlider({
    ["Name"] = "Player chams color",
    ["HoverText"] = "dont touch it if you want it at none",
    ["Function"] = function(hue, sat, val)
        game.Players.LocalPlayer.Character.LeftHand.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.RightHand.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.LeftLowerArm.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.RightLowerArm.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.LeftUpperArm.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.RightUpperArm.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.LeftFoot.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.RightFoot.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.LeftLowerLeg.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.RightLowerLeg.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.UpperTorso.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.LowerTorso.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.LeftUpperLeg.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.RightUpperLeg.Color = Color3.fromHSV(hue, sat, val)
		game.Players.LocalPlayer.Character.Head.Color = Color3.fromHSV(hue, sat, val)
    end
})


runcode(function()
	local Breadcrumbs = {["Enabled"] = false}
	local BreadcrumbsLifetime = {["Value"] = 20}
	local breadcrumbtrail
	local breadcrumbattachment
	local breadcrumbattachment2
	Breadcrumbs = Render.CreateOptionsButton({
		["Name"] = "Breadcrumbs",
		["Function"] = function(callback)
			if callback then
				spawn(function()
					repeat
						task.wait(0.3)
						if (not Breadcrumbs["Enabled"]) then return end
						if isAlive then
							if breadcrumbtrail == nil then
								breadcrumbattachment = Instance.new("Attachment")
								breadcrumbattachment.Position = Vector3.new(0, 0.07 - 2.9, 0.5)
								breadcrumbattachment2 = Instance.new("Attachment")
								breadcrumbattachment2.Position = Vector3.new(0, -0.07 - 2.9, 0.5)
								breadcrumbtrail = Instance.new("Trail")
								breadcrumbtrail.Attachment0 = breadcrumbattachment 
								breadcrumbtrail.Attachment1 = breadcrumbattachment2
								breadcrumbtrail.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0, 0, 1))
								breadcrumbtrail.FaceCamera = true
								breadcrumbtrail.Lifetime = BreadcrumbsLifetime["Value"] / 10
								breadcrumbtrail.Enabled = true
							else
								local trailfound = false
								for i,v in pairs(lplr.Character:GetChildren()) do
									if v:IsA("Trail") then
										if trailfound then	
											v:Remove()
										else
											trailfound = true
										end
									end
								end
								breadcrumbattachment.Parent = lplr.Character.HumanoidRootPart
								breadcrumbattachment2.Parent = lplr.Character.HumanoidRootPart
								breadcrumbtrail.Parent = lplr.Character
							end
						end
					until (not Breadcrumbs["Enabled"])
				end)
			else
				if breadcrumbtrail then
					breadcrumbtrail:Remove()
					if isAlive then 
						for i,v in pairs(lplr.Character:GetChildren()) do
							if v:IsA("Trail") then
								v:Remove()
							end
						end
					end
					breadcrumbtrail = nil
				end
			end
		end,
		["HoverText"] = "Shows a trail behind your character"
	})
	BreadcrumbsLifetime = Breadcrumbs.CreateSlider({
		["Name"] = "Lifetime",
		["Min"] = 1,
		["Max"] = 100,
		["Function"] = function(val) end,
		["Default"] = 20
	})
end)

runcode(function()
	local ChinaHat = {["Enabled"] = false}
	local ChinaHatColor = {["Hue"] = 1,["Sat"]=1,["Value"]=0.33}
	local chinahattrail
	local chinahatattachment
	local chinahatattachment2
	ChinaHat = Render.CreateOptionsButton({
		["Name"] = "ChinaHat",
		["Function"] = function(callback)
			if callback then
				spawn(function()
					repeat
						task.wait(0.3)
						if (not ChinaHat["Enabled"]) then return end
						if isAlive then
							if chinahattrail == nil or chinahattrail.Parent == nil then
                                chinahattrail = Instance.new("Part")
                                chinahattrail.CFrame = lplr.Character.Head.CFrame * CFrame.new(0, 1.1, 0)
                                chinahattrail.Size = Vector3.new(3, 0.7, 3)
                                chinahattrail.Name = "ChinaHat"
                                chinahattrail.Material = Enum.Material.Neon
                                chinahattrail.CanCollide = false
                                chinahattrail.Transparency = 0.3
                                local chinahatmesh = Instance.new("SpecialMesh")
                                chinahatmesh.Parent = chinahattrail
                                chinahatmesh.MeshType = "FileMesh"
                                chinahatmesh.MeshId = "http://www.roblox.com/asset/?id=1778999"
                                chinahatmesh.Scale = Vector3.new(3, 0.6, 3)
                                local chinahatweld = Instance.new("WeldConstraint")
								chinahatweld.Name = "WeldConstraint"
                                chinahatweld.Parent = chinahattrail
                                chinahatweld.Part0 = lplr.Character.Head
                                chinahatweld.Part1 = chinahattrail
								chinahattrail.Parent = workspace.Camera
							else
								chinahattrail.Parent = workspace.Camera
								chinahattrail.CFrame = lplr.Character.Head.CFrame * CFrame.new(0, 1.1, 0)
								chinahattrail.LocalTransparencyModifier = ((cam.CFrame.Position - cam.Focus.Position).Magnitude <= 0.6 and 1 or 0)
								if chinahattrail:FindFirstChild("WeldConstraint") then
									chinahattrail.WeldConstraint.Part0 = lplr.Character.Head
								end
							end
						else
							if chinahattrail then 
								chinahattrail:Remove()
								chinahattrail = nil
							end
						end
					until (not ChinaHat["Enabled"])
				end)
			else
				if chinahattrail then
					chinahattrail:Remove()
					chinahattrail = nil
				end
			end
		end,
		["HoverText"] = "Shows a trail behind your character"
	})
	ChinaHatColor = ChinaHat.CreateColorSlider({
		["Name"] = "Hat Color",
		["Function"] = function(h, s, v) 
			if chinahattrail then 
				chinahattrail.Color = Color3.fromHSV(h, s, v)
			end
		end
	})
end)

local crosshaircng = Render.CreateOptionsButton({
    ["Name"] = "CrossHair", 
    ["Function"] = function(callback) 
        if callback then

        else
			game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = true
			game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = true
			game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = true
			game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = true
        end
    end,
    ["HoverText"] = "Changes Lighting", 
    ["Default"] = false,
})

crosshaircng.CreateToggle({
    ["Name"] = "TopVis",
    ["HoverText"] = "",
    ["Function"] = function(state)
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = state
    end
})

crosshaircng.CreateColorSlider({
    ["Name"] = "TopColor",
    ["Function"] = function(h, s, v)
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.fromHSV(h, s, v)
    end
})

crosshaircng.CreateToggle({
    ["Name"] = "RightVis",
    ["HoverText"] = "",
    ["Function"] = function(state)
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = state
    end
})

crosshaircng.CreateColorSlider({
    ["Name"] = "RightColor",
    ["Function"] = function(h, s, v)
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Color3.fromHSV(h, s, v)
    end
})

crosshaircng.CreateToggle({
    ["Name"] = "LeftVis",
    ["HoverText"] = "",
    ["Function"] = function(state)
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = state
    end
})

crosshaircng.CreateColorSlider({
    ["Name"] = "LeftColor",
    ["Function"] = function(h, s, v)
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = Color3.fromHSV(h, s, v)
    end
})

crosshaircng.CreateToggle({
    ["Name"] = "BottomVis",
    ["HoverText"] = "",
    ["Function"] = function(state)
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = state
    end
})

crosshaircng.CreateColorSlider({
    ["Name"] = "BottomColor",
    ["Function"] = function(h, s, v)
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.fromHSV(h, s, v)
    end
})

local thelighting = game.Lighting
local Lighting = Render.CreateOptionsButton({
    ["Name"] = "Lighting", 
    ["Function"] = function(callback) 
        if callback then
            thelighting.Brightness = 1
            thelighting.ClockTime = 1
            thelighting.FogEnd = 1000000000
            thelighting.FogStart = 0
            thelighting.GeographicLatitude = 41.72
            thelighting.GlobalShadows = true
        else
            thelighting.Brightness = 1
            thelighting.ClockTime = 1
            thelighting.FogEnd = 1000000000
            thelighting.FogStart = 0
            thelighting.GeographicLatitude = 41.72
            thelighting.GlobalShadows = true
        end
    end,
    ["HoverText"] = "Changes Lighting", 
    ["Default"] = false,
})

Lighting.CreateSlider({
    ["Name"] = "Brightness",
    ["Min"] = 1, 
	["Max"] = 10000,
    ["HoverText"] = "",
    ["Function"] = function(val)
        thelighting.Brightness = val
    end
})

Lighting.CreateSlider({
    ["Name"] = "Time",
    ["Min"] = 0, 
	["Max"] = 24,
    ["HoverText"] = "",
    ["Function"] = function(val)
        thelighting.ClockTime = val
    end
})

Lighting.CreateSlider({
    ["Name"] = "FogEnd",
    ["Min"] = 1, 
	["Max"] = 100,
    ["HoverText"] = "dont put too high or you will regret",
    ["Function"] = function(val)
        thelighting.FogEnd = val
    end
})

Lighting.CreateSlider({
    ["Name"] = "FogStart",
    ["Min"] = 1, 
	["Max"] = 10000,
    ["HoverText"] = "dont put too high or you will regret",
    ["Function"] = function(val)
        thelighting.FogStart = val
    end
})

Lighting.CreateSlider({
    ["Name"] = "GeographicLatitude",
    ["Min"] = 1, 
	["Max"] = 10000,
    ["HoverText"] = "",
    ["Function"] = function(val)
        thelighting.GeographicLatitude = val
    end
})

Lighting.CreateToggle({
    ["Name"] = "Shadows",
    ["HoverText"] = "",
    ["Function"] = function(state)
        thelighting.GlobalShadows = state
    end
})

Lighting.CreateColorSlider({
    ["Name"] = "Ambient",
    ["Function"] = function(h, s, v)
        thelighting.Ambient = Color3.fromHSV(h, s, v)
    end
})

Lighting.CreateColorSlider({
    ["Name"] = "ColorShiftA",
    ["Function"] = function(h, s, v)
        thelighting.ColorShift_Bottom = Color3.fromHSV(h, s, v)
    end
})

Lighting.CreateColorSlider({
    ["Name"] = "ColorShiftB",
    ["Function"] = function(h, s, v)
        thelighting.ColorShift_Top = Color3.fromHSV(h, s, v)
    end
})

Lighting.CreateColorSlider({
    ["Name"] = "Fog",
    ["Function"] = function(h, s, v)
        thelighting.FogColor = Color3.fromHSV(h, s, v)
    end
})

Lighting.CreateColorSlider({
    ["Name"] = "OutdoorAmbient",
    ["Function"] = function(h, s, v)
        thelighting.OutdoorAmbient = Color3.fromHSV(h, s, v)
    end
})

runcode(function()
	local ChamsFolder = Instance.new("Folder")
	ChamsFolder.Name = "ChamsFolder"
	ChamsFolder.Parent = uilib["MainGui"]
	players.PlayerRemoving:connect(function(plr)
		if ChamsFolder:FindFirstChild(plr.Name) then
			ChamsFolder[plr.Name]:Remove()
		end
	end)
	local ChamsColor = {["Value"] = 0.44}
	local ChamsOutlineColor = {["Value"] = 0.44}
	local ChamsBetter = {["Enabled"] = false}
	local ChamsTransparency = {["Value"] = 1}
	local ChamsOutlineTransparency = {["Value"] = 1}
	local ChamsOnTop = {["Enabled"] = true}
	local chamobjects = {["Head"] = true, ["Torso"] = true, ["UpperTorso"] = true, ["LowerTorso"] = true, ["Left Arm"] = true, ["Left Leg"] = true, ["Right Arm"] = true, ["Right Leg"] = true, ["LeftLowerLeg"] = true, ["RightLowerLeg"] = true, ["LeftUpperLeg"] = true, ["RightUpperLeg"] = true, ["LeftFoot"] = true, ["RightFoot"] = true, ["LeftLowerArm"] = true, ["RightLowerArm"] = true, ["LeftUpperArm"] = true, ["RightUpperArm"] = true, ["LeftHand"] = true, ["RightHand"] = true}
	local ChamsTeammates = {["Enabled"] = true}
	local Chams = Render.CreateOptionsButton({
		["Name"] = "Chams", 
		["Function"] = function(callback) 
			if callback then
				BindToRenderStep("Chams", 500, function()
					for i,plr in pairs(players:GetChildren()) do
						if ChamsBetter["Enabled"] then
							local thing
							if ChamsFolder:FindFirstChild(plr.Name) then
								thing = ChamsFolder[plr.Name]
								thing.Enabled = false
								thing.FillColor = getPlayerColor(plr) or Color3.fromHSV(ChamsColor["Hue"], ChamsColor["Sat"], ChamsColor["Value"])
								thing.OutlineColor = Color3.fromHSV(ChamsOutlineColor["Hue"], ChamsOutlineColor["Sat"], ChamsOutlineColor["Value"])
							end

							if isAlive(plr) and plr ~= lplr and (ChamsTeammates["Enabled"] or shared.vapeteamcheck(plr)) then
								if ChamsFolder:FindFirstChild(plr.Name) == nil then
									local chamfolder = Instance.new("Highlight")
									chamfolder.Name = plr.Name
									chamfolder.Parent = ChamsFolder
									thing = chamfolder
								end
								thing.Enabled = true
								thing.Adornee = plr.Character
								thing.OutlineTransparency = ChamsOutlineTransparency["Value"] / 100
								thing.DepthMode = Enum.HighlightDepthMode[(ChamsOnTop["Enabled"] and "AlwaysOnTop" or "Occluded")]
								thing.FillTransparency = ChamsTransparency["Value"] / 100
							end
						else
							local thing
							if ChamsFolder:FindFirstChild(plr.Name) then
								thing = ChamsFolder[plr.Name]
								for partnumber, part in pairs(thing:GetChildren()) do
									part.Visible = false
									part.Color3 = getPlayerColor(plr) or Color3.fromHSV(ChamsColor["Hue"], ChamsColor["Sat"], ChamsColor["Value"])
								end
							end
							
							if isAlive(plr) and plr ~= lplr and (ChamsTeammates["Enabled"] or shared.vapeteamcheck(plr)) then
								if ChamsFolder:FindFirstChild(plr.Name) == nil then
									local chamfolder = Instance.new("Folder")
									chamfolder.Name = plr.Name
									chamfolder.Parent = ChamsFolder
									thing = chamfolder
									for partnumber, part in pairs(plr.Character:GetChildren()) do
										if chamobjects[part.Name] then
											local boxhandle = Instance.new("BoxHandleAdornment")
											boxhandle.Size = (part.Name == "Head" and Vector3.new(1.25, 1.25, 1.25) or part.Size) + Vector3.new(.01, .01, .01)
											boxhandle.AlwaysOnTop = ChamsOnTop["Enabled"]
											boxhandle.ZIndex = 10
											boxhandle.Visible = true
											boxhandle.Color3 = getPlayerColor(plr) or Color3.fromHSV(ChamsColor["Hue"], ChamsColor["Sat"], ChamsColor["Value"])
											boxhandle.Name = part.Name
											boxhandle.Parent = chamfolder
										end
									end
								end
								for partnumber, part in pairs(thing:GetChildren()) do
									part.Visible = true
									if plr.Character:FindFirstChild(part.Name) then
										part.Adornee = plr.Character[part.Name]
										part.AlwaysOnTop = ChamsOnTop["Enabled"]
										part.Transparency = ChamsTransparency["Value"] / 100
									end
								end
							end
						end
					end
				end)
			else
				UnbindFromRenderStep("Chams")
				ChamsFolder:ClearAllChildren()
			end
		end,
		["HoverText"] = "Render players through walls"
	})
	ChamsColor = Chams.CreateColorSlider({
		["Name"] = "Player Color", 
		["Function"] = function(val) end
	})
	ChamsOutlineColor = Chams.CreateColorSlider({
		["Name"] = "Outline Player Color", 
		["Function"] = function(val) end
	})
	ChamsTransparency = Chams.CreateSlider({
		["Name"] = "Transparency", 
		["Min"] = 1,
		["Max"] = 100, 
		["Function"] = function(val) end,
		["Default"] = 50
	})
	ChamsOutlineTransparency = Chams.CreateSlider({
		["Name"] = "Outline Transparency", 
		["Min"] = 1,
		["Max"] = 100, 
		["Function"] = function(val) end,
		["Default"] = 1
	})
	ChamsTeammates = Chams.CreateToggle({
		["Name"] = "Teammates",
		["Function"] = function() end,
		["Default"] = true
	})
	ChamsBetter = Chams.CreateToggle({
		["Name"] = "New Highlight Chams",
		["Function"] = function(callback)
			if callback then
				local suc = pcall(function() return readfile("vape/Profiles/HighlightCheck.vapesetting.txt") end)
				if not suc then
					if ChamsBetter["Enabled"] then
						ChamsBetter["ToggleButton"](false)
					end
					local frame = Instance.new("Frame")
					frame.Size = UDim2.new(0, 660, 0, 445)
					frame.Position = UDim2.new(0.5, -330, 0.5, -223)
					frame.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
					frame.Parent = uilib["MainGui"].ScaledGui
					local frameIcon = Instance.new("ImageLabel")
					frameIcon.Size = UDim2.new(0, 19, 0, 16)
					frameIcon.Image = getcustomassetfunc("vape/assets/ProfilesIcon.png")
					frameIcon.Name = "WindowIcon"
					frameIcon.BackgroundTransparency = 1
					frameIcon.Position = UDim2.new(0, 10, 0, 13)
					frameIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
					frameIcon.Parent = frame
					local frameText = Instance.new("TextLabel")
					frameText.Size = UDim2.new(0, 155, 0, 41)
					frameText.BackgroundTransparency = 1
					frameText.Name = "WindowTitle"
					frameText.Position = UDim2.new(0, 36, 0, 0)
					frameText.TextXAlignment = Enum.TextXAlignment.Left
					frameText.Font = Enum.Font.SourceSans
					frameText.TextSize = 17
					frameText.Text = "Highlight"
					frameText.TextColor3 = Color3.fromRGB(201, 201, 201)
					frameText.Parent = frame
					local frameCorner = Instance.new("UICorner")
					frameCorner.CornerRadius = UDim.new(0, 4)
					frameCorner.Parent = frame
					local frameShadow = Instance.new("ImageLabel")
					frameShadow.AnchorPoint = Vector2.new(0.5, 0.5)
					frameShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
					frameShadow.Image = getcustomassetfunc("vape/assets/WindowBlur.png")
					frameShadow.BackgroundTransparency = 1
					frameShadow.ZIndex = -1
					frameShadow.Size = UDim2.new(1, 6, 1, 6)
					frameShadow.ImageColor3 = Color3.new(0, 0, 0)
					frameShadow.ScaleType = Enum.ScaleType.Slice
					frameShadow.SliceCenter = Rect.new(10, 10, 118, 118)
					frameShadow.Parent = frame
					local frameExitButton = Instance.new("ImageButton")
					frameExitButton.Name = "frameExitButton"
					frameExitButton.ImageColor3 = Color3.fromRGB(121, 121, 121)
					frameExitButton.Size = UDim2.new(0, 24, 0, 24)
					frameExitButton.AutoButtonColor = false
					frameExitButton.Image = getcustomassetfunc("vape/assets/ExitIcon1.png")
					frameExitButton.Visible = true
					frameExitButton.Position = UDim2.new(1, -31, 0, 8)
					frameExitButton.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
					frameExitButton.Parent = frame
					frameExitButton.MouseButton1Click:connect(function()
						frame:Remove()
					end)
					local frametextlab = Instance.new("TextLabel")
					frametextlab.TextSize = 18
					frametextlab.BackgroundTransparency = 1
					frametextlab.Position = UDim2.new(0, 0, 0, 41)
					frametextlab.TextYAlignment = Enum.TextYAlignment.Top
					frametextlab.Size = UDim2.new(1, 0, 1, -41)
					frametextlab.TextColor3 = Color3.new(1, 1, 1)
					frametextlab.Font = Enum.Font.SourceSans
					frametextlab.Text = "\nSteps to enable Highlights\nClick the button below to get the link for the steps, click the done button when you have done the steps."
					frametextlab.Parent = frame
					local framebutton1 = Instance.new("TextButton")
					framebutton1.Text = "Copy Steps to Clipboard"
					framebutton1.AutoButtonColor = false
					framebutton1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
					framebutton1.BorderSizePixel = 0
					framebutton1.TextColor3 = Color3.new(1, 1, 1)
					framebutton1.Size = UDim2.new(0, 200, 0, 50)
					framebutton1.Position = UDim2.new(0.5, -100, 0, 150)
					framebutton1.Parent = frame
					framebutton1.MouseButton1Click:connect(function()
						spawn(function()
							setclipboard("https://github.com/7GrandDadPGN/VapeV4ForRoblox/wiki/Turning-on-Highlights")
							framebutton1.Text = "Copied to clipboard!"
							task.wait(3)
							framebutton1.Text = "Copy Steps to Clipboard"
						end)
					end)
					local framebutton2 = framebutton1:Clone()
					framebutton2.Text = "Done"
					framebutton2.Position = UDim2.new(0.5, -100, 0, 210)
					framebutton2.Parent = frame
					framebutton2.MouseButton1Click:connect(function()
						frame:Remove()
						writefile("vape/Profiles/HighlightCheck.vapesetting.txt", "")
						if ChamsBetter["Enabled"] == false then
							ChamsBetter["ToggleButton"](false)
						end
					end)
					local frameExitButtonround = Instance.new("UICorner")
					frameExitButtonround.CornerRadius = UDim.new(0, 16)
					frameExitButtonround.Parent = frameExitButton
					frameExitButton.MouseEnter:connect(function()
						game:GetService("TweenService"):Create(frameExitButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(60, 60, 60), ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					end)
					frameExitButton.MouseLeave:connect(function()
						game:GetService("TweenService"):Create(frameExitButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(26, 25, 26), ImageColor3 = Color3.fromRGB(121, 121, 121)}):Play()
					end)
				end
			end
			ChamsFolder:ClearAllChildren()
			if ChamsOutlineTransparency["Object"] then 
				ChamsOutlineTransparency["Object"].Visible = callback
			end
		end
	})
	ChamsOutlineTransparency["Object"].Visible = ChamsBetter["Enabled"]
	ChamsOnTop = Chams.CreateToggle({
		["Name"] = "Bypass Walls", 
		["Function"] = function() end
	})
end)

pcall(function()
	local TracersFolder = Instance.new("Folder")
	TracersFolder.Name = "TracersFolder"
	TracersFolder.Parent = uilib["MainGui"]
	local TracersDrawing
	local tracersdrawingtab = {}
	players.PlayerRemoving:connect(function(plr)
		if TracersFolder:FindFirstChild(plr.Name) then
			TracersFolder[plr.Name]:Remove()
		end
		if tracersdrawingtab[plr.Name] then 
			pcall(function()
				tracersdrawingtab[plr.Name]:Remove()
				tracersdrawingtab[plr.Name] = nil
			end)
		end
	end)
	local TracersColor = {["Value"] = 0.44}
	local TracersTransparency = {["Value"] = 1}
	local TracersStartPosition = {["Value"] = "Middle"}
	local TracersEndPosition = {["Value"] = "Head"}
	local TracersTeammates = {["Enabled"] = true}
	local Tracers = Render.CreateOptionsButton({
		["Name"] = "Tracers", 
		["Function"] = function(callback) 
			if callback then
				BindToRenderStep("Tracers", 500, function()
					for i,plr in pairs(players:GetChildren()) do
							local thing
							if TracersDrawing["Enabled"] then
								if tracersdrawingtab[plr.Name] then 
									thing = tracersdrawingtab[plr.Name]
									thing.Visible = false
								else
									thing = Drawing.new("Line")
									thing.Thickness = 1
									thing.Visible = false
									tracersdrawingtab[plr.Name] = thing
								end

								if isAlive(plr) and plr ~= lplr and (TracersTeammates["Enabled"] or shared.vapeteamcheck(plr)) then
									local rootScrPos = cam:WorldToViewportPoint((TracersEndPosition["Value"] == "Head" and plr.Character.Head or plr.Character.HumanoidRootPart).Position)
									local tempPos = cam.CFrame:pointToObjectSpace((TracersEndPosition["Value"] == "Head" and plr.Character.Head or plr.Character.HumanoidRootPart).Position)
									if rootScrPos.Z < 0 then
										tempPos = CFrame.Angles(0, 0, (math.atan2(tempPos.Y, tempPos.X) + math.pi)):vectorToWorldSpace((CFrame.Angles(0, math.rad(89.9), 0):vectorToWorldSpace(Vector3.new(0, 0, -1))));
									end
									local tracerPos = cam:WorldToViewportPoint(cam.CFrame:pointToWorldSpace(tempPos))
									local screensize = cam.ViewportSize
									local startVector = Vector2.new(screensize.X / 2, (TracersStartPosition["Value"] == "Middle" and screensize.Y / 2 or screensize.Y))
									local endVector = Vector2.new(tracerPos.X, tracerPos.Y)
									local Distance = (startVector - endVector).Magnitude
									startVector = startVector
									endVector = endVector
									thing.Visible = true
									thing.Transparency = 1 - TracersTransparency["Value"] / 100
									thing.Color = getPlayerColor(plr) or Color3.fromHSV(TracersColor["Hue"], TracersColor["Sat"], TracersColor["Value"])
									thing.From = startVector
									thing.To = endVector
								end
							else
								if TracersFolder:FindFirstChild(plr.Name) then
									thing = TracersFolder[plr.Name]
									if thing.Visible then
										thing.Visible = false
									end
								else
									thing = Instance.new("Frame")
									thing.BackgroundTransparency = 0
									thing.AnchorPoint = Vector2.new(0.5, 0.5)
									thing.BackgroundColor3 = Color3.new(0, 0, 0)
									thing.BorderSizePixel = 0
									thing.Visible = false
									thing.Name = plr.Name
									thing.Parent = TracersFolder
								end
								
								if isAlive(plr) and plr ~= lplr and (TracersTeammates["Enabled"] or shared.vapeteamcheck(plr)) then
									local rootScrPos = cam:WorldToViewportPoint((TracersEndPosition["Value"] == "Head" and plr.Character.Head or plr.Character.HumanoidRootPart).Position)
									local tempPos = cam.CFrame:pointToObjectSpace((TracersEndPosition["Value"] == "Head" and plr.Character.Head or plr.Character.HumanoidRootPart).Position)
									if rootScrPos.Z < 0 then
										tempPos = CFrame.Angles(0, 0, (math.atan2(tempPos.Y, tempPos.X) + math.pi)):vectorToWorldSpace((CFrame.Angles(0, math.rad(89.9), 0):vectorToWorldSpace(Vector3.new(0, 0, -1))));
									end
									local tracerPos = cam:WorldToViewportPoint(cam.CFrame:pointToWorldSpace(tempPos))
									local screensize = cam.ViewportSize
									local startVector = Vector2.new(screensize.X / 2, (TracersStartPosition["Value"] == "Middle" and screensize.Y / 2 or screensize.Y))
									local endVector = Vector2.new(tracerPos.X, tracerPos.Y)
									local Distance = (startVector - endVector).Magnitude
									startVector = startVector
									endVector = endVector
									thing.Visible = true
									thing.BackgroundTransparency = TracersTransparency["Value"] / 100
									thing.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(TracersColor["Hue"], TracersColor["Sat"], TracersColor["Value"])
									thing.Size = UDim2.new(0, Distance, 0, 2)
									thing.Position = UDim2.new(0, (startVector.X + endVector.X) / 2, 0, ((startVector.Y + endVector.Y) / 2) - 36)
									thing.Rotation = math.atan2(endVector.Y - startVector.Y, endVector.X - startVector.X) * (180 / math.pi)
								end
							end
						end
				end)
			else
				UnbindFromRenderStep("Tracers") 
				TracersFolder:ClearAllChildren()
				for i,v in pairs(tracersdrawingtab) do 
					pcall(function()
						v:Remove()
						tracersdrawingtab[i] = nil
					end)
				end
			end
		end
	})
	TracersStartPosition = Tracers.CreateDropdown({
		["Name"] = "Start Position",
		["List"] = {"Middle", "Bottom"},
		["Function"] = function() end
	})
	TracersEndPosition = Tracers.CreateDropdown({
		["Name"] = "End Position",
		["List"] = {"Head", "Torso"},
		["Function"] = function() end
	})
	TracersColor = Tracers.CreateColorSlider({
		["Name"] = "Player Color", 
		["Function"] = function(val) end
	})
	TracersTransparency = Tracers.CreateSlider({
		["Name"] = "Transparency", 
		["Min"] = 1,
		["Max"] = 100, 
		["Function"] = function(val) end,
		["Default"] = 0
	})
	TracersTeammates = Tracers.CreateToggle({
		["Name"] = "Teammates",
		["Function"] = function() end,
		["Default"] = true
	})
	TracersDrawing = Tracers.CreateToggle({
		["Name"] = "Drawing",
		["Function"] = function() 
			TracersFolder:ClearAllChildren()
			for i,v in pairs(tracersdrawingtab) do 
				pcall(function()
					v:Remove()
					tracersdrawingtab[i] = nil
				end)
			end
		end
	})
end)

runcode(function()
	local ESPFolder = Instance.new("Folder")
	ESPFolder.Name = "ESPFolder"
	ESPFolder.Parent = uilib["MainGui"]
	local espfolderdrawing = {}
	players.PlayerRemoving:connect(function(plr)
		if ESPFolder:FindFirstChild(plr.Name) then
			ESPFolder[plr.Name]:Remove()
		end
		if espfolderdrawing[plr.Name] then
			pcall(function()
				pcall(function()
					espfolderdrawing[plr.Name].Quad1:Remove()
					espfolderdrawing[plr.Name].Quad2:Remove()
					espfolderdrawing[plr.Name].Quad3:Remove()
					espfolderdrawing[plr.Name].Quad4:Remove()
				end)
				pcall(function()
					espfolderdrawing[plr.Name].Head:Remove()
					espfolderdrawing[plr.Name].Head2:Remove()
					espfolderdrawing[plr.Name].Torso:Remove()
					espfolderdrawing[plr.Name].Torso2:Remove()
					espfolderdrawing[plr.Name].Torso3:Remove()
					espfolderdrawing[plr.Name].LeftArm:Remove()
					espfolderdrawing[plr.Name].RightArm:Remove()
					espfolderdrawing[plr.Name].LeftLeg:Remove()
					espfolderdrawing[plr.Name].RightLeg:Remove()
				end)
				espfolderdrawing[plr.Name] = nil
			end)
		end
	end)
	local ESPColor = {["Value"] = 0.44}
	local ESPHealthBar = {["Enabled"] = false}
	local ESPMethod = {["Value"] = "2D"}
	local ESPDrawing = {["Enabled"] = false}
	local ESPTeammates = {["Enabled"] = true}
	local ESP = Render.CreateOptionsButton({
		["Name"] = "ESP", 
		["Function"] = function(callback) 
			if callback then
				BindToRenderStep("ESP", 500, function()
					for i,plr in pairs(players:GetChildren()) do
						local thing
						if ESPDrawing["Enabled"] then 
							if ESPMethod["Value"] == "2D" then
								if espfolderdrawing[plr.Name] then
									thing = espfolderdrawing[plr.Name]
									thing.Quad1.Visible = false
									thing.Quad1.Color = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									thing.Quad2.Visible = false
									thing.Quad3.Visible = false
									thing.Quad4.Visible = false
								else
									espfolderdrawing[plr.Name] = {}
									espfolderdrawing[plr.Name].Quad1 = Drawing.new("Quad")
									espfolderdrawing[plr.Name].Quad1.Thickness = 1
									espfolderdrawing[plr.Name].Quad1.ZIndex = 2
									espfolderdrawing[plr.Name].Quad1.Color = Color3.new(1, 1, 1)
									espfolderdrawing[plr.Name].Quad2 = Drawing.new("Quad")
									espfolderdrawing[plr.Name].Quad2.Thickness = 2
									espfolderdrawing[plr.Name].Quad2.ZIndex = 1
									espfolderdrawing[plr.Name].Quad2.Color = Color3.new(0, 0, 0)
									espfolderdrawing[plr.Name].Quad3 = Drawing.new("Line")
									espfolderdrawing[plr.Name].Quad3.Thickness = 1
									espfolderdrawing[plr.Name].Quad3.ZIndex = 2
									espfolderdrawing[plr.Name].Quad3.Color = Color3.new(0, 0, 0)
									espfolderdrawing[plr.Name].Quad4 = Drawing.new("Line")
									espfolderdrawing[plr.Name].Quad4.Thickness = 2
									espfolderdrawing[plr.Name].Quad4.ZIndex = 1
									espfolderdrawing[plr.Name].Quad4.Color = Color3.new(0, 0, 0)
									thing = espfolderdrawing[plr.Name]
								end

								
								if isAlive(plr) and plr ~= lplr and (ESPTeammates["Enabled"] or shared.vapeteamcheck(plr)) then
									local rootPos, rootVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
									local rootSize = (plr.Character.HumanoidRootPart.Size.X * 1200) * (cam.ViewportSize.X / 1920)
									local headPos, headVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position + Vector3.new(0, 1 + plr.Character.Humanoid.HipHeight, 0))
									local legPos, legVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0, 1 + plr.Character.Humanoid.HipHeight, 0))
									rootPos = rootPos
									if rootVis then
										--thing.Visible = rootVis
										local sizex, sizey = (rootSize / rootPos.Z), (headPos.Y - legPos.Y) 
										local posx, posy = (rootPos.X - sizex / 2),  ((rootPos.Y - sizey / 2))
										if ESPHealthBar["Enabled"] then
											local color = HealthbarColorTransferFunction(plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth)
											thing.Quad3.Color = color
											thing.Quad3.Visible = true
											thing.Quad4.From = Vector2.new(posx - 4, posy + 1)
											thing.Quad4.To = Vector2.new(posx - 4, posy + sizey - 1)
											thing.Quad4.Visible = true
											local healthposy = sizey * math.clamp(plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth, 0, 1)
											thing.Quad3.From = Vector2.new(posx - 4, posy + sizey - (sizey - healthposy))
											thing.Quad3.To = Vector2.new(posx - 4, posy)
											--thing.HealthLineMain.Size = UDim2.new(0, 1, math.clamp(plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth, 0, 1), (math.clamp(plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth, 0, 1) == 0 and 0 or -2))
										end
										thing.Quad1.PointA = Vector2.new(posx + sizex, posy)
										thing.Quad1.PointB = Vector2.new(posx, posy)
										thing.Quad1.PointC = Vector2.new(posx, posy + sizey)
										thing.Quad1.PointD = Vector2.new(posx + sizex, posy + sizey)
										thing.Quad1.Visible = true
										thing.Quad2.PointA = Vector2.new(posx + sizex, posy)
										thing.Quad2.PointB = Vector2.new(posx, posy)
										thing.Quad2.PointC = Vector2.new(posx, posy + sizey)
										thing.Quad2.PointD = Vector2.new(posx + sizex, posy + sizey)
										thing.Quad2.Visible = true
									end
								end
							else
								if espfolderdrawing[plr.Name] then
									thing = espfolderdrawing[plr.Name]
									for linenum, line in pairs(thing) do
										line.Color = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
										line.Visible = false
									end
								else
									thing = {}
									thing.Head = Drawing.new("Line")
									thing.Head2 = Drawing.new("Line")
									thing.Torso = Drawing.new("Line")
									thing.Torso2 = Drawing.new("Line")
									thing.Torso3 = Drawing.new("Line")
									thing.LeftArm = Drawing.new("Line")
									thing.RightArm = Drawing.new("Line")
									thing.LeftLeg = Drawing.new("Line")
									thing.RightLeg = Drawing.new("Line")
									espfolderdrawing[plr.Name] = thing
								end
								
								if isAlive(plr) and plr ~= lplr and (ESPTeammates["Enabled"] or shared.vapeteamcheck(plr)) then
									local rootPos, rootVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
									if rootVis and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")) and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Left Arm" or "LeftHand")) and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Right Arm" or "RightHand")) and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Left Leg" or "LeftFoot")) and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Right Leg" or "RightFoot")) and plr.Character:FindFirstChild("Head") then
										local head = CalculateObjectPosition((plr.Character["Head"].CFrame).p)
										local headfront = CalculateObjectPosition((plr.Character["Head"].CFrame * CFrame.new(0, 0, -0.5)).p)
										local toplefttorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(-1.5, 0.8, 0)).p)
										local toprighttorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(1.5, 0.8, 0)).p)
										local toptorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(0, 0.8, 0)).p)
										local bottomtorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(0, -0.8, 0)).p)
										local bottomlefttorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(-0.5, -0.8, 0)).p)
										local bottomrighttorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(0.5, -0.8, 0)).p)
										local leftarm = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Left Arm" or "LeftHand")].CFrame * CFrame.new(0, -0.8, 0)).p)
										local rightarm = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Right Arm" or "RightHand")].CFrame * CFrame.new(0, -0.8, 0)).p)
										local leftleg = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Left Leg" or "LeftFoot")].CFrame * CFrame.new(0, -0.8, 0)).p)
										local rightleg = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Right Leg" or "RightFoot")].CFrame * CFrame.new(0, -0.8, 0)).p)
										thing.Torso.From = toplefttorso
										thing.Torso.To = toprighttorso
										thing.Torso.Visible = true
										thing.Torso2.From = toptorso
										thing.Torso2.To = bottomtorso
										thing.Torso2.Visible = true
										thing.Torso3.From = bottomlefttorso
										thing.Torso3.To = bottomrighttorso
										thing.Torso3.Visible = true
										thing.LeftArm.From = toplefttorso
										thing.LeftArm.To = leftarm
										thing.LeftArm.Visible = true
										thing.RightArm.From = toprighttorso
										thing.RightArm.To = rightarm
										thing.RightArm.Visible = true
										thing.LeftLeg.From = bottomlefttorso
										thing.LeftLeg.To = leftleg
										thing.LeftLeg.Visible = true
										thing.RightLeg.From = bottomrighttorso
										thing.RightLeg.To = rightleg
										thing.RightLeg.Visible = true
										thing.Head.From = toptorso
										thing.Head.To = head
										thing.Head.Visible = true
										thing.Head2.From = head
										thing.Head2.To = headfront
										thing.Head2.Visible = true
										--[[CalculateLine(toplefttorso, toprighttorso, thing.TopTorsoLine)
										CalculateLine(toptorso, bottomtorso, thing.MiddleTorsoLine)
										CalculateLine(bottomlefttorso, bottomrighttorso, thing.BottomTorsoLine)
										CalculateLine(toplefttorso, leftarm, thing.LeftArm)
										CalculateLine(toprighttorso, rightarm, thing.RightArm)
										CalculateLine(bottomlefttorso, leftleg, thing.LeftLeg)
										CalculateLine(bottomrighttorso, rightleg, thing.RightLeg)
										CalculateLine(toptorso, head, thing.Head)
										CalculateLine(head, headfront, thing.HeadForward)]]
									end
								end
							end
						else
							if ESPMethod["Value"] == "2D" then
								if ESPFolder:FindFirstChild(plr.Name) then
									thing = ESPFolder[plr.Name]
									thing.Visible = false
									thing.Line1.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									thing.Line2.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									thing.Line3.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									thing.Line4.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
								else
									thing = Instance.new("Frame")
									thing.BackgroundTransparency = 1
									thing.BorderSizePixel = 0
									thing.Visible = false
									thing.Name = plr.Name
									thing.Parent = ESPFolder
									local line1 = Instance.new("Frame")
									line1.BorderSizePixel = 0
									line1.Name = "Line1"
									line1.ZIndex = 2
									line1.Size = UDim2.new(1, -2, 0, 1)
									line1.Position = UDim2.new(0, 1, 0, 1)
									line1.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									line1.Parent = thing
									local line2 = Instance.new("Frame")
									line2.BorderSizePixel = 0
									line2.Name = "Line2"
									line2.Size = UDim2.new(1, -2, 0, 1)
									line2.ZIndex = 2
									line2.Position = UDim2.new(0, 1, 1, -2)
									line2.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									line2.Parent = thing
									local line3 = Instance.new("Frame")
									line3.BorderSizePixel = 0
									line3.Name = "Line3"
									line3.Size = UDim2.new(0, 1, 1, -2)
									line3.Position = UDim2.new(0, 1, 0, 1)
									line3.ZIndex = 2
									line3.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									line3.Parent = thing
									local line4 = Instance.new("Frame")
									line4.BorderSizePixel = 0
									line4.Name = "Line4"
									line4.Size = UDim2.new(0, 1, 1, -2)
									line4.Position = UDim2.new(1, -2, 0, 1)
									line4.ZIndex = 2
									line4.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									line4.Parent = thing
									local line1clone = line1:Clone()
									line1clone.ZIndex = 1
									line1clone.Size = UDim2.new(1, 0, 0, 3)
									line1clone.BackgroundTransparency = 0.5
									line1clone.Position = UDim2.new(0, 0, 0, 0)
									line1clone.BackgroundColor3 = Color3.new(0, 0, 0)
									line1clone.Parent = thing
									local line2clone = line2:Clone()
									line2clone.ZIndex = 1
									line2clone.Size = UDim2.new(1, 0, 0, 3)
									line2clone.BackgroundTransparency = 0.5
									line2clone.Position = UDim2.new(0, 0, 1, -3)
									line2clone.BackgroundColor3 = Color3.new(0, 0, 0)
									line2clone.Parent = thing
									local line3clone = line3:Clone()
									line3clone.ZIndex = 1
									line3clone.Size = UDim2.new(0, 3, 1, 0)
									line3clone.BackgroundTransparency = 0.5
									line3clone.Position = UDim2.new(0, 0, 0, 0)
									line3clone.BackgroundColor3 = Color3.new(0, 0, 0)
									line3clone.Parent = thing
									local line4clone = line4:Clone()
									line4clone.ZIndex = 1
									line4clone.Size = UDim2.new(0, 3, 1, 0)
									line4clone.BackgroundTransparency = 0.5
									line4clone.Position = UDim2.new(1, -3, 0, 0)
									line4clone.BackgroundColor3 = Color3.new(0, 0, 0)
									line4clone.Parent = thing
									local healthline = Instance.new("Frame")
									healthline.BorderSizePixel = 0
									healthline.Name = "HealthLineMain"
									healthline.ZIndex = 2
									healthline.AnchorPoint = Vector2.new(0, 1)
									healthline.Visible = ESPHealthBar["Enabled"]
									healthline.Size = UDim2.new(0, 1, 1, -2)
									healthline.Position = UDim2.new(0, -4, 1, -1)
									healthline.BackgroundColor3 = Color3.new(0, 1, 0)
									healthline.Parent = thing
									local healthlineclone = healthline:Clone()
									healthlineclone.ZIndex = 1
									healthlineclone.AnchorPoint = Vector2.new(0, 0)
									healthlineclone.Size = UDim2.new(0, 3, 1, 0)
									healthlineclone.BackgroundTransparency = 0.5
									healthlineclone.Visible = ESPHealthBar["Enabled"]
									healthlineclone.Name = "HealthLineBKG"
									healthlineclone.Position = UDim2.new(0, -5, 0, 0)
									healthlineclone.BackgroundColor3 = Color3.new(0, 0, 0)
									healthlineclone.Parent = thing
								end
								
								if isAlive(plr) and plr ~= lplr and (ESPTeammates["Enabled"] or shared.vapeteamcheck(plr)) then
									local rootPos, rootVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
									local rootSize = (plr.Character.HumanoidRootPart.Size.X * 1200) * (cam.ViewportSize.X / 1920)
									local headPos, headVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position + Vector3.new(0, 1 + plr.Character.Humanoid.HipHeight, 0))
									local legPos, legVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0, 1 + plr.Character.Humanoid.HipHeight, 0))
									rootPos = rootPos
									if rootVis then
										if ESPHealthBar["Enabled"] then
											local color = HealthbarColorTransferFunction(plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth)
											thing.HealthLineMain.BackgroundColor3 = color
											thing.HealthLineMain.Size = UDim2.new(0, 1, math.clamp(plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth, 0, 1), (math.clamp(plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth, 0, 1) == 0 and 0 or -2))
										end
										thing.Visible = rootVis
										thing.Size = UDim2.new(0, rootSize / rootPos.Z, 0, headPos.Y - legPos.Y)
										thing.Position = UDim2.new(0, rootPos.X - thing.Size.X.Offset / 2, 0, (rootPos.Y - thing.Size.Y.Offset / 2) - 36)
									end
								end
							end
							if ESPMethod["Value"] == "Skeleton" then
								if ESPFolder:FindFirstChild(plr.Name) then
									thing = ESPFolder[plr.Name]
									thing.Visible = false
									for linenum, line in pairs(thing:GetChildren()) do
										line.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									end
								else
									thing = Instance.new("Frame")
									thing.BackgroundTransparency = 1
									thing.BorderSizePixel = 0
									thing.Visible = false
									thing.Name = plr.Name
									thing.Parent = ESPFolder
									local line1 = Instance.new("Frame")
									line1.BorderSizePixel = 0
									line1.Name = "TopTorsoLine"
									line1.AnchorPoint = Vector2.new(0.5, 0.5)
									line1.ZIndex = 2
									line1.Size = UDim2.new(0, 0, 0, 0)
									line1.Position = UDim2.new(0, 0, 0, 0)
									line1.BackgroundColor3 = getPlayerColor(plr) or Color3.fromHSV(ESPColor["Hue"], ESPColor["Sat"], ESPColor["Value"])
									line1.Parent = thing
									local line2 = line1:Clone()
									line2.Name = "MiddleTorsoLine"
									line2.Parent = thing
									local line3 = line1:Clone()
									line3.Name = "BottomTorsoLine"
									line3.Parent = thing
									local line4 = line1:Clone()
									line4.Name = "LeftArm"
									line4.Parent = thing
									local line5 = line1:Clone()
									line5.Name = "RightArm"
									line5.Parent = thing
									local line6 = line1:Clone()
									line6.Name = "LeftLeg"
									line6.Parent = thing
									local line7 = line1:Clone()
									line7.Name = "RightLeg"
									line7.Parent = thing
									local line8 = line1:Clone()
									line8.Name = "Head"
									line8.Parent = thing
									local line9 = line1:Clone()
									line9.Name = "HeadForward"
									line9.Parent = thing
								end
								
								if isAlive(plr) and plr ~= lplr and (ESPTeammates["Enabled"] or shared.vapeteamcheck(plr)) then
									local rootPos, rootVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
									if rootVis and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")) and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Left Arm" or "LeftHand")) and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Right Arm" or "RightHand")) and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Left Leg" or "LeftFoot")) and plr.Character:FindFirstChild((plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Right Leg" or "RightFoot")) and plr.Character:FindFirstChild("Head") then
										thing.Visible = true
										local head = CalculateObjectPosition((plr.Character["Head"].CFrame).p)
										local headfront = CalculateObjectPosition((plr.Character["Head"].CFrame * CFrame.new(0, 0, -0.5)).p)
										local toplefttorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(-1.5, 0.8, 0)).p)
										local toprighttorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(1.5, 0.8, 0)).p)
										local toptorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(0, 0.8, 0)).p)
										local bottomtorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(0, -0.8, 0)).p)
										local bottomlefttorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(-0.5, -0.8, 0)).p)
										local bottomrighttorso = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Torso" or "UpperTorso")].CFrame * CFrame.new(0.5, -0.8, 0)).p)
										local leftarm = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Left Arm" or "LeftHand")].CFrame * CFrame.new(0, -0.8, 0)).p)
										local rightarm = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Right Arm" or "RightHand")].CFrame * CFrame.new(0, -0.8, 0)).p)
										local leftleg = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Left Leg" or "LeftFoot")].CFrame * CFrame.new(0, -0.8, 0)).p)
										local rightleg = CalculateObjectPosition((plr.Character[(plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and "Right Leg" or "RightFoot")].CFrame * CFrame.new(0, -0.8, 0)).p)
										CalculateLine(toplefttorso, toprighttorso, thing.TopTorsoLine)
										CalculateLine(toptorso, bottomtorso, thing.MiddleTorsoLine)
										CalculateLine(bottomlefttorso, bottomrighttorso, thing.BottomTorsoLine)
										CalculateLine(toplefttorso, leftarm, thing.LeftArm)
										CalculateLine(toprighttorso, rightarm, thing.RightArm)
										CalculateLine(bottomlefttorso, leftleg, thing.LeftLeg)
										CalculateLine(bottomrighttorso, rightleg, thing.RightLeg)
										CalculateLine(toptorso, head, thing.Head)
										CalculateLine(head, headfront, thing.HeadForward)
									end
								end
							end
						end
					end
				end)
			else
				UnbindFromRenderStep("ESP") 
				ESPFolder:ClearAllChildren()
				for i,v in pairs(espfolderdrawing) do 
					pcall(function()
						espfolderdrawing[i].Quad1:Remove()
						espfolderdrawing[i].Quad2:Remove()
						espfolderdrawing[i].Quad3:Remove()
						espfolderdrawing[i].Quad4:Remove()
						espfolderdrawing[i] = nil
					end)
					pcall(function()
						espfolderdrawing[i].Head:Remove()
						espfolderdrawing[i].Head2:Remove()
						espfolderdrawing[i].Torso:Remove()
						espfolderdrawing[i].Torso2:Remove()
						espfolderdrawing[i].Torso3:Remove()
						espfolderdrawing[i].LeftArm:Remove()
						espfolderdrawing[i].RightArm:Remove()
						espfolderdrawing[i].LeftLeg:Remove()
						espfolderdrawing[i].RightLeg:Remove()
						espfolderdrawing[i] = nil
					end)
				end
			end
		end,
		["HoverText"] = "Extra Sensory Perception\nRenders an ESP on players."
	})
	ESPMethod = ESP.CreateDropdown({
		["Name"] = "Mode",
		["List"] = {"2D", "Skeleton"},
		["Function"] = function(val)
			ESPFolder:ClearAllChildren()
			for i,v in pairs(espfolderdrawing) do 
				pcall(function()
					espfolderdrawing[i].Quad1:Remove()
					espfolderdrawing[i].Quad2:Remove()
					espfolderdrawing[i].Quad3:Remove()
					espfolderdrawing[i].Quad4:Remove()
					espfolderdrawing[i] = nil
				end)
				pcall(function()
					espfolderdrawing[i].Head:Remove()
					espfolderdrawing[i].Head2:Remove()
					espfolderdrawing[i].Torso:Remove()
					espfolderdrawing[i].Torso2:Remove()
					espfolderdrawing[i].Torso3:Remove()
					espfolderdrawing[i].LeftArm:Remove()
					espfolderdrawing[i].RightArm:Remove()
					espfolderdrawing[i].LeftLeg:Remove()
					espfolderdrawing[i].RightLeg:Remove()
					espfolderdrawing[i] = nil
				end)
			end
			ESPHealthBar["Object"].Visible = (val == "2D")
		end,
	})
	ESPColor = ESP.CreateColorSlider({
		["Name"] = "Player Color", 
		["Function"] = function(val) end
	})
	ESPHealthBar = ESP.CreateToggle({
		["Name"] = "Health Bar", 
		["Function"] = function(callback)
			if callback then 
				for i,v in pairs(ESPFolder:GetChildren()) do
					v.HealthLineMain.Visible = true
					v.HealthLineBKG.Visible = true
				end
			else
				for i,v in pairs(ESPFolder:GetChildren()) do
					v.HealthLineMain.Visible = false
					v.HealthLineBKG.Visible = false
				end
			end
		end
	})
	ESPTeammates = ESP.CreateToggle({
		["Name"] = "Teammates",
		["Function"] = function() end,
		["Default"] = true
	})
	ESPDrawing = ESP.CreateToggle({
		["Name"] = "Drawing",
		["Function"] = function() 
			ESPFolder:ClearAllChildren()
			for i,v in pairs(espfolderdrawing) do 
				pcall(function()
					espfolderdrawing[i].Quad1:Remove()
					espfolderdrawing[i].Quad2:Remove()
					espfolderdrawing[i].Quad3:Remove()
					espfolderdrawing[i].Quad4:Remove()
					espfolderdrawing[i] = nil
				end)
				pcall(function()
					espfolderdrawing[i].Head:Remove()
					espfolderdrawing[i].Head2:Remove()
					espfolderdrawing[i].Torso:Remove()
					espfolderdrawing[i].Torso2:Remove()
					espfolderdrawing[i].Torso3:Remove()
					espfolderdrawing[i].LeftArm:Remove()
					espfolderdrawing[i].RightArm:Remove()
					espfolderdrawing[i].LeftLeg:Remove()
					espfolderdrawing[i].RightLeg:Remove()
					espfolderdrawing[i] = nil
				end)
			end
		end,
	})
end)


local Animate = game.Players.LocalPlayer.Character.Animate
local Anim2 = Utility.CreateOptionsButton({
    ["Name"] = "CryAnim", 
    ["Function"] = function(callback) 
        if callback then
        for i, player in ipairs(game.Players:GetChildren()) do
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=4940563117"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=4940563117"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=4940563117"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=4940563117"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=4940563117"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=4940563117"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=4940563117"
        game.Players.LocalPlayer.Character.Humanoid.Jump = false
        end
        else
        print("Disabled!")
        end
    end,
    ["HoverText"] = "Changes animation", 
    ["Default"] = false,
})

shared.VapeManualLoad = true