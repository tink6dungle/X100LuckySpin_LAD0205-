--🔥 LUCKY SPIN X100 PRO MAX – GUI + AUTO + CHECK + HUD
--👑 Dev: Lê Anh Dũng 🔥💀

print("✅ Script đã được tải!")

local player = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:FindFirstChild("GiveFruit") or ReplicatedStorage:WaitForChild("GiveFruit")

-- ✅ Check HWID / UserId (chống leak nhẹ)
local allowedUsers = {12345678, 87654321, player.UserId}
if not table.find(allowedUsers, player.UserId) then
    player:Kick("Không được phép dùng script này.")
    return
end

-- Danh sách trái cây VIP (có trọng số)
local vipFruits = {
    {name = "Dragon 🐉", weight = 50},
    {name = "Leopard 🐆", weight = 25},
    {name = "Dough 🍩",   weight = 15},
    {name = "T-Rex 🦖",   weight = 8},
    {name = "Venom ☠️",   weight = 6},
    {name = "Kitsune 🐺", weight = 3},
    {name = "Spirit 👻",  weight = 2},
    {name = "Blizzard ❄️",weight = 1},
}

-- Random theo tỷ lệ
local function getWeightedFruit()
    local total = 0
    for _, item in ipairs(vipFruits) do total += item.weight end
    local rand = math.random(1, total)
    local sum = 0
    for _, item in ipairs(vipFruits) do
        sum += item.weight
        if rand <= sum then return item.name end
    end
end

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "LAD_LuckySpin_X100_GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 440, 0, 280)
frame.Position = UDim2.new(0.5, -220, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 3

-- Title
local title = Instance.new("TextLabel", frame)
title.Text = "BUFF MAY MẮN X100%"
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextStrokeTransparency = 0.2
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1

-- Buff trạng thái
local buffLabel = Instance.new("TextLabel", frame)
buffLabel.Text = "BUFF: ĐANG HOẠT ĐỘNG"
buffLabel.Font = Enum.Font.GothamBlack
buffLabel.TextSize = 22
buffLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
buffLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
buffLabel.TextStrokeTransparency = 0.1
buffLabel.Size = UDim2.new(1, -40, 0, 40)
buffLabel.Position = UDim2.new(0, 20, 0, 50)
buffLabel.BackgroundColor3 = Color3.fromRGB(0, 180, 0)

-- Kết quả
local resultLabel = Instance.new("TextLabel", frame)
resultLabel.Text = "🎁 Kết quả: Chưa quay"
resultLabel.Font = Enum.Font.Gotham
resultLabel.TextSize = 20
resultLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
resultLabel.Position = UDim2.new(0, 10, 0, 105)
resultLabel.Size = UDim2.new(1, -20, 0, 40)
resultLabel.BackgroundTransparency = 1

-- Spin button
local spinBtn = Instance.new("TextButton", frame)
spinBtn.Text = "🎰 QUAY TRÁI CÂY VIP"
spinBtn.Font = Enum.Font.GothamBold
spinBtn.TextSize = 20
spinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
spinBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
spinBtn.Position = UDim2.new(0.5, -150, 0, 160)
spinBtn.Size = UDim2.new(0, 300, 0, 50)

-- Auto Loop toggle
local autoLoop = false
local autoBtn = Instance.new("TextButton", frame)
autoBtn.Text = "⏳ AUTO: OFF"
autoBtn.Font = Enum.Font.GothamBold
autoBtn.TextSize = 18
autoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
autoBtn.Position = UDim2.new(0.5, -150, 0, 220)
autoBtn.Size = UDim2.new(0, 300, 0, 40)

autoBtn.MouseButton1Click:Connect(function()
    autoLoop = not autoLoop
    autoBtn.Text = autoLoop and "⏳ AUTO: ON" or "⏳ AUTO: OFF"
end)

-- SPIN logic
local function spinFruit()
    spinBtn.Text = "🎲 Đang quay..."
    wait(0.5)
    local fruit = getWeightedFruit()
    resultLabel.Text = "🎁 Kết quả: " .. fruit
    spinBtn.Text = "🎰 QUAY TIẾP"
    game.StarterGui:SetCore("SendNotification", {
        Title = "🎉 KẾT QUẢ",
        Text = "Bạn nhận: " .. fruit,
        Duration = 5
    })
    if remote then
        local pureName = fruit:split(" ")[1]
        remote:FireServer(pureName)
    end
end

spinBtn.MouseButton1Click:Connect(spinFruit)

-- Auto loop
task.spawn(function()
    while true do
        if autoLoop then
            spinFruit()
        end
        wait(5)
    end
end)

-- Watermark
local foot = Instance.new("TextLabel", frame)
foot.Text = "Lê Anh Dũng 🔥💀 | Ultimate LuckySystem"
foot.Font = Enum.Font.Code
foot.TextSize = 15
foot.TextColor3 = Color3.fromRGB(180, 180, 180)
foot.Size = UDim2.new(1, 0, 0, 18)
foot.Position = UDim2.new(0, 0, 1, -18)
foot.BackgroundTransparency = 1
