-- 🔥 Lucky Spin X100 - Ưu tiên Dragon by Lê Anh Dũng 🔥

print("✅ Script đã được tải!")

-- GUI setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Label = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "LAD_LuckySpin"

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.35, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 280, 0, 160)

Button.Parent = Frame
Button.Text = "QUAY TRÁI CÂY VIP 🎰"
Button.Size = UDim2.new(1, 0, 0, 50)
Button.Position = UDim2.new(0, 0, 0.65, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16

Label.Parent = Frame
Label.Size = UDim2.new(1, 0, 0, 50)
Label.Position = UDim2.new(0, 0, 0.2, 0)
Label.Text = "🎁 Kết quả: Chưa quay"
Label.Font = Enum.Font.Gotham
Label.TextSize = 18
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1

-- Danh sách trái và tỷ lệ (trọng số)
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

-- Hàm random theo trọng số
local function getWeightedFruit()
    local totalWeight = 0
    for _, item in ipairs(vipFruits) do
        totalWeight += item.weight
    end

    local rand = math.random(1, totalWeight)
    local sum = 0
    for _, item in ipairs(vipFruits) do
        sum += item.weight
        if rand <= sum then
            return item.name
        end
    end
end

-- Khi bấm nút quay
Button.MouseButton1Click:Connect(function()
    Button.Text = "🎲 Đang quay..."
    wait(0.8)

    local fruit = getWeightedFruit()
    Label.Text = "🎁 Kết quả: " .. fruit
    Button.Text = "QUAY TIẾP 🎰"

    game.StarterGui:SetCore("SendNotification", {
        Title = "🎉 KẾT QUẢ",
        Text = "Bạn nhận được: " .. fruit,
        Duration = 5
    })
end)
