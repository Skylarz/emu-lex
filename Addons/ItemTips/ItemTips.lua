--[[
	ItemTips 0.65

	This mod adjusts item tooltips to show estimated item level based on stats and Blizzard's reported item level.
	Made by Gandros on Ner'Zhul.
	Formerly known as Cera on Magtheridon.

	Feel free to edit or use any part of my code but the libs have their own licenses.
]]


ItemTips = {}
ItemTips.Huge = 658764
local TipHooker = AceLibrary("TipHooker-1.0")


function ItemTips:OnLoad()

	ItemTips.RealmName = GetCVar("realmName")
	if (ItemTips.RealmName == "Magtheridon" or ItemTips.RealmName == "Ner'zhul") then
		this:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	end

	--Hook GameTooltip
	TipHooker:Hook(self.Main, "item")
end

function ItemTips:OnEvent()

	if (event == "UPDATE_MOUSEOVER_UNIT") then
		if (UnitName("mouseover")) then
			ItemTips:UnitFormat("mouseover")
		end
	elseif (event == "ADDON_LOADED" and arg1 == "ItemTips") then
		ItemTips:OnLoad()
		this:UnregisterEvent("ADDON_LOADED")
	end
end


--Main Routine--------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function ItemTips.Main(tooltip, name, link)

	-- Get the Item ID from the link string
	if not tooltip.GetItem then return end
	if (link == nil or name == nil) then return end
	if ItemTips.Dev then
		local _, _, fullid = strfind(link, "item:(.+)%[")
		ItemTips:Debug("ItemTips Link: ".. fullid)
	end
	local _, _, id, id2 = strfind(link, "item:(%d+).+:(.+:.+)%[")

	-- Check item without enchants and such in our own tooltip
	ItemTips_Tooltip:ClearLines()
	ItemTips_Tooltip:SetHyperlink("item:".. id.. ":0:0:0:0:0:".. id2)

	local _, _, rarity, level, _, _, _, _, location = GetItemInfo(link)
	local sum, i, j, ilvl, invisible_stat = 0, 0, 0, 0, 0
	local count = ItemTips_Tooltip:NumLines()
	local unsure = false
	if (count == nil or location == nil) then return end

	ItemTips:ClearSacrificed(location, count, rarity, level)

	for i=1, count do
		ItemTips.TooltipLine = getglobal("ItemTips_TooltipTextLeft".. i)
		item_text = string.lower(ItemTips.TooltipLine:GetText())

		for j in pairs(ItemTips.Stats) do
			local skip = false
			local pattern = ItemTips.Stats[j].pattern
			local weight = ItemTips.Stats[j].weight
			local match, _, value = string.find(item_text, pattern)

			if (ItemTips.Stats[j].cap) then
				if (ItemTips.Stats[j].cap[rarity+1] >= level) then
					skip = false
				else
					skip = true
				end
			end

			if (match ~= nil and weight == ItemTips.Huge and not skip) then
				unsure = true
				if ItemTips.Dev then ItemTips:Debug("ItemTips Found: ".. item_text.. ", Weight: Unsure") end
				break
			elseif (value ~= nil and not skip) then
				sum = sum + math.pow((weight*value),3/2)
				if ItemTips.Dev then ItemTips:Debug("ItemTips Found: ".. item_text.. ", Weight: ".. weight) end
				break
			elseif (match ~= nil and not skip) then
				--sum = sum + math.pow(weight,3/2)				-- socket costs are real sketchy
				invisible_stat = invisible_stat + weight
				if ItemTips.Dev then ItemTips:Debug("ItemTips Found: ".. item_text.. ", Weight: ".. weight) end
				break
			end
		end
	end
	sum = sum + math.pow(invisible_stat,3/2)						-- does socket cost get added before raised?

	local ItemValue = math.pow(sum,2/3)
	local ItemSlotValue = ItemValue * ItemTips.Slots[location]			-- multiply by SlotMod
	if (rarity == 2) then
		ilvl = math.ceil(ItemSlotValue * 2.0 + 4.00)				-- green item
	elseif (rarity == 3) then
		ilvl = math.ceil(ItemSlotValue * 1.6 + 1.84)				-- blue item
	elseif (rarity == 4) then
		ilvl = math.ceil(ItemSlotValue * 1.3 + 1.30)				-- purple item
	end


	local newLine = ""
	if level and ilvl then
		if ((ilvl < 5) or (unsure and (ilvl < (level * 0.9) or ilvl > (level * 1.1)))) then ilvl = "Unsure" end
		newLine = newLine.. "iLevel: ".. level.. ",  Estimate: ".. ilvl.. ",  ItemID: ".. id
		newLine = ItemTips:Color(newLine,"00A9A9")
	end
	if newLine ~= "" then
		tooltip:AddLine(newLine)
		tooltip:Show()
	end
end

--Weapon Sacrifice Routine--------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function ItemTips:ClearSacrificed(location, count, rarity, level)

	if not ((location == "INVTYPE_WEAPONMAINHAND") or (location == "INVTYPE_2HWEAPON")
		or (location == "INVTYPE_WEAPON")) then return end
	if ItemTips.Dev then ItemTips:Debug("ItemTips: Checking for sacrificed melee dps") end

	-- Check weapon's dps vs expected dps
	local i
	for i=1, count do
		ItemTips.TooltipLine = getglobal("ItemTips_TooltipTextLeft".. i)
		item_text = string.lower(ItemTips.TooltipLine:GetText())
		local _, _, value = string.find(item_text, ItemTips.Dps)
		if (value ~= nil) then
			if ItemTips.Dev then ItemTips:Debug("ItemTips: Weapon has ".. value .." dps") end
			if (location == "INVTYPE_2HWEAPON") then
				if ((value/level > 0.9) and (rarity == 4)) then return end
				if ((value/level > 0.8) and (rarity == 3)) then return end
				if ((value/level > 0.65) and (rarity == 2)) then return end
			else
				if ((value/level > 0.7) and (rarity == 4)) then return end
				if ((value/level > 0.6) and (rarity == 3)) then return end
				if ((value/level > 0.5) and (rarity == 2)) then return end
			end
			break
		end
		if (i == count) then return end
	end

	-- Clear any +damage or +healing because it came from sacrificed melee dps
	if ItemTips.Dev then ItemTips:Debug("ItemTips: Weapon sacrifices melee dps") end
	for i=1, count do
		ItemTips.TooltipLine = getglobal("ItemTips_TooltipTextLeft".. i)
		item_text = string.lower(ItemTips.TooltipLine:GetText())

		local pattern_dmg = ItemTips.Stats[20].pattern				-- hack to +dmg pattern
		local _, _, value = string.find(item_text, pattern_dmg)
		if (value ~= nil) then
			ItemTips.TooltipLine:SetText("nil")
			return
		end

		local pattern_heal = ItemTips.Stats[18].pattern				-- hack to +healing pattern
		local _, _, value = string.find(item_text, pattern_heal)
		if (value ~= nil) then
			ItemTips.TooltipLine:SetText("nil")
			return
		end

		-- Anathema sacrifices for single school damage but it's the only weapon that does, so I'm leaving support out
	end
end

--Unit MouseOver Routine----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function ItemTips:Color(text,color)

	return "|cff" .. tostring(color or 'ffffff') .. tostring(text) .. "|r"
end

--Unit MouseOver Routine----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function ItemTips:UnitFormat(unit)

	local name = UnitName(unit)
	if (ItemTips.RealmName == "Magtheridon" and (name == "Cera" or name == "Serrated") or
	 (ItemTips.RealmName == "Ner'zhul" and (name == "Gandros" or name == "Gwyne")) ) then
		GameTooltip:AddLine("Author of ItemTips")
	end
	GameTooltip:Show()
end


--Debuging Routine----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function ItemTips:Debug(string)

	DEFAULT_CHAT_FRAME:AddMessage(tostring(string))
end
