

ChatLog("Starting DungeonHelper for Duck River Run.")

--function to warn on mob casts.
function DuckRiverRunCast(spellName, spellProgress, mobNameCastingSpell) --works
	--[[ local inCombatIntruder = object.IsInCombat( avatar.GetTarget() )
	ChatLog("IN COMBAT: ", inCombatIntruder)
	if inCombatIntruder then ]]
        InterruptIntruder(spellName)
        InterruptMinotaur(spellName)
end
--function to warn for puri
function DuckRiverRunPlayerDebuffName(debuffName)
    
end
--function to warn for dispell
function DuckRiverRunEnemyBuff(enemyBuffName)
    
end
function InterruptMinotaur(spellName, spellProgress, mobNameCastingSpell)
    if spellName == "Encouraging Roar" then
        wtMessageMinotaur:SetVal("value", "interrupt the Minotaur!")
        wtMessageMinotaur:Show(true)
        if "EVENT_MOB_ACTION_PROGRESS_FINISH" and myClass == tankClass then
            wtMessageMinotaur:SetVal("value", "RUN! Don't let the minotaur get you.")
            wtMessageMinotaur:Show(true)
        end
    end
end
function InterruptIntruder(spellName, spellProgress, mobNameCastingSpell)
    if spellName == "Deadly Shot" then
        wtMessage:SetVal("value", "interrupt the Intruder!")
        wtMessage:Show(true)
    end
end
Global("DuckRiverRunCast", DuckRiverRunCast )
Global("DuckRiverRunPlayerDebuffName", DuckRiverRunPlayerDebuffName)
Global("DuckRiverRunEnemyBuff", DuckRiverRunEnemyBuff)