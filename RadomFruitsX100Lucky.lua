--🔥 Script Dev: Lê Anh Dũng (LAD0205) 🔥💀 – X100% Lucky Spin v1.0

local devList = {123456789}  -- ← Thay bằng UserId thực của bạn
local player = game:GetService("Players").LocalPlayer
if not table.find(devList, player.UserId) then
    warn("⚠️ Không có quyền sử dụng Lucky Spin!")
    return
end

local rareFruits = {
    "Dragon", "Leopard", "Dough", "Spirit", "Phoenix", "Kitsune", "T-Rex"
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:FindFirstChild("GiveFruit")
               or ReplicatedStorage:WaitForChild("GiveFruit", 5)

if not remote then
    warn("❌ Không tìm thấy RemoteEvent: GiveFruit")
    return
end

-- Tạo GUI test
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "X100LuckyGUI"

local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 220, 0, 50)
btn.Position = UDim2.new(0.5, -110, 0.25, 0)
btn.Text = "🎯 Lucky Spin (LAD0205 🔥💀)"
btn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.SourceSansBold
btn.TextSize = 18

btn.MouseButton1Click:Connect(function()
    local fruit = rareFruits[math.random(1, #rareFruits)]
    print("🔥 Gán trái cho Dev: " .. fruit)
    remote:FireServer(fruit)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "🔥 Lucky Spin – LAD0205 💀",
        Text = "Bạn đã nhận: " .. fruit,
        Duration = 4,
    })
end)
