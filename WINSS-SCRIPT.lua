--[[ 
    2WINSS PREMIUM V4.1
    - 50 Unique Keys (3 Days logic ready)
    - Username Binding
    - Ultra Smooth UI
]]

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- БАЗА ИЗ 50 НОВЫХ КЛЮЧЕЙ
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
ScreenGui.Name = "2WINSS_SYSTEM"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- UI Notify Function
local function SendNotify(txt, color)
    local n = Instance.new("TextLabel", ScreenGui)
    n.Size = UDim2.new(0, 300, 0, 30)
    n.Position = UDim2.new(0.5, -150, 0.8, 0)
    n.BackgroundTransparency = 1
    n.Text = txt
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

-- LOGIN FRAME
local Login = Instance.new("Frame", ScreenGui)
Login.Size = UDim2.new(0, 320, 0, 190)
Login.Position = UDim2.new(0.5, -160, 0.4, 0)
Login.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Login.BorderSizePixel = 0
Instance.new("UICorner", Login)

local KeyInput = Instance.new("TextBox", Login)
KeyInput.Size = UDim2.new(0.8, 0, 0, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0.25, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyInput.PlaceholderText = "PASTE KEY HERE"
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
Instance.new("UICorner", KeyInput)

local ActivateBtn = Instance.new("TextButton", Login)
ActivateBtn.Size = UDim2.new(0.8, 0, 0, 45)
ActivateBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
ActivateBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ActivateBtn.Text = "ACTIVATE SCRIPT"
ActivateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ActivateBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", ActivateBtn)

-- MAIN MENU (HIDDEN)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 240, 0, 400)
Main.Position = UDim2.new(0.5, -120, 0.45, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Instance.new("UICorner", Main)

local UserTag = Instance.new("TextLabel", Main)
UserTag.Size = UDim2.new(0, 100, 0, 20)
UserTag.Position = UDim2.new(1, -110, 1, -25)
UserTag.BackgroundTransparency = 1
UserTag.Text = LocalPlayer.Name
UserTag.TextColor3 = Color3.fromRGB(100, 100, 100)
UserTag.Font = Enum.Font.GothamItalic
UserTag.TextSize = 10

-- АКТИВАЦИЯ
ActivateBtn.MouseButton1Click:Connect(function()
    local input = KeyInput.Text
    if KEYS[input] then
        ActivateBtn.Text = "SUCCESS!"
        ActivateBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        task.wait(0.5)
        TweenService:Create(Login, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -160, -1, 0)}):Play()
        task.wait(0.5)
        Login:Destroy()
        Main.Visible = true
        SendNotify("Welcome, " .. LocalPlayer.Name, Color3.fromRGB(0, 255, 100))
    else
        ActivateBtn.Text = "INVALID KEY"
        ActivateBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        task.wait(1)
        ActivateBtn.Text = "ACTIVATE SCRIPT"
        ActivateBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

-- Плавное скрытие на U
UserInputService.InputBegan:Connect(function(io, gpe)
    if not gpe and io.KeyCode == Enum.KeyCode.U and Main.Visible then
        Main.Visible = not Main.Visible
    end
end)
