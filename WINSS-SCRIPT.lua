repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- БАЗА КЛЮЧЕЙ (50 ШТУК)
local KEYS = {
    ["2W-X9A2-L5P8-Q1M7"] = true, ["2W-B4V9-C0X1-Z2A3"] = true, ["2W-N6M7-B8V9-C0X1"] = true, ["2W-S4D5-F6G7-H8J9"] = true,
    ["2W-K0L1-W2Q3-E4R5"] = true, ["2W-T6Y7-U8I9-O0P1"] = true, ["2W-A2S3-D4F5-G6H7"] = true, ["2W-J8K9-L0M1-N2B3"] = true,
    ["2W-V4C5-X6Z7-A8S9"] = true, ["2W-D0F1-G2H3-J4K5"] = true, ["2W-L6M7-N8B9-V0C1"] = true, ["2W-X2Z3-Q4W5-E6R7"] = true,
    ["2W-T8Y9-U0I1-O2P3"] = true, ["2W-A4S5-D6F7-G8H9"] = true, ["2W-J0K1-L2M3-N4B5"] = true, ["2W-V6C7-X8Z9-Q0W1"] = true,
    ["2W-E2R3-T4Y5-U6I7"] = true, ["2W-O8P9-A0S1-D2F3"] = true, ["2W-G4H5-J6K7-L8M9"] = true, ["2W-N0B1-V2C3-X4Z5"] = true,
    ["2W-A6S7-D8F9-G0H1"] = true, ["2W-J2K3-L4M5-N6B7"] = true, ["2W-V8C9-X0Z1-P2O3"] = true, ["2W-I4U5-Y6T7-R8E9"] = true,
    ["2W-W0Q1-M2N3-B4V5"] = true, ["2W-C6X7-Z8A9-S0D1"] = true, ["2W-F2G3-H4J5-K6L7"] = true, ["2W-Q8W9-E0R1-T2Y3"] = true,
    ["2W-U4I5-O6P7-A8S9"] = true, ["2W-D0F1-G2H3-J4K5"] = true, ["2W-L6M7-N8B9-V0C1"] = true, ["2W-X2Z3-A4S5-D6F7"] = true,
    ["2W-G8H9-J0K1-L2M3"] = true, ["2W-N4B5-V6C7-X8Z9"] = true, ["2W-Q0W1-E2R3-T4Y5"] = true, ["2W-U6I7-O8P9-A0S1"] = true,
    ["2W-D2F3-G4H5-J6K7"] = true, ["2W-L8M9-N0B1-V2C3"] = true, ["2W-X4Z5-A6S7-D8F9"] = true, ["2W-G0H1-J2K3-L4M5"] = true,
    ["2W-N6B7-V8C9-X0Z1"] = true, ["2W-P2O3-I4U5-Y6T7"] = true, ["2W-R8E9-W0Q1-M2N3"] = true, ["2W-B4V5-C6X7-Z8A9"] = true,
    ["2W-S0D1-F2G3-H4J5"] = true, ["2W-K6L7-Q8W9-E0R1"] = true, ["2W-T2Y3-U4I5-O6P7"] = true, ["2W-A8S9-D0F1-G2H3"] = true,
    ["2W-J4K5-L6M7-N8B9"] = true, ["2W-V0C1-X2Z3-A4S5"] = true
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "2WINSS_V4_FINAL"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- Уведомления
local function Notify(text, color)
    local n = Instance.new("TextLabel", ScreenGui)
    n.Size = UDim2.new(0, 300, 0, 30)
    n.Position = UDim2.new(0.5, -150, 0.8, 0)
    n.BackgroundTransparency = 1
    n.Text = text
    n.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    n.Font = Enum.Font.GothamBold
    n.TextSize = 14
    n.TextTransparency = 1
    TweenService:Create(n, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.delay(2, function()
        TweenService:Create(n, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        task.wait(0.5) n:Destroy()
    end)
end

-- ОКНО ЛОГИНА
local Login = Instance.new("Frame", ScreenGui)
Login.Size = UDim2.new(0, 320, 0, 190)
Login.Position = UDim2.new(0.5, -160, 0.4, 0)
Login.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Login.BorderSizePixel = 0
Instance.new("UICorner", Login)
local LoginStroke = Instance.new("UIStroke", Login)
LoginStroke.Color = Color3.fromRGB(100,100,100)
LoginStroke.Thickness = 2

local CloseLogin = Instance.new("TextButton", Login)
CloseLogin.Size = UDim2.new(0, 30, 0, 30)
CloseLogin.Position = UDim2.new(1, -35, 0, 5)
CloseLogin.BackgroundTransparency = 1
CloseLogin.Text = "×"
CloseLogin.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseLogin.TextSize = 25
CloseLogin.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local KeyBox = Instance.new("TextBox", Login)
KeyBox.Size = UDim2.new(0.8, 0, 0, 45)
KeyBox.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyBox.PlaceholderText = "ENTER KEY..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.Gotham
Instance.new("UICorner", KeyBox)

local ActivateBtn = Instance.new("TextButton", Login)
ActivateBtn.Size = UDim2.new(0.8, 0, 0, 45)
ActivateBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
ActivateBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ActivateBtn.Text = "ACTIVATE"
ActivateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ActivateBtn.Font = Enum.Font.GothamBold
ActivateBtn.ZIndex = 5
Instance.new("UICorner", ActivateBtn)

-- ГЛАВНОЕ МЕНЮ (СКРЫТО)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 240, 0, 400)
Main.Position = UDim2.new(0.5, -120, 0.45, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Instance.new("UICorner", Main)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 2
local StrokeGrad = Instance.new("UIGradient", MainStroke)

local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.BackgroundTransparency = 0.1
Instance.new("UICorner", Header)
local HeaderGrad = Instance.new("UIGradient", Header)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "2WINSS @filz1yesss-F"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 12
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

local UserTag = Instance.new("TextLabel", Main)
UserTag.Size = UDim2.new(0, 150, 0, 20)
UserTag.Position = UDim2.new(1, -155, 1, -25)
UserTag.BackgroundTransparency = 1
UserTag.Text = "User: " .. LocalPlayer.Name
UserTag.TextColor3 = Color3.fromRGB(150, 150, 150)
UserTag.Font = Enum.Font.GothamItalic
UserTag.TextSize = 10
UserTag.TextXAlignment = Enum.TextXAlignment.Right

local Container = Instance.new("ScrollingFrame", Main)
Container.Size = UDim2.new(1, -16, 1, -80)
Container.Position = UDim2.new(0, 8, 0, 45)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 0
Instance.new("UIListLayout", Container).Padding = UDim.new(0, 6)

-- ФУНКЦИИ
local function CreateButton(text, sub)
    local B = Instance.new("TextButton", Container)
    B.Size = UDim2.new(1, -4, 0, 42)
    B.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    B.BackgroundTransparency = 0.6
    B.Text = text
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.Font = Enum.Font.GothamBold
    Instance.new("UICorner", B)
    if sub then
        local st = Instance.new("TextLabel", B)
        st.Size = UDim2.new(1, 0, 0, 10)
        st.Position = UDim2.new(0, 0, 1, -12)
        st.BackgroundTransparency = 1
        st.Text = sub
        st.TextColor3 = Color3.fromRGB(180, 180, 180)
        st.Font = Enum.Font.Gotham
        st.TextSize = 8
    end
    return B
end

local WallBtn = CreateButton("DESTROY WALLS", "Press L to Toggle")
local DevBtn = CreateButton("FPS DEVOURER (V12)", "Lags the server")
local StatsBtn = CreateButton("FPS: 0 | PING: 0", "Network Info")

-- ТЕМЫ
local ThemeCont = Instance.new("Frame", Container)
ThemeCont.Size = UDim2.new(1, 0, 0, 30)
ThemeCont.BackgroundTransparency = 1

local function ApplyTheme(c1, c2, bg)
    Main.BackgroundColor3 = bg
    MainStroke.Color = c1
    HeaderGrad.Color = ColorSequence.new(c1, c2)
    StrokeGrad.Color = HeaderGrad.Color
end

local function MakeTheme(col, pos, name)
    local b = Instance.new("TextButton", ThemeCont)
    b.Size = UDim2.new(0.3, 0, 1, 0)
    b.Position = pos
    b.BackgroundColor3 = col
    b.Text = ""
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        if name == "Red" then ApplyTheme(Color3.fromRGB(255,0,0), Color3.fromRGB(150,0,0), Color3.fromRGB(25,5,5))
        elseif name == "Silver" then ApplyTheme(Color3.fromRGB(200,200,200), Color3.fromRGB(120,120,120), Color3.fromRGB(20,20,20))
        elseif name == "Black" then ApplyTheme(Color3.fromRGB(60,60,60), Color3.fromRGB(0,0,0), Color3.fromRGB(5,5,5)) end
    end)
end
MakeTheme(Color3.fromRGB(200,0,0), UDim2.new(0,0,0,0), "Red")
MakeTheme(Color3.fromRGB(200,200,200), UDim2.new(0.35,0,0,0), "Silver")
MakeTheme(Color3.fromRGB(50,50,50), UDim2.new(0.7,0,0,0), "Black")

-- ЛОГИКА ФУНКЦИЙ
local wallsRemoved = false
local wallData = {}
local function ToggleWalls()
    wallsRemoved = not wallsRemoved
    if wallsRemoved then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide and not v:IsDescendantOf(LocalPlayer.Character) then
                wallData[v] = v.Parent; v.Parent = nil
            end
        end
        WallBtn.Text = "RESTORE WALLS"
    else
        for p, pr in pairs(wallData) do if p then p.Parent = pr end end
        wallData = {}; WallBtn.Text = "DESTROY WALLS"
    end
end
WallBtn.MouseButton1Click:Connect(ToggleWalls)

local devouring = false
DevBtn.MouseButton1Click:Connect(function()
    devouring = not devouring
    DevBtn.TextColor3 = devouring and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 255, 255)
    task.spawn(function()
        while devouring do
            for i = 1, 50 do
                local r = ReplicatedStorage:FindFirstChild("RemoteEvent", true)
                if r then r:FireServer(Vector3.new(0/0, 1/0, 0/0)) end
            end
            task.wait()
        end
    end)
end)

-- ПРОВЕРКА КЛЮЧА (АВТО-ЗАПУСК ГУИ)
ActivateBtn.MouseButton1Click:Connect(function()
    if KEYS[KeyBox.Text] then
        TweenService:Create(Login, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -160, -1, 0)}):Play()
        task.wait(0.5)
        Login:Destroy()
        Main.Visible = true
        ApplyTheme(Color3.fromRGB(200,200,200), Color3.fromRGB(120,120,120), Color3.fromRGB(20,20,20))
        Notify("Welcome back, " .. LocalPlayer.Name, Color3.fromRGB(0, 255, 150))
    else
        Notify("Invalid Key or Executor not supported!", Color3.fromRGB(255, 50, 50))
    end
end)

RunService.RenderStepped:Connect(function(dt)
    StatsBtn.Text = "FPS: "..math.floor(1/dt).." | PING: "..math.floor(LocalPlayer:GetNetworkPing()*1000).."ms"
    HeaderGrad.Rotation = (HeaderGrad.Rotation + 2) % 360
    StrokeGrad.Rotation = (StrokeGrad.Rotation + 2) % 360
end)

UserInputService.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.U and Main.Visible then
        Main.Visible = not Main.Visible
    elseif not g and i.KeyCode == Enum.KeyCode.L and Main.Visible then
        ToggleWalls()
    end
end)
