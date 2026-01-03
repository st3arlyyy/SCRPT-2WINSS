local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- ГЕНЕРАЦИЯ HWID (Уникальный ключ для инжектора)
local function GetHWID()
    return "2W-" .. (LocalPlayer.UserId * 2) .. "-" .. (game.JobId:sub(1,8))
end

-- БАЗА ДАННЫХ КЛЮЧЕЙ (100 ШТУК ПО 16 СИМВОЛОВ)
local KEYS = {
    ["4H7B-K9L2-M1X8-P0Q5"] = true, ["Z9X1-V2N8-M4L3-K5J7"] = true, ["Q7W1-E4R8-T2Y5-U0I9"] = true, ["A3S8-D1F5-G9H2-J4K6"] = true,
    ["P0O9-I8U7-Y6T5-R4E3"] = true, ["M1N2-B3V4-C5X6-Z7A8"] = true, ["S9D8-F7G6-H5J4-K3L2"] = true, ["X1C2-V3B4-N5M6-Q7W8"] = true,
    ["E9R0-T1Y2-U3I4-O5P6"] = true, ["L7K8-J9H0-G1F2-D3S4"] = true, ["Y6T5-R4E3-W2Q1-M0N9"] = true, ["B8V7-C6X5-Z4A3-S2D1"] = true,
    ["F0G1-H2J3-K4L5-P6O7"] = true, ["I8U9-Y0T1-R2E3-W4Q5"] = true, ["N6M7-B8V9-C0X1-Z2A3"] = true, ["S4D5-F6G7-H8J9-K0L1"] = true,
    ["W2Q3-E4R5-T6Y7-U8I9"] = true, ["O0P1-A2S3-D4F5-G6H7"] = true, ["J8K9-L0M1-N2B3-V4C5"] = true, ["X6Z7-A8S9-D0F1-G2H3"] = true,
    ["T4Y5-U6I7-O8P9-A0S1"] = true, ["D2F3-G4H5-J6K7-L8M9"] = true, ["N0B1-V2C3-X4Z5-A6S7"] = true, ["Q8W9-E0R1-T2Y3-U4I5"] = true,
    ["O6P7-L8K9-J0H1-G2F3"] = true, ["D4S5-A6Z7-X8C9-V0B1"] = true, ["N2M3-Q4W5-E6R7-T8Y9"] = true, ["U0I1-O2P3-A4S5-D6F7"] = true,
    ["G8H9-J0K1-L2M3-N4B5"] = true, ["V6C7-X8Z9-Q0W1-E2R3"] = true, ["T4Y5-U6I7-O8P9-L0K1"] = true, ["J2H3-G4F5-D6S7-A8Z9"] = true,
    ["X0C1-V2B3-N4M5-Q6W7"] = true, ["E8R9-T0Y1-U2I3-O4P5"] = true, ["A6S7-D8F9-G0H1-J2K3"] = true, ["L4M5-N6B7-V8C9-X0Z1"] = true,
    ["P2O3-I4U5-Y6T7-R8E9"] = true, ["W0Q1-M2N3-B4V5-C6X7"] = true, ["Z8A9-S0D1-F2G3-H4J5"] = true, ["K6L7-Q8W9-E0R1-T2Y3"] = true,
    ["U4I5-O6P7-A8S9-D0F1"] = true, ["G2H3-J4K5-L6M7-N8B9"] = true, ["V0C1-X2Z3-A4S5-D6F7"] = true, ["G8H9-J0K1-Q2W3-E4R5"] = true,
    ["T6Y7-U8I9-O0P1-A2S3"] = true, ["D4F5-G6H7-J8K9-L0M1"] = true, ["N2B3-V4C5-X6Z7-A8S9"] = true, ["D0F1-G2H3-J4K5-L6M7"] = true,
    ["N8B9-V0C1-X2Z3-Q4W5"] = true, ["E6R7-T8Y9-U0I1-O2P3"] = true, ["A4S5-D6F7-G8H9-J0K1"] = true, ["L2M3-N4B5-V6C7-X8Z9"] = true,
    ["Q0W1-E2R3-T4Y5-U6I7"] = true, ["O8P9-A0S1-D2F3-G4H5"] = true, ["J6K7-L8M9-N0B1-V2C3"] = true, ["X4Z5-A6S7-D8F9-G0H1"] = true,
    ["J2K3-L4M5-N6B7-V8C9"] = true, ["X0Z1-P2O3-I4U5-Y6T7"] = true, ["R8E9-W0Q1-M2N3-B4V5"] = true, ["C6X7-Z8A9-S0D1-F2G3"] = true,
    ["H4J5-K6L7-Q8W9-E0R1"] = true, ["T2Y3-U4I5-O6P7-A8S9"] = true, ["D0F1-G2H3-J4K5-L6M7"] = true, ["N8B9-V0C1-X2Z3-A4S5"] = true,
    ["D6F7-G8H9-J0K1-L2M3"] = true, ["N4B5-V6C7-X8Z9-Q0W1"] = true, ["E2R3-T4Y5-U6I7-O8P9"] = true, ["A0S1-D2F3-G4H5-J6K7"] = true,
    ["L8M9-N0B1-V2C3-X4Z5"] = true, ["A6S7-D8F9-G0H1-J2K3"] = true, ["L4M5-N6B7-V8C9-X0Z1"] = true, ["P2O3-I4U5-Y6T7-R8E9"] = true,
    ["W0Q1-E2R3-T4Y5-U6I7"] = true, ["O8P9-A0S1-D2F3-G4H5"] = true, ["J6K7-L8M9-N0B1-V2C3"] = true, ["X4Z5-A6S7-D8F9-G0H1"] = true,
    ["J2K3-L4M5-N6B7-V8C9"] = true, ["X0Z1-P2O3-I4U5-Y6T7"] = true, ["R8E9-W0Q1-M2N3-B4V5"] = true, ["C6X7-Z8A9-S0D1-F2G3"] = true,
    ["H4J5-K6L7-Q8W9-E0R1"] = true, ["T2Y3-U4I5-O6P7-A8S9"] = true, ["D0F1-G2H3-J4K5-L6M7"] = true, ["N8B9-V0C1-X2Z3-A4S5"] = true,
    ["D6F7-G8H9-J0K1-L2M3"] = true, ["N4B5-V6C7-X8Z9-Q0W1"] = true, ["E2R3-T4Y5-U6I7-O8P9"] = true, ["A0S1-D2F3-G4H5-J6K7"] = true,
    ["L8M9-N0B1-V2C3-X4Z5"] = true, ["A6S7-D8F9-G0H1-J2K3"] = true, ["L4M5-N6B7-V8C9-X0Z1"] = true, ["P2O3-I4U5-Y6T7-R8E9"] = true,
    ["W0Q1-M2N3-B4V5-C6X7"] = true, ["Z8A9-S0D1-F2G3-H4J5"] = true, ["K6L7-Q8W9-E0R1-T2Y3"] = true, ["U4I5-O6P7-A8S9-D0F1"] = true
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "2WINSS_SECURE"
ScreenGui.Parent = CoreGui

-- ДИСКОРД ССЫЛКА (По центру)
local DiscordLabel = Instance.new("TextLabel")
DiscordLabel.Size = UDim2.new(0, 250, 0, 30)
DiscordLabel.Position = UDim2.new(0.5, -125, 0.35, 0)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "discord.gg/EPr4H8HQFR"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.Font = Enum.Font.GothamBold
DiscordLabel.TextSize = 14
DiscordLabel.Parent = ScreenGui
Instance.new("UIStroke", DiscordLabel).Thickness = 1

-- ОКНО ВХОДА
local Login = Instance.new("Frame")
Login.Size = UDim2.new(0, 300, 0, 180)
Login.Position = UDim2.new(0.5, -150, 0.45, 0)
Login.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Login.BackgroundTransparency = 0.1
Login.Parent = ScreenGui

local LoginCorner = Instance.new("UICorner", Login)
local LoginStroke = Instance.new("UIStroke", Login)
LoginStroke.Thickness = 2
LoginStroke.Color = Color3.fromRGB(100, 100, 100)

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.85, 0, 0, 40)
KeyBox.Position = UDim2.new(0.075, 0, 0.25, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyBox.PlaceholderText = "Enter Your 16-Char Key"
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.Gotham
KeyBox.Parent = Login
Instance.new("UICorner", KeyBox)

local EnterBtn = Instance.new("TextButton")
EnterBtn.Size = UDim2.new(0.85, 0, 0, 45)
EnterBtn.Position = UDim2.new(0.075, 0, 0.6, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
EnterBtn.Text = "ACTIVATE"
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterBtn.Font = Enum.Font.GothamBold
EnterBtn.Parent = Login
Instance.new("UICorner", EnterBtn)

-- ГЛАВНОЕ МЕНЮ (Изначально спрятано)
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 240, 0, 400)
Main.Position = UDim2.new(0.5, -120, 1.5, 0) -- Внизу экрана
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BackgroundTransparency = 0.2
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 2
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
local StrokeGrad = Instance.new("UIGradient", MainStroke)

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.BackgroundTransparency = 0.1
Header.Parent = Main

Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 10)
local HeaderGrad = Instance.new("UIGradient", Header)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "2WINSS @filz1yesss-F"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 12
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -32, 0.5, -15)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseBtn.TextSize = 25
CloseBtn.Parent = Header
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -16, 1, -50)
Container.Position = UDim2.new(0, 8, 0, 45)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.ScrollBarThickness = 0
Container.Parent = Main
Instance.new("UIListLayout", Container).Padding = UDim.new(0, 6)

-- ФУНКЦИИ КНОПОК
local function CreateButton(text, sub)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1, -4, 0, 42)
    B.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    B.BackgroundTransparency = 0.6
    B.Text = text
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.Font = Enum.Font.GothamBold
    B.TextSize = 11
    B.Parent = Container
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 8)
    local s = Instance.new("UIStroke", B)
    s.Thickness = 1
    s.Color = Color3.fromRGB(120, 120, 120)
    if sub then
        local st = Instance.new("TextLabel")
        st.Size = UDim2.new(1, 0, 0, 10)
        st.Position = UDim2.new(0, 0, 1, -12)
        st.BackgroundTransparency = 1
        st.Text = sub
        st.TextColor3 = Color3.fromRGB(180, 180, 180)
        st.TextSize = 8
        st.Parent = B
    end
    return B
end

local binds = {ToggleUI = Enum.KeyCode.U, WallAction = Enum.KeyCode.L}
local listening = nil

CreateButton("UI TOGGLE: [U]", "BIND CONFIG BELOW").Interactable = false
local WallBtn = CreateButton("DESTROY WALLS", "R-Click to bind: L")
local DevBtn = CreateButton("FPS DEVOURER (V12)", "Need 3 auras")
local StatsBtn = CreateButton("FPS: 0 | PING: 0", "Network Status")

local function ApplyTheme(theme)
    if theme == "Silver" then
        MainStroke.Color = Color3.fromRGB(200,200,200)
        HeaderGrad.Color = ColorSequence.new(Color3.fromRGB(140,140,140), Color3.fromRGB(255,255,255))
    elseif theme == "Red" then
        MainStroke.Color = Color3.fromRGB(255,0,0)
        HeaderGrad.Color = ColorSequence.new(Color3.fromRGB(150,0,0), Color3.fromRGB(255,50,50))
    elseif theme == "Black" then
        MainStroke.Color = Color3.fromRGB(60,60,60)
        HeaderGrad.Color = ColorSequence.new(Color3.fromRGB(0,0,0), Color3.fromRGB(80,80,80))
    end
    StrokeGrad.Color = HeaderGrad.Color
end

local wallData = {}
local wallsRemoved = false
local function ToggleWalls()
    wallsRemoved = not wallsRemoved
    if wallsRemoved then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide and not v:IsDescendantOf(LocalPlayer.Character) then
                wallData[v] = v.Parent
                v.Parent = nil
            end
        end
        WallBtn.Text = "RESTORE WALLS"
    else
        for part, parent in pairs(wallData) do
            if part then part.Parent = parent end
        end
        wallData = {}
        WallBtn.Text = "DESTROY WALLS"
    end
end

WallBtn.MouseButton1Click:Connect(ToggleWalls)
WallBtn.MouseButton2Click:Connect(function() listening = "WallAction"; WallBtn.Text = "..." end)

RunService.RenderStepped:Connect(function(dt)
    StatsBtn.Text = "FPS: "..math.floor(1/dt).." | PING: "..math.floor(LocalPlayer:GetNetworkPing()*1000).."ms"
    HeaderGrad.Rotation = (HeaderGrad.Rotation + 2) % 360
    StrokeGrad.Rotation = (StrokeGrad.Rotation + 2) % 360
end)

-- ЛОГИКА ВХОДА И ПРИВЯЗКИ
EnterBtn.MouseButton1Click:Connect(function()
    local input = KeyBox.Text
    if KEYS[input] then
        -- Успех
        TweenService:Create(Login, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, -1, 0)}):Play()
        task.wait(0.5)
        Login.Visible = false
        -- Открытие главного меню
        Main.Position = UDim2.new(0.5, -120, 0.45, 0)
        ApplyTheme("Silver")
    else
        -- Ошибка
        local ErrorMsg = Instance.new("TextLabel", ScreenGui)
        ErrorMsg.Size = UDim2.new(0, 300, 0, 30)
        ErrorMsg.Position = UDim2.new(0.5, -150, 0.7, 0)
        ErrorMsg.BackgroundTransparency = 1
        ErrorMsg.Text = "Invalid Key or Executor not supported!"
        ErrorMsg.TextColor3 = Color3.fromRGB(255, 50, 50)
        ErrorMsg.Font = Enum.Font.GothamBold
        ErrorMsg.TextTransparency = 1
        
        TweenService:Create(ErrorMsg, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
        task.wait(2)
        TweenService:Create(ErrorMsg, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
        task.delay(0.5, function() ErrorMsg:Destroy() end)
    end
end)

-- Dragging & Input
local dragStart, startPos, dragging
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true; dragStart = input.Position; startPos = Main.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

local isVisible = true
UserInputService.InputBegan:Connect(function(input, gpe)
    if listening then
        binds[listening] = input.KeyCode
        listening = nil; WallBtn.Text = "DESTROY WALLS"
        return
    end
    if gpe then return end
    if input.KeyCode == binds.ToggleUI then
        isVisible = not isVisible
        Main.Visible = isVisible
        DiscordLabel.Visible = isVisible
    elseif input.KeyCode == binds.WallAction then
        ToggleWalls()
    end
end)
