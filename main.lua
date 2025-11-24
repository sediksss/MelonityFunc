-- Loader Script, DO NOT RUN THIS IN YOUR EXECUTOR

local module = {}

module.onClick = function()
	if getgenv().purchaseBasicEgg then
		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ItemPackageEvent"):InvokeServer("Purchase", {
				Type = "Basic",
				Category = "Eggs",
				Amount = 1
			})
	end
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConstructHiveCellFromEgg"):InvokeServer(getgenv().slotX, getgenv().slotY, "CrimsonBeeJelly", 1, false)
	task.wait(0.3)
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConstructHiveCellFromEgg"):InvokeServer(getgenv().slotX, getgenv().slotY, "Basic", 1, false)
end

module.init = function()
	local existing = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("BasicRoller")
	if existing then
		existing:Destroy()
	end

	local gui = Instance.new("ScreenGui")
	gui.Name = "BasicRoller"
	gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local button = Instance.new("TextButton")
	button.Name = "RollButton"
	button.Size = UDim2.new(0.1, 0, 0.1, 0)
	button.Position = UDim2.new(0.5, 0, 0.5, 0)
	button.Text = "Roll Basic"
	button.BackgroundColor3 = Color3.fromRGB(60, 150, 255)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Parent = gui
	button.Draggable = true

	button.MouseButton1Click:Connect(module.onClick())
end

return module
