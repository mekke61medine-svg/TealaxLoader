local TealaxLoader = {}

-- GUI oluşturma (CoreGui'ye ekle, böylece ölünce kapanmaz)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TealaxLoader"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false -- Bu satır önemli: reset'te kapanmasın

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250) -- Burada düzeltme yapıldı (mainGui yerine mainFrame)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Başlık çubuğu
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "TEALAX SCRIPT LOADER"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Pencere kontrol butonları
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -60, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 16
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 100, 100)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = titleBar

-- Script listesi için kaydırma çerçevesi
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -70)
scrollFrame.Position = UDim2.new(0, 10, 0, 40)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 5
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.Parent = mainFrame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Padding = UDim.new(0, 5)
uiListLayout.Parent = scrollFrame

-- Durum bilgisi
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 20)
statusLabel.Position = UDim2.new(0, 10, 1, -5)
statusLabel.AnchorPoint = Vector2.new(0, 1)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Num Lock: Aç/Kapa"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
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
    {"Flee the Facility (Soluna)", "loadstring(game:HttpGet('https://soluna-script.vercel.app/flee-the-facility.lua', true))()"}
}

-- Script butonlarını oluştur
for i, scriptData in ipairs(scripts) do
    local name, code = scriptData[1], scriptData[2]
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    frame.BorderSizePixel = 0
    frame.Parent = scrollFrame
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 5)
    frameCorner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, -10, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham
    label.Parent = frame
    
    local executeButton = Instance.new("TextButton")
    executeButton.Size = UDim2.new(0.3, -10, 0, 30)
    executeButton.Position = UDim2.new(0.7, 5, 0.5, -15)
    executeButton.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
    executeButton.Text = "ÇALIŞTIR"
    executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeButton.TextSize = 12
    executeButton.Font = Enum.Font.GothamBold
    executeButton.Parent = frame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = executeButton
    
    executeButton.MouseButton1Click:Connect(function()
        -- Butonu devre dışı bırak ve "ÇALIŞTI" yaz
        executeButton.Text = "ÇALIŞTI"
        executeButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
        executeButton.AutoButtonColor = false
        executeButton.Active = false
        
        -- Scripti çalıştır
        local success, err = pcall(function()
            loadstring(code)()
        end)
        
        if not success then
            executeButton.Text = "HATA"
            executeButton.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
            warn("Script yüklenirken hata: " .. name .. " - " .. err)
        end
        
        -- 2.5 saniye bekle ve butonu eski haline getir
        wait(2.5)
        executeButton.Text = "ÇALIŞTIR"
        executeButton.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
        executeButton.AutoButtonColor = true
        executeButton.Active = true
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
        mainFrame.Size = UDim2.new(0, 400, 0, 500)
    else
        mainFrame.Size = UDim2.new(0, 400, 0, 40)
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
