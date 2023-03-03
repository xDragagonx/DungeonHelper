

ChatLog("Starting DungeonHelper for Fenia's Cloister.")

function FeniasCloisterCast(spellName, spellProgress, mobNameCastingSpell) --works
	local inCombatIntruder = object.IsInCombat( 19833 )
	ChatLog("In combat?: ", inCombatIntruder)
	if inCombatIntruder then
        if spellName == "Parasitizing Spores" then
            ChatLog("watch out!")
            wtMessage:SetVal("value", "interrupt!")
            wtMessage:Show(true)
        end
	end
end
function FeniasCloisterDebuff(buffName)
    
end

Global("FeniasCloisterCast", FeniasCloisterCast )
Global ("FeniasCloisterDebuff", FeniasCloisterDebuff)