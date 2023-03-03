ChatLog("Starting DungeonHelper for Lumix isle.")


--function to warn on mob casts.
function LumixisleCast(spellName, spellProgress, mobNameCastingSpell)
    ServantOfLightCasts(spellName, spellProgress, mobNameCastingSpell)
    SnowHunterTotem(spellName, spellProgress, mobNameCastingSpell)
end
--function to warn for puri
function LumixisleBuffName(buffName, debuffOwner)
    ClotOfLifePuri(buffName, debuffOwner)--NOT VERIFIED
    PurifyServantOfLight(buffName, debuffOwner)
end
--function to warn for dispells
function LumixisleEnemyBuff(enemyBuffName, enemyBuffHolder)
    ChatLog("WE'RE FINALLY IN")
end
--GENERAL FUNCTIONS
function SnowHunterTotem(spellName, spellProgress, mobNameCastingSpell)
    if spellName == "Summon" then
        wtMessage:SetVal("value","Kill the totem or die")
        wtMessage:Show(true)
    end
end
function ClotOfLifePuri(buffName, debuffOwner)
    if buffName == "Deceitful Fire" then
        wtMessage:SetVal("value", "Purify on "..debuffOwner)
        wtMessage:Show(true)
    end
end
function ServantOfLightCasts(spellName, spellProgress, mobNameCastingSpell)
    if spellName == " Blessing" then --frontspace is important
        wtMessage2:SetVal("value", "Interrupt "..mobNameCastingSpell)
        wtMessage2:Show(true)
    end
    if spellName == " Flash of Light" then --frontspace is important
        if healClass[myClass] then
            wtMessage:SetVal("value", "Purify the debuffs")
        end
        if myClass == "ENGINEER" then
            wtMessage:SetVal("value", "Medical Emergency!")
        end
        if myClass == "BARD" then
            wtMessage:SetVal("value", "Sonata!")
        end
        wtMessage:Show(true)
    end
end
function PurifyServantOfLight(buffName, debuffOwner)
    if buffName == " Heat Lightning" then --frontspace is important
        if myClass == "BARD" then
            wtMessage:SetVal("value", "Use Sonata!")
        elseif myClass == "ENGINEER" then
            wtMessage:SetVal("value", "Use Medical Emergency!")
        elseif healClass[myClass] then
            wtMessage:SetVal("value", "Purify "..debuffOwner)
        end
        wtMessage:Show(true)
        
        table.insert(_GactiveBuffs, {["message"] = wtMessage, ["debuffName"] = buffName})
        

        --DebuffEnded(params, " Heat lightning")
    end
end
Global("LumixisleCast", LumixisleCast )
Global("LumixisleBuffName", LumixisleBuffName)
Global("LumixisleEnemyBuff", LumixisleEnemyBuff)

