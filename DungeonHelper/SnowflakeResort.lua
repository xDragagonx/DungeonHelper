

ChatLog("Starting DungeonHelper for Emerald Isle.")

-- Function to warn for incoming casts.
function SnowflakeResortCast(spellName, spellDuration, mobNameCastingSpell) --works
    PioneerInterrupt(spellName, spellDuration, mobNameCastingSpell)
    
end
--Function to warn for debuffs on the player (puri)
function SnowflakeResortDebuff(buffName, debuffOwner)
    PioneerPuri(buffName, debuffOwner)
    SnowyShamanPuri(buffName, debuffOwner)
    
end
--function to warn for dispell
function SnowflakeResortEnemyBuff(debuffOwner, enemyBuffName)
    
end

function PioneerInterrupt(spellName, spellDuration, mobNameCastingSpell)
    if spellName == "Flaming Arrow" then
        wtMessage:SetVal("value", "Interrupt the "..mobNameCastingSpell)
        wtMessage:Show(true)
    end
end
function PioneerPuri(buffName, debuffOwner)
    if healClass[myClass] then
        if buffName == "Fire Embrace" then
            wtMessage:SetVal("value", "Purify "..debuffOwner)
            wtMessage:Show(true)
        end
    end
end
function SnowyShamanPuri(buffName, debuffOwner)
    --if healClass[myClass] then
--[[         wtMessage2:SetVal("value", "Purify the thing")
	wtMessage2:Show(true) ]]
        common.LogInfo("common", "-"..buffName.."-")
        common.LogInfo("common", "-".."Shaman’s Incantation".."-")
        if buffName == "Shaman’s Incantation" then
            wtMessage2:SetVal("value", "Purify "..debuffOwner)
            wtMessage2:Show(true)
        end
    --end
    end
Global("SnowflakeResortCast", SnowflakeResortCast)
Global("SnowflakeResortDebuff", SnowflakeResortDebuff)
Global("SnowflakeResortEnemyBuff", SnowflakeResortEnemyBuff)