repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- База ключей (я оставил несколько для теста, добавь остальные сам)
local KEYS = {
    ["4H7B-K9L2-M1X8-P0Q5"] = true,
    ["Z9X1-V2N8-M4L3-K5J7"] = true,
    ["Q7W1-E4R8-T2Y5-U0I9"] = true,
    ["A3S8-D1F5-G9H2-J4K6"] = true
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "2WINSS_SECURE_SYSTEM"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Сообщение Discord (будет видно всегда)
local DiscordLabel = Instance.new("TextLabel")
DiscordLabel.Size = UDim2.new(0, 250, 0, 30)
DiscordLabel.Position = UDim2.new(0.5, -125, 0.3, 0)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "discord.gg/EPr4H8HQFR"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.Font = Enum.Font.GothamBold
DiscordLabel.TextSize = 14
DiscordLabel.Parent = ScreenGui
Instance.new("UIStroke", DiscordLabel).Thickness = 1

-- Окно ввода ключа
local Login = Instance.new("Frame")
Login.Size = UDim2.new(0, 300, 0, 180)
Login.Position = UDim2.new(0.5, -150, 0.45, 0)
Login.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Login.BorderSizePixel = 0
Login.Parent = ScreenGui

Instance.new("UICorner", Login)
local LoginStroke = Instance.new("UIStroke", Login)
LoginStroke.Thickness = 2
LoginStroke.Color = Color3.fromRGB(100, 100, 100)

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.85, 0, 0, 40)
KeyBox.Position = UDim2.new(0.075, 0, 0.25, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyBox.PlaceholderText = "Enter 16-Char Key..."
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

-- ГЛАВНОЕ МЕНЮ (Скрыто)
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 240, 0, 400)
Main.Position = UDim2.new(0.5, -120, 0.45, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BackgroundTransparency = 0.2
Main.Visible = false
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
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "2WINSS @filz1yesss-F"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 12
Title.Parent = Header

local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -16, 1, -50)
Container.Position = UDim2.new(0, 8, 0, 45)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 0
Container.Parent = Main
Instance.new("UIListLayout", Container).Padding = UDim.new(0, 6)

-- Функции анимации и кнопок
local function Notify(text)
    local msg = Instance.new("TextLabel", ScreenGui)
    msg.Size = UDim2.new(0, 300, 0, 30)
    msg.Position = UDim2.new(0.5, -150, 0.75, 0)
    msg.BackgroundTransparency = 1
    msg.Text = text
    msg.TextColor3 = Color3.fromRGB(255, 50, 50)
    msg.Font = Enum.Font.GothamBold
    msg.TextSize = 14
    msg.TextTransparency = 1
    TweenService:Create(msg, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(2)
    TweenService:Create(msg, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    task.delay(0.5, function() msg:Destroy() end)
end

EnterBtn.MouseButton1Click:Connect(function()
    if KEYS[KeyBox.Text] then
        TweenService:Create(Login, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, -1, 0)}):Play()
        task.wait(0.5)
        Login:Destroy()
        Main.Visible = true
        Notify("SUCCESS: Script Injected!")
    else
        Notify("ERROR: Invalid Key!")
    end
end)

-- Анимация перелива
RunService.RenderStepped:Connect(function()
    HeaderGrad.Rotation = (HeaderGrad.Rotation + 2) % 360
    StrokeGrad.Rotation = (StrokeGrad.Rotation + 2) % 360
end)
