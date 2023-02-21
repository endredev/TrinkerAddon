--[[ Create a new frame for trinkets ]]--
local trinketFrame = CreateFrame("Frame", "TrinketGrid", UIParent)
trinketFrame:SetWidth(80)
trinketFrame:SetHeight(80)
trinketFrame:SetMovable(true)
trinketFrame:EnableMouse(true)
trinketFrame:RegisterForDrag("LeftButton")
trinketFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

--[[ Populate trinkets to the grid ]]--
local function PopulateTrinketGrid()
    local trinket1 = GetInventoryItemID("player", 13)
    local trinket2 = GetInventoryItemID("player", 14)

    if (trinket1) then
        local texture = GetInventoryItemTexture("player", 13)
        local trinket1Icon = trinketFrame:CreateTexture(nil, "ARTWORK")
        trinket1Icon:SetTexture(texture)
        trinket1Icon:SetPoint("TOPRIGHT", trinketFrame, "TOPRIGHT", 0, 0)
        trinket1Icon:SetWidth(40)
        trinket1Icon:SetHeight(40)
    end

    if (trinket2) then
        local texture = GetInventoryItemTexture("player", 14)
        local trinket2Icon = trinketFrame:CreateTexture(nil, "ARTWORK")
        trinket2Icon:SetTexture(texture)
        trinket2Icon:SetPoint("TOPLEFT", trinketFrame, "TOPLEFT", 0, 0)
        trinket2Icon:SetWidth(40)
        trinket2Icon:SetHeight(40)
    end
end

--[[ On trinket change ]]--
trinketFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
trinketFrame:SetScript("OnEvent", function(self, event, ...)
    PopulateTrinketGrid()
end)

--[[ On login ]]--
trinketFrame:RegisterEvent("PLAYER_LOGIN")
trinketFrame:SetScript("OnEvent", function(self, event, ...)
    PopulateTrinketGrid()
end)

--[[ Mouse interactions ]]--
trinketFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not self.isMoving then
        self:StartMoving();
        self.isMoving = true;
    end
end)
trinketFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and self.isMoving then
        self:StopMovingOrSizing();
        self.isMoving = false;
    end
end)
trinketFrame:SetScript("OnHide", function(self)
    if (self.isMoving) then
        self:StopMovingOrSizing();
        self.isMoving = false;
    end
end)

--[[ Button ]]--
local button = CreateFrame("Button", nil, trinketFrame)
	button:SetPoint("BOTTOM", trinketFrame, "BOTTOM", 0, 0)
	button:SetWidth(80)
	button:SetHeight(40)
	
	button:SetText("Dömebuzi")
	button:SetNormalFontObject("GameFontNormal")
	
	local ntex = button:CreateTexture()
	ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
	ntex:SetTexCoord(0, 0.625, 0, 0.6875)
	ntex:SetAllPoints()	
	button:SetNormalTexture(ntex)
	
	local htex = button:CreateTexture()
	htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
	htex:SetTexCoord(0, 0.625, 0, 0.6875)
	htex:SetAllPoints()
	button:SetHighlightTexture(htex)
	
	local ptex = button:CreateTexture()
	ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
	ptex:SetTexCoord(0, 0.625, 0, 0.6875)
	ptex:SetAllPoints()
	button:SetPushedTexture(ptex)

--[[ Set up frame ]]--
local frameborder = CreateFrame("frame", nil, trinketFrame)
frameborder:SetAllPoints(trinketFrame)
frameborder:SetFrameStrata("BACKGROUND")
frameborder:SetFrameLevel(1)
frameborder.left = frameborder:CreateTexture(nil, "BORDER")
frameborder.left:SetPoint("BOTTOMLEFT", frameborder, "BOTTOMLEFT", -2, -1)
frameborder.left:SetPoint("TOPRIGHT", frameborder, "TOPLEFT", -1, 1)
frameborder.left:SetColorTexture(0, 0, 0, 1)
frameborder.right = frameborder:CreateTexture(nil, "BORDER")
frameborder.right:SetPoint("BOTTOMLEFT", frameborder, "BOTTOMRIGHT", 1, -1)
frameborder.right:SetPoint("TOPRIGHT", frameborder, "TOPRIGHT", 2, 1)
frameborder.right:SetColorTexture(0, 0, 0, 1)
frameborder.top = frameborder:CreateTexture(nil, "BORDER")
frameborder.top:SetPoint("BOTTOMLEFT", frameborder, "TOPLEFT", -1, 1)
frameborder.top:SetPoint("TOPRIGHT", frameborder, "TOPRIGHT", 1, 2)
frameborder.top:SetColorTexture(0, 0, 0, 1)
frameborder.bottom = frameborder:CreateTexture(nil, "BORDER")
frameborder.bottom:SetPoint("BOTTOMLEFT", frameborder, "BOTTOMLEFT", -1, -1)
frameborder.bottom:SetPoint("TOPRIGHT", frameborder, "BOTTOMRIGHT", 1, -2)
frameborder.bottom:SetColorTexture(0, 0, 0, 1)
