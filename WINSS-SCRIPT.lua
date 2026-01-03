-- Ждем загрузки игры
if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- База ключей (16 символов)
local KEYS = {
    ["4H7B-K9L2-M1X8-P0Q5"] = true,
    ["Z9X1-V2N8-M4L3-K5J7"] = true,
    ["Q7W1-E4R8-T2Y5-U0I9"] = true,
    ["A3S8-D1F5-G9H2-J4K6"] = true
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "2WINSS_PREMIUM_V4"
ScreenGui.Parent = CoreGui
ScreenGui.DisplayOrder = 100 -- Чтобы было поверх всего

-- Discord (Центр, чуть выше середины)
local DiscordLabel = Instance.new("TextLabel")
DiscordLabel.Size = UDim2.new(0, 250, 0, 30)
DiscordLabel.Position = UDim2.new(0.5, -125, 0.35, 0)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "discord.gg/EPr4H8HQFR"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.Font = Enum.Font.GothamBold
DiscordLabel.TextSize = 14
DiscordLabel.Parent = ScreenGui
DiscordLabel.TextTransparency = 1
Instance.new("UIStroke", DiscordLabel).Thickness = 1

-- LOGIN FRAME
local Login = Instance.new("Frame")
Login.Size = UDim2.new(0, 300, 0, 180)
Login.Position = UDim2.new(0.5, -150, 0.45, 0)
Login.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Login.BorderSizePixel = 0
Login.ClipsDescendants = true
Login.Parent = ScreenGui
Login.BackgroundTransparency = 1 -- Для анимации появления

local LoginCorner = Instance.new("UICorner", Login)
local LoginStroke = Instance.new("UIStroke", Login)
LoginStroke.Thickness = 2
LoginStroke.Color = Color3.fromRGB(80, 80, 80)
LoginStroke.Transparency = 1

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.85, 0, 0, 40)
KeyBox.Position = UDim2.new(0.075, 0, 0.25, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyBox.PlaceholderText = "Enter License Key..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.Gotham
KeyBox.Parent = Login
KeyBox.TextTransparency = 1
Instance.new("UICorner", KeyBox)

local EnterBtn = Instance.new("TextButton")
EnterBtn.Size = UDim2.new(0.85, 0, 0, 45)
EnterBtn.Position = UDim2.new(0.075, 0, 0.6, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
EnterBtn.Text = "ACTIVATE"
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterBtn.Font = Enum.Font.GothamBold
EnterBtn.Parent = Login
EnterBtn.TextTransparency = 1
Instance.new("UICorner", EnterBtn)

-- АНИМАЦИЯ ПОЯВЛЕНИЯ ЛОГИНА
TweenService:Create(Login, TweenInfo.new(0.8), {BackgroundTransparency = 0.1}):Play()
TweenService:Create(LoginStroke, TweenInfo.new(0.8), {Transparency = 0}):Play()
TweenService:Create(KeyBox, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
TweenService:Create(EnterBtn, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
TweenService:Create(DiscordLabel, TweenInfo.new(1), {TextTransparency = 0}):Play()

-- ГЛАВНОЕ МЕНЮ
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 240, 0, 420)
Main.Position = UDim2.new(0.5, -120, 0.45, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BackgroundTransparency = 0.2
Main.Visible = false
Main.ClipsDescendants = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 2
local StrokeGrad = Instance.new("UIGradient", MainStroke)

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.BackgroundTransparency = 0.1
Header.Parent = Main
local HeaderGrad = Instance.new("UIGradient", Header)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "2WINSS HUB"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 13
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local UserTag = Instance.new("TextLabel")
UserTag.Size = UDim2.new(0, 150, 0, 20)
UserTag.Position = UDim2.new(1, -155, 1, -25)
UserTag.BackgroundTransparency = 1
UserTag.Text = "User: " .. LocalPlayer.Name
UserTag.TextColor3 = Color3.fromRGB(180, 180, 180)
UserTag.Font = Enum.Font.GothamItalic
UserTag.TextSize = 10
UserTag.TextXAlignment = Enum.TextXAlignment.Right
UserTag.Parent = Main

local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -16, 1, -80)
Container.Position = UDim2.new(0, 8, 0, 45)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 0
Container.Parent = Main
Instance.new("UIListLayout", Container).Padding = UDim.new(0, 6)

-- Функции
local function CreateButton(text)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1, -4, 0, 40)
    B.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    B.BackgroundTransparency = 0.6
    B.Text = text
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.Font = Enum.Font.GothamBold
    B.Parent = Container
    Instance.new("UICorner", B)
    return B
end

local WallBtn = CreateButton("DESTROY WALLS")
local StatsBtn = CreateButton("LOADING...")

-- ТЕМЫ
local ThemeFrame = Instance.new("Frame")
ThemeFrame.Size = UDim2.new(1, 0, 0, 30)
ThemeFrame.BackgroundTransparency = 1
ThemeFrame.Parent = Container

local function ApplyTheme(c1, c2, bg)
    TweenService:Create(Main, TweenInfo.new(0.5), {BackgroundColor3 = bg}):Play()
    TweenService:Create(MainStroke, TweenInfo.new(0.5), {Color = c1}):Play()
    HeaderGrad.Color = ColorSequence.new(c1, c2)
    StrokeGrad.Color = HeaderGrad.Color
end

local function MakeThemeBtn(col, pos, name)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.3, 0, 1, 0)
    b.Position = pos
    b.BackgroundColor3 = col
    b.Text = ""
    b.Parent = ThemeFrame
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        if name == "Red" then ApplyTheme(Color3.fromRGB(255,0,0), Color3.fromRGB(150,0,0), Color3.fromRGB(25,5,5))
        elseif name == "Silver" then ApplyTheme(Color3.fromRGB(200,200,200), Color3.fromRGB(120,120,120), Color3.fromRGB(20,20,20))
        elseif name == "Black" then ApplyTheme(Color3.fromRGB(80,80,80), Color3.fromRGB(0,0,0), Color3.fromRGB(10,10,10)) end
    end)
end

MakeThemeBtn(Color3.fromRGB(200,0,0), UDim2.new(0,0,0,0), "Red")
MakeThemeBtn(Color3.fromRGB(200,200,200), UDim2.new(0.35,0,0,0), "Silver")
MakeThemeBtn(Color3.fromRGB(60,60,60), UDim2.new(0.7,0,0,0), "Black")

-- Логика стен
local wallData = {}
local wallsRemoved = false
WallBtn.MouseButton1Click:Connect(function()
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
end)

-- Плавное скрытие/показ через U
local isVisible = true
local function ToggleUI()
    isVisible = not isVisible
    local targetSize = isVisible and UDim2.new(0, 240, 0, 420) or UDim2.new(0, 240, 0, 0)
    local targetAlpha = isVisible and 0.2 or 1
    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize, BackgroundTransparency = targetAlpha}):Play()
    DiscordLabel.Visible = isVisible
end

-- Активация ключа
EnterBtn.MouseButton1Click:Connect(function()
    if KEYS[KeyBox.Text] then
        -- Плавное исчезновение логина
        TweenService:Create(Login, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, -0.5, 0), BackgroundTransparency = 1}):Play()
        task.wait(0.5)
        Login:Destroy()
        Main.Visible = true
        ApplyTheme(Color3.fromRGB(200,200,200), Color3.fromRGB(120,120,120), Color3.fromRGB(20,20,20))
    else
        EnterBtn.Text = "INVALID KEY!"
        TweenService:Create(EnterBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(150, 0, 0)}):Play()
        task.wait(1.5)
        EnterBtn.Text = "ACTIVATE"
        TweenService:Create(EnterBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
    end
end)

-- Рендер
RunService.RenderStepped:Connect(function(dt)
    if Main.Visible then
        StatsBtn.Text = "FPS: "..math.floor(1/dt).." | PING: "..math.floor(LocalPlayer:GetNetworkPing()*1000).."ms"
        HeaderGrad.Rotation = (HeaderGrad.Rotation + 2) % 360
        StrokeGrad.Rotation = (StrokeGrad.Rotation + 2) % 360
    end
end)

UserInputService.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.U and Main.Visible then ToggleUI() end
end)
