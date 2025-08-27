local TealaxLoader = {}
local loaderClosed = false

local function createLoader()
    if loaderClosed then return nil end

    -- Önceki loader'ı temizle
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local existingGui = playerGui:FindFirstChild("TealaxLoader")
    if existingGui then existingGui:Destroy() end

    -- Yeni GUI oluştur
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TealaxLoader"
    screenGui.Parent = playerGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false

    -- Ana çerçeve
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    mainFrame.Parent = screenGui

    -- Köşe yuvarlama (ana çerçeve)
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 8)
    mainCorner.Parent = mainFrame

    -- Başlık çubuğu
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    -- Başlık metni
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -60, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "TEALAX SCRIPT LOADER | Num Lock Aç/Kapat"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar

    -- Kapatma butonu
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 100, 100)
    closeButton.TextSize = 14
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = titleBar

    -- ScrollingFrame (Script listesi için)
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -20, 1, -50)
    scrollFrame.Position = UDim2.new(0, 10, 0, 40)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 5
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.Parent = mainFrame

    -- UIListLayout
    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.Parent = scrollFrame

    -- Durum metni
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, -20, 0, 20)
    statusLabel.Position = UDim2.new(0, 10, 1, -25)
    statusLabel.AnchorPoint = Vector2.new(0, 1)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = ""
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusLabel.TextSize = 12
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.Parent = mainFrame

    -- Script listesi
    local scripts = {
        {"Nameless Admin", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()'},
        {"The Strongle Battlegrounds", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/TSB/main/TSB"))()'},
        {"Soluna GUI", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/main.lua"))()'},
        {"Murder Mystery 2 (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/murder-mystery-2.lua"))()'},
        {"Murder Mystery 2 (XHub)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CycleScripts/Official/refs/heads/main/freemium"))()'},
        {"Brookhaven RP (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/brookhaven.lua"))()'},
        {"Big Paintball 2 (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/big-paintball-2.lua"))()'},
        {"Murderers vs Sheriffs Duels (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/murderers-vs-sheriffs-duels.lua"))()'},
        {"Bladeball (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua"))()'},
        {"Flee the Facility (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/flee-the-facility.lua"))()'}
    }

    -- Script butonlarını oluştur
    for _, scriptData in ipairs(scripts) do
        local name, code = scriptData[1], scriptData[2]
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 40)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        frame.BorderSizePixel = 0
        frame.Parent = scrollFrame

        -- Köşe yuvarlama (script butonları)
        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 5)
        frameCorner.Parent = frame

        -- Script ismi
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

        -- Çalıştır butonu
        local executeButton = Instance.new("TextButton")
        executeButton.Size = UDim2.new(0, 100, 0, 30)
        executeButton.Position = UDim2.new(1, -110, 0.5, -15)
        executeButton.AnchorPoint = Vector2.new(0, 0.5)
        executeButton.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
        executeButton.Text = "ÇALIŞTIR"
        executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        executeButton.TextSize = 12
        executeButton.Font = Enum.Font.GothamBold
        executeButton.Parent = frame

        -- Köşe yuvarlama (çalıştır butonu)
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 5)
        buttonCorner.Parent = executeButton

        -- Butona tıklandığında
        executeButton.MouseButton1Click:Connect(function()
            executeButton.Text = "YÜKLENİYOR..."
            executeButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)

            local success, err = pcall(function()
                loadstring(code)()
            end)

            if not success then
                executeButton.Text = "HATA"
                executeButton.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
            else
                executeButton.Text = "YÜKLENDİ"
                executeButton.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
            end

            task.wait(2)
            executeButton.Text = "ÇALIŞTIR"
            executeButton.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
        end)
    end

    -- Pencere sürükleme işlevi
    local dragging, dragStart, startPos
    local function update(input)
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
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)

    -- Kapatma butonu
    closeButton.MouseButton1Click:Connect(function()
        loaderClosed = true
        screenGui:Destroy()
    end)

    -- Num Lock ile aç/kapa
    game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == Enum.KeyCode.NumLock then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)

    return screenGui
end

-- Loader'ı oluştur
local loaderGui = createLoader()
