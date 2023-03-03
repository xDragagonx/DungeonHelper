
ChatLog("Starting DungeonHelper for Emerald Isle.")
-- Function to warn for incoming casts.
function SilentWhirlpoolCast(spellName, spellProgress, mobNameCastingSpell) --works
	Bear(spellName, spellProgress, mobNameCastingSpell)
    --WatchDogInterrupt(spellName, spellProgress, mobNameCastingSpell)
    --PoacherShooterInterrupt(spellName, spellProgress, mobNameCastingSpell)
	--BOSSSteelLumberjackDefend(spellName, spellProgress, mobNameCastingSpell)
end

--Function to warn for debuffs on the player (puri)
function SilentWhirlpoolbuffName(buffName, debuffOwner)
    --BloodthirstyFlycatcher(buffName, debuffOwner) --Mechanics for Bloodthirsty Flycatcher
    --Pyromant(buffName, debuffOwner)
end
--function to warn for dispell
function SilentWhirlpoolEnemyBuff(debuffOwner, enemyBuffName)
    
end
function Bear(spellName, spellProgress, mobNameCastingSpell)
    if spellName == "Blast Wave" then
        wtBearAOE:SetVal("value", "Use a defensive")
        wtBearAOE:Show(true)
        wtBearAOE2:SetVal("value", "Interrupt "..mobNameCastingSpell.."!")
        wtBearAOE2:Show(true)
    end
    if spellName == "Torture" then
        wtBearAOE:SetVal("value", "Interrupt "..mobNameCastingSpell.."!")
        wtBearAOE:Show(true)
    end
end
Global("SilentWhirlpoolCast", SilentWhirlpoolCast )
Global ("SilentWhirlpoolbuffName", SilentWhirlpoolbuffName)
Global ("SilentWhirlpoolEnemyBuff", SilentWhirlpoolEnemyBuff)
--[[ function Pyromant(buffName, debuffOwner)
    if buffName == " Living Flame" then
        wtMessagePyromantLivingFlame:SetVal("value", "Use a defensive")
        wtMessagePyromantLivingFlame:Show(true)
    end
    if buffName == "Burning" then
        wtMessagePyromantBurning:SetVal("value", "Purify on "..debuffOwner)
        wtMessagePyromantBurning:Show(true)
    end
end
function WatchDogInterrupt(spellName, spellProgress, mobNameCastingSpell)
    if  spellName == "Devour" then
        wtMessageWatchDog:SetVal("value", "interrupt the "..mobNameCastingSpell.."!")
        wtMessageWatchDog:Show(true)
    end
end
function PoacherShooterInterrupt(spellName, spellProgress, mobNameCastingSpell)
    if  spellName == "Deadly Shot" then
        wtMessagePoacherShooter:SetVal("value", "interrupt the "..mobNameCastingSpell.."!")
        wtMessagePoacherShooter:Show(true)
    end
end
function BOSSSteelLumberjackDefend(spellName, spellProgress, mobNameCastingSpell)
    if  spellName == "Motivation" then
        wtMessage:SetVal("value", "interrupt the "..mobNameCastingSpell.."!")
        wtMessage:Show(true)
    end
end
function JailerInterrupt(spellName, spellProgress, mobNameCastingSpell)
    if  spellName == "Motivation" then
        wtMessage:SetVal("value", "interrupt the "..mobNameCastingSpell.."!")
        wtMessage:Show(true)
    end
end
function BloodthirstyFlycatcher(buffName, debuffOwner)
	local inCombatBloodthirstyFlycatcher = object.IsInCombat( 76541 )
	--ChatLog("In combat?: ", inCombatBloodthirstyFlycatcher)
	if inCombatBloodthirstyFlycatcher then
        if buffName == "Parasitizing Spores" then
            ChatLog("puri")
        end
	end
end ]]