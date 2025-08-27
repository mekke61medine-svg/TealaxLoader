local TealaxLoader = {}

-- GUI oluşturma
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TealaxLoader"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 520)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -260)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Gölge efekti
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://5554236805"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = mainFrame

-- Başlık çubuğu
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "TEALAX SCRIPT LOADER"
title.TextColor3 = Color3.fromRGB(220, 220, 220)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Pencere kontrol butonları (daha modern tasarım)
local minimizeButton = Instance.new("ImageButton")
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -55, 0.5, -12.5)
minimizeButton.AnchorPoint = Vector2.new(1, 0.5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
minimizeButton.Image = "rbxassetid://3926305904"
minimizeButton.ImageRectOffset = Vector2.new(924, 724)
minimizeButton.ImageRectSize = Vector2.new(36, 36)
minimizeButton.ImageColor3 = Color3.fromRGB(200, 200, 200)
minimizeButton.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 5)
minimizeCorner.Parent = minimizeButton

local closeButton = Instance.new("ImageButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -25, 0.5, -12.5)
closeButton.AnchorPoint = Vector2.new(1, 0.5)
closeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
closeButton.Image = "rbxassetid://3926305904"
closeButton.ImageRectOffset = Vector2.new(284, 4)
closeButton.ImageRectSize = Vector2.new(24, 24)
closeButton.ImageColor3 = Color3.fromRGB(200, 200, 200)
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeButton

-- Buton hover efektleri
minimizeButton.MouseEnter:Connect(function()
    minimizeButton.BackgroundColor3 = Color3.fromRGB(90, 90, 100)
end)

minimizeButton.MouseLeave:Connect(function()
    minimizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
end)

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 70, 70)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
end)

-- Script listesi için kaydırma çerçevesi
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -80)
scrollFrame.Position = UDim2.new(0, 10, 0, 45)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 5
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.Parent = mainFrame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Padding = UDim.new(0, 8)
uiListLayout.Parent = scrollFrame

-- Durum bilgisi (en alta taşındı)
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 20)
statusLabel.Position = UDim2.new(0, 10, 1, -5)
statusLabel.AnchorPoint = Vector2.new(0, 1)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Num Lock: Aç/Kapa"
statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
statusLabel.TextSize = 12
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

-- Script listesi
local scripts = {
    {"Nameless Admin", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()'},
    {"The Strongle Battlegrounds", "loadstring(game:HttpGet('https://raw.githubusercontent.com/BaconBossScript/TSB/main/TSB'))()"},
    {"Soluna GUI", "loadstring(game:HttpGet('https://soluna-script.vercel.app/main.lua', true))()"},
    {"Murder Mystery 2 (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/murder-mystery-2.lua', true))()"},
    {"Murder Mystery 2 (XHub)", "loadstring(game:HttpGet('https://raw.githubusercontent.com/CycleScripts/Official/refs/heads/main/freemium'))()"},
    {"Brookhaven RP (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/brookhaven.lua', true))()"},
    {"Big Paintball 2 (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/big-paintball-2.lua', true))()"},
    {"Murderers vs Sheriffs Duels (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/murderers-vs-sheriffs-duels.lua', true))()"},
    {"Bladeball (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/bladeball.lua', true))()"},
    {"Flee the Facility (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/flee-the-facility.lua', true))()"},
    {"Grow a Garden (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/grow-a-garden.lua', true))()"},
    {"Combat Warriors (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/combat-warriors.lua', true))()"},
    {"Adopt Me (Eclipse Hub)", [[
        getgenv().mainKey = "nil"
        local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https://api.eclipsehub.xyz/auth"
        c(a and b,"Executor not Supported")
        a(b({Url=e.."?key="..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
    ]]},
    {"Auaqa Aimbot ESP", [[
        getgenv().Key = "AuaqaHUB17238"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AuaqaScripts/Auaqashub/refs/heads/main/Loader"))()
    ]]},
    {"Auaqa AntiAFK", [[
        getgenv().Key = "AuaqaHUB17238"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AuaqaScripts/AntiAFK/refs/heads/main/AFK"))()
    ]]},
    {"Blox Fruits", "loadstring(game:HttpGet('https://pastefy.app/3p48JfRa/raw'))()"},
    {"Steal a Brain Rot", "loadstring(game:HttpGet('https://raw.githubusercontent.com/comppfun/script/refs/heads/main/script'))()"},
    {"Legends of Speed (OrbitSC)", "loadstring(game:HttpGet('https://orbitsc.net/los'))()"},
    {"Frontlines (OrbitSC Aim/ESP)", "loadstring(game:HttpGet('https://orbitsc.net/frontlines'))()"},
    {"Anti Kick", [[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/raavenkkj/anti-kick/main/anti-kick.lua"))()
        getgenv().AntiKick = true
        getgenv().Notifications = true
    ]]},
    {"Anti Ban", [[
        local X;
        X = hookmetamethod(game, "__namecall", function(self, ...)
           if getnamecallmethod() == "Ban" then
               return wait(9e9)
           end
           return X(self, ...)
        end)
    ]]},
    {"Chat Bypass", [[
        pcall(function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-BYPASS/main/kawaii-bypass",true))()
        end)
    ]]},
    {"Car Crash System", "loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinMitnickHKR/Script-Documents/refs/heads/main/Car%20Crash%20System'))()"},
    {"Doors Universal (Rael Hub)", "loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Rael-Hub-27610'))()"}
}

-- Script butonlarını oluştur
for i, scriptData in ipairs(scripts) do
    local name, code = scriptData[1], scriptData[2]
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 45)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    frame.BorderSizePixel = 0
    frame.Parent = scrollFrame
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 6)
    frameCorner.Parent = frame
    
    -- Hafif gölge efekti
    local frameShadow = Instance.new("ImageLabel")
    frameShadow.Size = UDim2.new(1, 4, 1, 4)
    frameShadow.Position = UDim2.new(0, -2, 0, -2)
    frameShadow.BackgroundTransparency = 1
    frameShadow.Image = "rbxassetid://5554236805"
    frameShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    frameShadow.ImageTransparency = 0.8
    frameShadow.ScaleType = Enum.ScaleType.Slice
    frameShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    frameShadow.ZIndex = -1
    frameShadow.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, -10, 1, 0)
    label.Position = UDim2.new(0, 15, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham
    label.Parent = frame
    
    local executeButton = Instance.new("TextButton")
    executeButton.Size = UDim2.new(0.3, -10, 0, 32)
    executeButton.Position = UDim2.new(0.65, 5, 0.5, -16)
    executeButton.BackgroundColor3 = Color3.fromRGB(70, 150, 90)
    executeButton.Text = "ÇALIŞTIR"
    executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeButton.TextSize = 12
    executeButton.Font = Enum.Font.GothamBold
    executeButton.Parent = frame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = executeButton
    
    -- Buton hover efekti
    executeButton.MouseEnter:Connect(function()
        executeButton.BackgroundColor3 = Color3.fromRGB(90, 170, 110)
    end)
    
    executeButton.MouseLeave:Connect(function()
        executeButton.BackgroundColor3 = Color3.fromRGB(70, 150, 90)
    end)
    
    executeButton.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(code)()
        end)
        
        if success then
            executeButton.Text = "TAMAMLANDI"
            executeButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
        else
            executeButton.Text = "HATA"
            executeButton.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
            warn("Script yüklenirken hata: " .. name .. " - " .. err)
        end
        
        wait(1.5)
        executeButton.Text = "ÇALIŞTIR"
        executeButton.BackgroundColor3 = Color3.fromRGB(70, 150, 90)
    end)
end

-- Pencere kontrol işlevleri
local dragging = false
local dragInput, dragStart, startPos

local function updateInput(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

minimizeButton.MouseButton1Click:Connect(function()
    scrollFrame.Visible = not scrollFrame.Visible
    statusLabel.Visible = not statusLabel.Visible
    if scrollFrame.Visible then
        mainFrame.Size = UDim2.new(0, 420, 0, 520)
    else
        mainFrame.Size = UDim2.new(0, 420, 0, 40)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Klavye kısayolları (sadece Num Lock)
local uis = game:GetService("UserInputService")
local numLockToggle = false

uis.InputBegan:Connect(function(input, processed)
    if processed then return end
    
    -- Num Lock tuşu ile açma/kapama
    if input.KeyCode == Enum.KeyCode.NumLock then
        numLockToggle = not numLockToggle
        mainFrame.Visible = numLockToggle
    end
end)

return TealaxLoader
