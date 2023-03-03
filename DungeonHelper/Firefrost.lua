

ChatLog("Starting DungeonHelper for Firefrost.")

--function to warn on mob casts.
function FirefrostCast(spellName, spellProgress, mobNameCastingSpell) --works
        if spellName == "Precise Throw" then
            wtMessage:SetVal("value", "interrupt the Goblin Hunter!")
            wtMessage:Show(true)
        end

        if spellName == "Encouraging Roar" then
            local wtMessageMinotaur = mainForm:GetChildChecked("Text", false)
            wtMessageMinotaur:SetVal("value", "interrupt the Minotaur!")
            wtMessageMinotaur:Show(true)
            if "EVENT_MOB_ACTION_PROGRESS_FINISH" and myClass == tankClass then
                wtMessageMinotaur:SetVal("value", "RUN! Don't let the minotaur get you.")
                wtMessageMinotaur:Show(true)
            end
        end
	--end
end
--function to warn for puri
function FirefrostbuffName(buffName, debuffOwner)
    
end

--function to warn for dispell
function FirefrostEnemyBuff(enemyBuffName)
    
end
Global("FirefrostCast", FirefrostCast )
Global("FirefrostbuffName", FirefrostbuffName)
Global("FirefrostEnemyBuff", FirefrostEnemyBuff)
