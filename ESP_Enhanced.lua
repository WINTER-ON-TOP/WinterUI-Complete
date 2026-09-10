-- ===========================
-- CORE FUNCTIONS - ESP (Enhanced)
-- ===========================

local function UpdateESP()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local character = player.Character
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			local humanoid = character:FindFirstChild("Humanoid")
			
			if not humanoidRootPart or not humanoid then return end
			
			local myRoot = Character:FindFirstChild("HumanoidRootPart")
			if not myRoot then return end
			
			local distance = (humanoidRootPart.Position - myRoot.Position).Magnitude
			
			-- ========== KILLER ESP ==========
			if uiState.Esp.KillerHighlightEnabled or uiState.Esp.KillerDistanceEnabled or uiState.Esp.KillerNameEnabled then
				-- Highlight
				if uiState.Esp.KillerHighlightEnabled then
					local highlight = character:FindFirstChild("WinterUI_ESP_Highlight")
					if not highlight then
						highlight = Instance.new("Highlight")
						highlight.Name = "WinterUI_ESP_Highlight"
						highlight.FillColor = Color3.fromRGB(255, 50, 50) -- Red
						highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
						highlight.FillTransparency = 0.3
						highlight.OutlineTransparency = 0
						highlight.Parent = character
					end
				else
					local highlight = character:FindFirstChild("WinterUI_ESP_Highlight")
					if highlight then highlight:Destroy() end
				end
				
				-- Distance Label
				if uiState.Esp.KillerDistanceEnabled then
					local distanceLabel = character:FindFirstChild("WinterUI_ESP_Distance")
					if not distanceLabel then
						distanceLabel = Instance.new("BillboardGui")
						distanceLabel.Name = "WinterUI_ESP_Distance"
						distanceLabel.Size = UDim2.new(4, 0, 2, 0)
						distanceLabel.MaxDistance = 500
						distanceLabel.Parent = humanoidRootPart
						
						local textLabel = Instance.new("TextLabel")
						textLabel.BackgroundTransparency = 1
						textLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
						textLabel.TextSize = 14
						textLabel.Font = Enum.Font.GothamBold
						textLabel.Parent = distanceLabel
					end
					
					local distLabel = character:FindFirstChild("WinterUI_ESP_Distance")
					if distLabel then
						local textLabel = distLabel:FindFirstChildWhichIsA("TextLabel")
						if textLabel then
							textLabel.Text = "Distance: " .. math.floor(distance) .. " m"
						end
					end
				else
					local distanceLabel = character:FindFirstChild("WinterUI_ESP_Distance")
					if distanceLabel then distanceLabel:Destroy() end
				end
				
				-- Name Label
				if uiState.Esp.KillerNameEnabled then
					local nameLabel = character:FindFirstChild("WinterUI_ESP_Name")
					if not nameLabel then
						nameLabel = Instance.new("BillboardGui")
						nameLabel.Name = "WinterUI_ESP_Name"
						nameLabel.Size = UDim2.new(4, 0, 2, 0)
						nameLabel.MaxDistance = 500
						nameLabel.Parent = humanoidRootPart
						nameLabel.StudsOffset = Vector3.new(0, 3, 0)
						
						local textLabel = Instance.new("TextLabel")
						textLabel.BackgroundTransparency = 1
						textLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
						textLabel.TextSize = 16
						textLabel.Font = Enum.Font.GothamBold
						textLabel.Text = player.Name .. " [Killer]"
						textLabel.Parent = nameLabel
					end
				else
					local nameLabel = character:FindFirstChild("WinterUI_ESP_Name")
					if nameLabel then nameLabel:Destroy() end
				end
			end
			
			-- ========== SURVIVOR ESP ==========
			if uiState.Esp.SurvivorHighlightEnabled or uiState.Esp.SurvivorDistanceEnabled or uiState.Esp.SurvivorNameEnabled then
				-- Highlight
				if uiState.Esp.SurvivorHighlightEnabled then
					local highlight = character:FindFirstChild("WinterUI_ESP_Highlight_Survivor")
					if not highlight then
						highlight = Instance.new("Highlight")
						highlight.Name = "WinterUI_ESP_Highlight_Survivor"
						highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Green
						highlight.OutlineColor = Color3.fromRGB(0, 200, 0)
						highlight.FillTransparency = 0.3
						highlight.OutlineTransparency = 0
						highlight.Parent = character
					end
				else
					local highlight = character:FindFirstChild("WinterUI_ESP_Highlight_Survivor")
					if highlight then highlight:Destroy() end
				end
				
				-- Distance Label
				if uiState.Esp.SurvivorDistanceEnabled then
					local distanceLabel = character:FindFirstChild("WinterUI_ESP_Distance_Survivor")
					if not distanceLabel then
						distanceLabel = Instance.new("BillboardGui")
						distanceLabel.Name = "WinterUI_ESP_Distance_Survivor"
						distanceLabel.Size = UDim2.new(4, 0, 2, 0)
						distanceLabel.MaxDistance = 500
						distanceLabel.Parent = humanoidRootPart
						
						local textLabel = Instance.new("TextLabel")
						textLabel.BackgroundTransparency = 1
						textLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
						textLabel.TextSize = 14
						textLabel.Font = Enum.Font.GothamBold
						textLabel.Parent = distanceLabel
					end
					
					local distLabel = character:FindFirstChild("WinterUI_ESP_Distance_Survivor")
					if distLabel then
						local textLabel = distLabel:FindFirstChildWhichIsA("TextLabel")
						if textLabel then
							textLabel.Text = "Distance: " .. math.floor(distance) .. " m"
						end
					end
				else
					local distanceLabel = character:FindFirstChild("WinterUI_ESP_Distance_Survivor")
					if distanceLabel then distanceLabel:Destroy() end
				end
				
				-- Name Label
				if uiState.Esp.SurvivorNameEnabled then
					local nameLabel = character:FindFirstChild("WinterUI_ESP_Name_Survivor")
					if not nameLabel then
						nameLabel = Instance.new("BillboardGui")
						nameLabel.Name = "WinterUI_ESP_Name_Survivor"
						nameLabel.Size = UDim2.new(4, 0, 2, 0)
						nameLabel.MaxDistance = 500
						nameLabel.Parent = humanoidRootPart
						nameLabel.StudsOffset = Vector3.new(0, 3, 0)
						
						local textLabel = Instance.new("TextLabel")
						textLabel.BackgroundTransparency = 1
						textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
						textLabel.TextSize = 16
						textLabel.Font = Enum.Font.GothamBold
						textLabel.Text = player.Name .. " [Survivor]"
						textLabel.Parent = nameLabel
					end
				else
					local nameLabel = character:FindFirstChild("WinterUI_ESP_Name_Survivor")
					if nameLabel then nameLabel:Destroy() end
				end
			end
		end
	end
end

-- ESP Update Loop
task.spawn(function()
	while task.wait(0.1) do
		if uiState.Esp.KillerHighlightEnabled or uiState.Esp.KillerDistanceEnabled or uiState.Esp.KillerNameEnabled or
		   uiState.Esp.SurvivorHighlightEnabled or uiState.Esp.SurvivorDistanceEnabled or uiState.Esp.SurvivorNameEnabled then
			UpdateESP()
		end
	end
end)
