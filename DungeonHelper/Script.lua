--VARIABLES
local wtMessage = mainForm:GetChildChecked("Text", false)
local wtMessage2 = mainForm:GetChildChecked("Text2", false)
local wtMessage3 = mainForm:GetChildChecked("Text3", false)
local wtMessageMinotaur = mainForm:GetChildChecked("Text", false)
local wtMessagePoacherShooter = mainForm:GetChildChecked("Text", false)
local wtMessageWatchDog = mainForm:GetChildChecked("Text", false)
local wtMessagePyromantLivingFlame = mainForm:GetChildChecked("PyromantWarning", false)
local wtMessagePyromantBurning = mainForm:GetChildChecked("Text", false)

--Silent Whirlpool
local wtBearAOE = mainForm:GetChildChecked("Text", false)
local wtBearAOE2 = mainForm:GetChildChecked("Text2", false)
Global ("wtBearAOE", wtBearAOE)
Global ("wtBearAOE2", wtBearAOE2)
--Global ("debuffEnded", debuffEnded) asked pasi how to do this succesfully.
-- GLOBAL VARIABLES
--TODO clear states after the allod
_GactiveBuffs = {}
Global("_GactiveBuffs", _GactiveBuffs)
Global ("wtMessage", wtMessage)
Global ("wtMessage2", wtMessage2)
Global ("wtMessage3", wtMessage3)
Global ("wtMessageMinotaur", wtMessageMinotaur)
Global ("wtMessagePoacherShooter", wtMessagePoacherShooter)
Global ("wtMessageWatchDog", wtMessageWatchDog)
Global ("wtMessagePyromantLivingFlame", wtMessagePyromantLivingFlame)
Global ("wtMessagePyromantBurning", wtMessagePyromantBurning)
local healClass = {["PRIEST"] = true, ["DRUID"] = true, ["NECROMANCER"] = true}
Global ("healClass", healClass)
local tankClass = {"WARRIOR", "PALADIN", "STALKER", "WARLOCK"}
Global ("tankClass", tankClass)
local uselessDPS = {"MAGE", "PSIONIC"}
Global ("uselessDPS", uselessDPS)
local supportClass = {"ENGINEER", "BARD"}
Global ("supportClass", supportClass)
local myClass = avatar.GetClass()
Global ("myClass", myClass)
--[[ Class names
1) BARD
2) DRUID
3) ENGINEER
4) MAGE
5) NECROMANCER
6) PALADIN
7) PRIEST
8) PSIONIC
9) STALKER
10) WARRIOR
11) WARLOCK
]]

--[[ Compass names
1) Copper Mountain 
2) Firefrost
3) Land of the Thousand Wings
4) Lab 731
5) Fenia's Fenia's Cloister
6) Emerald Isle
7) Duck River Run
8) Snowflake Resort
9) Lumix Isle
10) Silent Whirlpool
]]


function Main()
--[[ TO TEST THE wtMessage 
	wtMessage:SetVal("value", "this is wtMessage")
	wtMessage:Show(true)
	wtMessage2:SetVal("value", "this is wtMessage2")
	wtMessage2:Show(true)
	wtMessage3:SetVal("value", "this is wtMessage3")
	wtMessage3:Show(true) 
	]]

	--MyEnemy()
	TargetBuffs()
--[[ TRY THIS WHEN GLOBALS RETURN NIL OR UNDECLARE 	
	function Test()
		TargetBuffs()
		common.UnRegisterEventHandler(Test, "EVENT_SECOND_TIMER")
		
	end ]]
	--common.RegisterEventHandler(Test, "EVENT_SECOND_TIMER")
	--common.RegisterEventHandler(UpdateSecond, "EVENT_SECOND_TIMER")
	
	--common.RegisterEventHandler(TargetBuffs, "EVENT_OBJECT_BUFF_ADDED")

	common.RegisterEventHandler(EnemyCastStarted, "EVENT_MOB_ACTION_PROGRESS_START") --https://alloder.pro/md/LuaApi/EventMobActionProgressStart.html
	common.RegisterEventHandler(EnemyCastEnded, "EVENT_MOB_ACTION_PROGRESS_FREEZE") --https://alloder.pro/md/LuaApi/EventMobActionProgressFreeze.html
	common.RegisterEventHandler(EnemyCastEnded, "EVENT_MOB_ACTION_PROGRESS_FINISH") --https://alloder.pro/md/LuaApi/EventMobActionProgressFinish.html

	common.RegisterEventHandler(BuffFinder, "EVENT_OBJECT_BUFF_ADDED") --https://alloder.pro/md/LuaApi/EventObjectBuffAdded.html
	common.RegisterEventHandler(DebuffEnded, "EVENT_OBJECT_BUFF_REMOVED") --https://alloder.pro/md/LuaApi/EventObjectBuffRemoved.html
	--WhereAmI()
	--WhatisMyClass()
end
function MyEnemy()
	local targetName = userMods.FromWString(object.GetName(avatar.GetTarget()))
	local unitId = avatar.GetTarget()
	local inCombat = object.IsInCombat( unitId )
	ChatLog("My current target: ", targetName,". unitId: ", unitId,". in combat: ", inCombat)
end
function TargetBuffs()
	if avatar.GetTarget() == nil then
		return
	end
	local buffTable = object.GetBuffs(avatar.GetTarget()) --avatar.GetTarget can be replaced with an id of the mob
	if buffTable then
		for k, v in pairs(buffTable) do
			local buffInfo = object.GetBuffInfo( buffTable[k] )

			local enemyBuffName = userMods.FromWString(buffInfo.name)
			local enemyBuffHolder = userMods.FromWString(object.GetName(buffInfo.ownerId))
			ChatLog("enemyBuffName: "..enemyBuffName.." on "..enemyBuffHolder)
			WhereAmI(nil, nil, nil, nil, nil, enemyBuffName, enemyBuffHolder)
		end
	end
end
function BuffFinder(params) --https://alloder.pro/md/LuaApi/EventObjectBuffAdded.html
	local debuffOwner = userMods.FromWString(object.GetName(params.objectId))
	local buffName = userMods.FromWString(params.buffName)
	ChatLog("-"..debuffOwner.."- gained -"..buffName.."-")
	WhereAmI(nil, nil, nil, buffName, debuffOwner, nil)
end
function DebuffEnded(params) --https://alloder.pro/md/LuaApi/EventObjectBuffRemoved.html
	local debuffOwner = userMods.FromWString(object.GetName(params.objectId)) --VERIFY WETHR THIS WORKS FOR PASI
	local buffName = userMods.FromWString(params.buffName)
	for k, v in pairs(_GactiveBuffs) do
		if v["debuffName"] == buffName then
			v["message"]:Show(false)
			table.remove(_GactiveBuffs, v)
		end
	end

--[[ 

	if buffName == "Deceitful Fire" then --Clot Of Light, Lumix isle
		wtMessage:Show(false)
	end
	if buffName == " Living Flame" then
		wtMessagePyromantLivingFlame:Show(false)
	end
	if buffName == "Burning" then
		wtMessagePyromantBurning:Show(false)
	end
	if buffName == " Heat Lightning" then
		wtMessage:Show(false)

	end ]]

end
--[[ function DebuffEnded(params, buffN, debuffOwner) --https://alloder.pro/md/LuaApi/EventObjectBuffRemoved.html
	local debuffOwner = userMods.FromWString(object.GetName(params.objectId)) 
	local buffName = userMods.FromWString(params.buffName)
	if buffName == buffN then
		wtMessage:Show(false)
	end
end ]]
function EnemyCastStarted(params) --https://alloder.pro/md/LuaApi/EventMobActionProgressStart.html
	--[[ local spellId = params.spellId
	ChatLog("1 spellId: ", spellId)
		 local spellProgress = params.progress
	ChatLog("3 Spellprogress: ", spellProgress)
	 ]]
	local spellDuration = params.duration/1000
	ChatLog("2 Spellduration: ", spellDuration)
	local spellName = userMods.FromWString(params.name)
	--ChatLog("4 Spellname:","-"..spellName.."-")
	local spellNameIdOfMob = params.id
	--ChatLog("5 id: ", spellNameIdOfMob)
	local mobNameCastingSpell = userMods.FromWString(object.GetName(spellNameIdOfMob))

	local targetOfCaster = unit.GetTarget(spellNameIdOfMob)
	common.LogInfo("common", targetOfCaster)
	ChatLog("8 -"..mobNameCastingSpell.."- started casting -"..spellName.."-")

	--[[ 	
	local isPrecast = params.isPrecast
	ChatLog("6 is Precast: ", isPrecast)
	local isChannel = params.isChannel
	ChatLog("7 is channel: ", isChannel) 
	]]
	
	--local targetOfMyTarget = mobNameCastingSpell.GetTarget( params.id )
	
	WhereAmI(spellName,spellDuration,mobNameCastingSpell, nil, nil, nil)
	--UpdateSecond(spellName,spellDuration,mobNameCastingSpell)
end
--[[ function UpdateSecond(params, spellName,spellDuration,mobNameCastingSpell)
	ChatLog(spellDuration)
	
	WhereAmI(spellName,spellDuration,mobNameCastingSpell, nil, nil, nil)
	if params.elapsedMs == 1000 then
		spellDuration = spellDuration - 1
	end
end ]]
function EnemyCastEnded(params) -- https://alloder.pro/md/LuaApi/EventMobActionProgressFreeze.html AND https://alloder.pro/md/LuaApi/EventMobActionProgressFinish.html
    --Does it end when mob dies?
	local spellNameIdOfMob = params.id
	local mobNameCastingSpell = userMods.FromWString(object.GetName(spellNameIdOfMob))
	wtMessage:Show(false)
	wtMessage2:Show(false)
	wtMessage3:Show(false)
	wtMessageMinotaur:Show(false)
	wtMessagePoacherShooter:Show(false)
	wtMessageWatchDog:Show(false)
end
function WhereAmI(spellName, spellDuration, mobNameCastingSpell, buffName, debuffOwner, enemyBuffName, enemyBuffHolder) --pasi said im on drugs coding this. future me, is this true?
	local zoneInfo = cartographer.GetCurrentZoneInfo()
	local currentMap = userMods.FromWString(zoneInfo.zoneName)
	--ChatLog("Current map: ", currentMap)
	if currentMap == "Land of the Thousand Wings" then
		if spellName then
			LandoftheThousandWingsCast(spellName, spellDuration, mobNameCastingSpell)
		elseif buffName then
			LandoftheThousandWingsbuffName(buffName, debuffOwner)
		elseif enemyBuffName then
			LandoftheThousandWingsEnemyBuff(enemyBuffName)
		end
	elseif currentMap == "Copper Mountain" then
		CopperMountain()
	elseif currentMap == "Firefrost" then
		if spellName then
			FirefrostCast(spellName, spellDuration, mobNameCastingSpell)
		elseif buffName then
			FirefrostbuffName(buffName, debuffOwner)
		elseif enemyBuffName then
			FirefrostEnemyBuff(enemyBuffName)
		end
	elseif currentMap == "Lab 731" then
		Lab731()
	elseif currentMap == "Fenia's Cloister" then
		if spellName then
			FeniasCloisterCast(spellName, spellDuration, mobNameCastingSpell)
		else
			FeniasCloisterDebuff(debuffOwner)
		end
	elseif currentMap == "Emerald Isle" then
		if spellName then
			EmeraldIsleCast(spellName, spellDuration, mobNameCastingSpell)
		elseif buffName then
			EmeraldIsleDebuff(buffName, debuffOwner)
		elseif enemyBuffName then
			EmeraldIsleEnemyBuff(enemyBuffName)
		end
	elseif currentMap == "Duck River Run" then
		if spellName then
			DuckRiverRunCast(spellName, spellDuration, mobNameCastingSpell)
		elseif buffName then
			DuckRiverRunbuffName(buffName, debuffOwner)
		elseif enemyBuffName then
			DuckRiverRunEnemyBuff(enemyBuffName)
		end
	elseif currentMap == "Snowflake Resort" then
		if spellName then
			SnowflakeResortCast(spellName, spellDuration, mobNameCastingSpell)
		elseif buffName then
			SnowflakeResortDebuff(buffName, debuffOwner)
		elseif enemyBuffName then
			SnowflakeResortEnemyBuff(enemyBuffName)
		end
	elseif currentMap == "Lumix isle" then
		if spellName then
			LumixisleCast(spellName, spellDuration, mobNameCastingSpell)
		elseif buffName then
			LumixisleBuffName(buffName, debuffOwner)
		elseif enemyBuffName then
			ChatLog("HI 1")
			LumixisleEnemyBuff(enemyBuffName, enemyBuffHolder)
			ChatLog("HI 2")
		end
	elseif currentMap == "Silent Whirlpool" then
		if spellName then
			SilentWhirlpoolCast(spellName, spellDuration, mobNameCastingSpell)
		elseif buffName then
			SilentWhirlpoolbuffName(buffName, debuffOwner)
		elseif enemyBuffName then
			SilentWhirlpoolEnemyBuff(enemyBuffName)
		end
	end
end

if (avatar.IsExist()) then
	ChatLog("DungeonHelp loaded.")
	Main()
else
	ChatLog("Avatar was not found. DungeonHelp won't work. Reload the addon")
	common.RegisterEventHandler(Main, "EVENT_AVATAR_CREATED")
end

