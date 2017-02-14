ShaguStanceDance = CreateFrame("Frame")
ShaguStanceDance:RegisterEvent("UI_ERROR_MESSAGE")

ShaguStanceDanceLastErr = ""
Hook_CastSpell = CastSpell
Hook_CastSpellByName = CastSpellByName
Hook_UseAction = UseAction

local locale = GetLocale()

if locale == "deDE" then
  ShaguStanceDance.BattleStance = "Kampfhaltung"
  ShaguStanceDance.DefensiveStance = "Verteidigungshaltung"
  ShaguStanceDance.BerserkerStance = "Berserkerhaltung"
  ShaguStanceDance.wantBattleStance = "Muss in Kampfhaltung sein."
  ShaguStanceDance.wantDefensiveStance = "Muss in Verteidigungshaltung sein."
  ShaguStanceDance.wantBerserkerStance = "Muss in Berserkerhaltung sein."
  ShaguStanceDance.wantBattleDefStance = "Muss in Kampfhaltung, Verteidigungshaltung sein."
  ShaguStanceDance.wantBattleBerserkStance = "Muss in Kampfhaltung, Berserkerhaltung sein."
elseif locale == "frFR" then
  ShaguStanceDance.BattleStance = "Posture de combat"
  ShaguStanceDance.DefensiveStance = "Posture défensive"
  ShaguStanceDance.BerserkerStance = "Posture berserker"
  ShaguStanceDance.wantBattleStance = "Requiert Posture de combat"
  ShaguStanceDance.wantDefensiveStance = "Requiert Posture défensive"
  ShaguStanceDance.wantBerserkerStance = "Requiert Posture berserker"
  ShaguStanceDance.wantBattleDefStance = "Requiert Posture de combat, Posture défensive"
  ShaguStanceDance.wantBattleBerserkStance = "Requiert Posture de combat, Posture berserker"
elseif locale == "ruRU" then
  ShaguStanceDance.BattleStance = "Боевая стойка"
  ShaguStanceDance.DefensiveStance = "Оборонительная стойка"
  ShaguStanceDance.BerserkerStance = "Стойка берсерка"
  ShaguStanceDance.wantBattleStance = "Необходимо находиться в Боевая стойка."
  ShaguStanceDance.wantDefensiveStance = "Необходимо находиться в Оборонительная стойка."
  ShaguStanceDance.wantBerserkerStance = "Необходимо находиться в Стойка берсерка."
  ShaguStanceDance.wantBattleDefStance = "Необходимо находиться в Боевая стойка, Оборонительная стойка."
  ShaguStanceDance.wantBattleBerserkStance = "Необходимо находиться в Боевая стойка, Стойка берсерка."
elseif locale == "zhCN" then
  ShaguStanceDance.BattleStance = "战斗姿态"
  ShaguStanceDance.DefensiveStance = "防御姿态"
  ShaguStanceDance.BerserkerStance = "狂暴姿态"
  ShaguStanceDance.wantBattleStance = "必须在战斗姿态中"
  ShaguStanceDance.wantDefensiveStance = "必须在防御姿态中"
  ShaguStanceDance.wantBerserkerStance = "必须在狂暴姿态中"
  ShaguStanceDance.wantBattleDefStance = "必须在战斗姿态, 防御姿态中"
  ShaguStanceDance.wantBattleBerserkStance = "必须在战斗姿态, 狂暴姿态中"
else
  ShaguStanceDance.BattleStance = "Battle Stance"
  ShaguStanceDance.DefensiveStance = "Defensive Stance"
  ShaguStanceDance.BerserkerStance = "Berserker Stance"
  ShaguStanceDance.wantBattleStance = "Must be in Battle Stance"
  ShaguStanceDance.wantDefensiveStance = "Must be in Defensive Stance"
  ShaguStanceDance.wantBerserkerStance = "Must be in Berserker Stance"
  ShaguStanceDance.wantBattleDefStance = "Must be in Battle Stance, Defensive Stance"
  ShaguStanceDance.wantBattleBerserkStance = "Must be in Battle Stance, Berserker Stance"
end

function CastSpell(spellId, spellbookTabNum)
  if ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleDefStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBerserkerStance then
    Hook_CastSpellByName(ShaguStanceDance.BerserkerStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantDefensiveStance then
    Hook_CastSpellByName(ShaguStanceDance.DefensiveStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleBerserkStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  end
  ShaguStanceDanceLastErr = ""

  Hook_CastSpell(spellId, spellbookTabNum)
end

function CastSpellByName(spellName, onSelf)
  if ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleDefStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBerserkerStance then
    Hook_CastSpellByName(ShaguStanceDance.BerserkerStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantDefensiveStance then
    Hook_CastSpellByName(ShaguStanceDance.DefensiveStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleBerserkStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  end
  ShaguStanceDanceLastErr = ""

  Hook_CastSpellByName(spellName, onSelf)
end

function UseAction(slot, checkCursor, onSelf)
  if ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleDefStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBerserkerStance then
    Hook_CastSpellByName(ShaguStanceDance.BerserkerStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantDefensiveStance then
    Hook_CastSpellByName(ShaguStanceDance.DefensiveStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleBerserkStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  end
  ShaguStanceDanceLastErr = ""

  Hook_UseAction(slot, checkCursor, onSelf)
end

ShaguStanceDance:SetScript("OnEvent", function()
  ShaguStanceDanceLastErr = arg1
end)
