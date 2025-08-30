local TealaxLoader = {}
local loaderClosed = false

local function createLoader()
    if loaderClosed then return nil end

    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local existingGui = playerGui:FindFirstChild("TealaxLoader")
    if existingGui then existingGui:Destroy() end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TealaxLoader"
    screenGui.Parent = playerGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    mainFrame.Parent = screenGui

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 8)
    mainCorner.Parent = mainFrame

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -60, 1, 0)
    title.Position = UDim2.new(0, 30, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "TEALAXㅤSCRIPTㅤLOADER"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 18
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = titleBar

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -60, 0, 5)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    minimizeButton.BorderSizePixel = 0
    minimizeButton.Text = "_"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.TextSize = 16
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.Parent = titleBar

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 100, 100)
    closeButton.TextSize = 14
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = titleBar

    local bottomBlackArea = Instance.new("Frame")
    bottomBlackArea.Size = UDim2.new(1, 0, 0, 20)
    bottomBlackArea.Position = UDim2.new(0, 0, 1, -20)
    bottomBlackArea.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bottomBlackArea.BorderSizePixel = 0
    bottomBlackArea.Parent = mainFrame

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -20, 1, -60)
    scrollFrame.Position = UDim2.new(0, 10, 0, 40)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.Parent = mainFrame

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.Parent = scrollFrame

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, 0, 1, 0)
    statusLabel.Position = UDim2.new(0, 0, 0, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "NumㅤLockㅤAç/KapaㅤV1ㅤSTABLE"
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusLabel.TextSize = 12
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextXAlignment = Enum.TextXAlignment.Center
    statusLabel.Parent = bottomBlackArea

    local scripts = {
        {"NamelessㅤAdmin", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/NA%20testing.lua"))()'},
        {"CHATㅤBYPASS", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-BYPASS/main/kawaii-bypass",true))()'},
        {"TheㅤStrongleㅤBattlegrounds", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()'},
        {"SolunaㅤGUI", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/main.lua"))()'},
        {"MurderㅤMysteryㅤ2ㅤ(Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/murder-mystery-2.lua"))()'},
        {"MurderㅤMysteryㅤ2ㅤ(XHub)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CycycleScripts/Official/refs/heads/main/freemium"))()'},
        {"MurderㅤMysteryㅤ2ㅤ(RadeonㅤHub)", 'loadstring(game:HttpGet("https://pastebin.com/raw/v1LKQGxN", true))()'},
        {"BrookhavenㅤRPㅤ(Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/brookhaven.lua"))()'},
        {"BrookhavenㅤRPㅤ(SanderㅤXY)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()'},
        {"BigㅤPaintballㅤ2ㅤ(Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/big-paintball-2.lua"))()'},
        {"MurderersㅤvsㅤSheriffsㅤDuelsㅤ(Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/murderers-vs-sheriffs-duels.lua"))()'},
        {"Bladeballㅤ(Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua"))()'},
        {"FleeㅤtheㅤFacilityㅤ(Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/flee-the-facility.lua"))()'},
        {"CarㅤCrashㅤSystem", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/KevinMitnickHKR/Script-Documents/refs/heads/main/Car%20Crash%20System"))()'},
        {"TowerㅤOfㅤHell", 'loadstring(game:HttpGet("https://coolxplo.github.io/DP-HUB-coolxplo/Tower%20Of%20Hell.lua", true))()'},
        {"Therapyㅤ(Depso)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/tealaxbey/therapydepso/refs/heads/main/therapydepso.lua"))()'},
        {"Therapyㅤ(Hello)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/therapy-gui/main/therapy-gui.lua", true))()'},
        {"Jailbreakㅤ(UniversalㅤFarm)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()'},
        {"Jailbreakㅤ(Astral)", 'loadstring(game:HttpGet("https://astral.gay/loader.luau"))()'},
        {"BloxㅤFruitsㅤ(SolixㅤHub)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/refs/heads/main/solix%20new%20keyui.lua"))()'},
        {"DressㅤToㅤImpress", 'loadstring(game:HttpGetAsync("https://pastebin.com/raw/fvnaQ0a8", true))()'},
        {"DressㅤToㅤImpressㅤ(SolaraㅤUNC)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Python/refs/heads/main/DTI.py"))()'},
        {"SquidㅤGameㅤXㅤ(PENTA)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/SquidGameX.lua"))()'},
        {"Doorsㅤ(RaelㅤHub)", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rael-Hub-27610"))()'},
        {"SpeedㅤofㅤLegendsㅤ(orbitscㅤkeyli)", 'loadstring(game:HttpGet("https://orbitsc.net/los"))()'},
        {"Piggyㅤ(PulseㅤHub)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Chavels123/Loader/refs/heads/main/loader.lua"))()'}
        {"Muscle Legendsㅤ(orbitscㅤKeyli)", 'loadstring(game:HttpGet("https://orbitsc.net/musclel"))()'},
    }

    for _, scriptData in ipairs(scripts) do
        local name, code = scriptData[1], scriptData[2]
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 40)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        frame.BorderSizePixel = 0
        frame.Parent = scrollFrame

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 5)
        frameCorner.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.65, -10, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Font = Enum.Font.Gotham
        label.Parent = frame

        local executeButton = Instance.new("TextButton")
        executeButton.Size = UDim2.new(0.3, -10, 0.7, 0)
        executeButton.Position = UDim2.new(0.7, 5, 0.15, 0)
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
            executeButton.Text = "YÜKLENİYOR..."
            executeButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)

            -- Önce normal çalıştır
            local success = true
            local err = nil
            
            -- Normal çalıştırma dene
            local func, compileError = loadstring(code)
            if func then
                success, err = pcall(func)
            else
                success = false
                err = compileError
            end

            -- Normal çalışmazsa try-catch dene
            if not success then
                success, err = pcall(function()
                    loadstring(code)()
                end)
            end

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

    local dragging, dragInput, dragStart, startPos
    local dragSpeed = 1

    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X * dragSpeed, startPos.Y.Scale, startPos.Y.Offset + delta.Y * dragSpeed)
    end

    local function startDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end

    titleBar.InputBegan:Connect(startDrag)
    bottomBlackArea.InputBegan:Connect(startDrag)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    bottomBlackArea.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    minimizeButton.MouseButton1Click:Connect(function()
        scrollFrame.Visible = not scrollFrame.Visible
        statusLabel.Visible = not statusLabel.Visible
        bottomBlackArea.Visible = not bottomBlackArea.Visible
        mainFrame.Size = scrollFrame.Visible and UDim2.new(0, 400, 0, 500) or UDim2.new(0, 400, 0, 40)
    end)

    closeButton.MouseButton1Click:Connect(function()
        loaderClosed = true
        screenGui:Destroy()
    end)

    game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == Enum.KeyCode.NumLock then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)

    return screenGui
end

-- Loader'ı çalıştır
local loaderGui = createLoader()
