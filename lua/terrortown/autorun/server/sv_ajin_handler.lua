util.AddNetworkString("ttt2_ajin_transform")

local function ResetAjin(ply)
  ply:SetNWBool("AjinTransformed", false)
  ply.ajinRegen = nil
end

local function ResetAllAjins()
  for _, ply in ipairs(player.GetAll()) do
    ResetAjin(ply)
  end
end

local function HasTeammates(ply)
  if not ply:Alive() or ply:IsSpec() then return false end

  local count = 0
  for _, pl in ipairs(player.GetAll()) do
    if pl == ply then continue end

    if pl:GetTeam() == ply:GetTeam() and pl:Alive() and not pl:IsSpec() then
      count = count + 1
    end
  end

  return count > 0
end

local function UnleashAjin(ply)
  if HasTeammates(ply) then return end
  if ply:GetNWBool("AjinTransformed") then return end

  events.Trigger(EVENT_AJIN_AWAKEN, ply)

  print("[TTT2 Ajin] " .. ply:Nick() .. " is transforming!")
  ply:SetNWBool("AjinTransformed", true)
  ply:SetMaxHealth(GetConVar("ttt2_ajin_maxhealth"):GetInt())
  ply:GiveArmor(GetConVar("ttt2_ajin_armor"):GetInt())
  SendFullStateUpdate()


  net.Start("ttt2_ajin_transform")
  net.Broadcast()
  ply.ajinRegen = CurTime()
end

hook.Add("Think", "AjinRegenThink", function()
  for _, ply in ipairs(player.GetAll()) do
    if not ply:Alive() or ply:IsSpec() or ply:GetSubRole() ~= ROLE_AJIN then continue end

    if not ply:GetNWBool("AjinTransformed") then continue end

    if ply.ajinRegen <= CurTime() then
      ply:SetHealth(math.Clamp(ply:Health() + GetConVar("ttt2_ajin_health_regen"):GetInt(), 0, ply:GetMaxHealth()))
      ply.ajinRegen = CurTime() + GetConVar("ttt2_ajin_regen_rate"):GetFloat()
    end
  end
end)

hook.Add("EntityTakeDamage", "AjinTakeDamage", function(ply, dmginfo)
  if not IsValid(ply) or not ply:IsPlayer() or ply:IsSpec() or not ply:Alive() then return end
  if ply:GetSubRole() ~= ROLE_AJIN or not ply:GetNWBool("AjinTransformed") then return end
  if dmginfo:GetDamage() > ply:Health() then return end

  ply.ajinRegen = CurTime() + GetConVar("ttt2_ajin_health_delay"):GetInt()
end)

hook.Add("EntityTakeDamage", "AjinDealDamage", function(ply, dmginfo)
  if not IsValid(ply) or not ply:IsPlayer() or ply:IsSpec() or not ply:Alive() then return end
  local attacker = dmginfo:GetAttacker()

  if not IsValid(attacker) or not attacker:IsPlayer() then return end
  if attacker:GetSubRole() ~= ROLE_AJIN or not attacker:GetNWBool("AjinTransformed") then return end

  local dmg_mult = GetConVar("ttt2_ajin_dmg"):GetFloat()

  dmginfo:ScaleDamage(dmg_mult)
end)

hook.Add("TTT2PostPlayerDeath", "OnAjinTeamDeath", function(victim, _, attacker)
  for _, ply in ipairs(player.GetAll()) do
    if ply:GetSubRole() ~= ROLE_AJIN  or not ply:Alive() or ply:IsSpec() then continue end
    if victim:GetTeam() == ply:GetTeam() then
      UnleashAjin(ply)
    end
  end
end)

hook.Add("PlayerSpawn", "AjinSpawned", function(ply)
  if not IsValid(ply) or not ply:Alive() or ply:IsSpec() then return end

  if ply:GetSubRole() == ROLE_AJIN then
    UnleashAjin(ply)
  end
end)

hook.Add("PlayerDisconnected", "AjinDisconnectTeam", function(ply)
  for _, pl in ipairs(player.GetAll()) do
    if pl:GetSubRole() ~= ROLE_AJIN or not pl:Alive() or pl:IsSpec() then continue end
    if pl:GetTeam() == ply:GetTeam() then
      UnleashAjin(pl)
    end
  end
end)

hook.Add("TTT2SpecialRoleSyncing", "TTT2RoleAjinHide", function(ply, tbl)
  if GetConVar("ttt2_ajin_know_role"):GetBool() then return end

  for ajin in pairs(tbl) do
    if ajin:GetSubRole() == ROLE_AJIN and not ajin:GetNWBool("AjinTransformed") then
      if ply == ajin then
        tbl[ajin] = {ROLE_TRAITOR, TEAM_TRAITOR}
      else
        tbl[ajin] = {ROLE_NONE, TEAM_NONE}
      end
    end
  end
end)

hook.Add("TTTonCorpseCreated", "ModifyAjinRag", function(rag, ply)
  if not IsValid(ply) or not IsValid(rag) or ply:GetSubRole() ~= ROLE_AJIN or ply:GetNWBool("AjinTransformed") then return end

  rag.was_role = ROLE_TRAITOR
  rag.role_color = TRAITOR.ltcolor
end)

hook.Add("TTTEndRound", "ResetAjin", ResetAllAjins)
hook.Add("TTTPrepareRound", "ResetAjin", ResetAllAjins)
hook.Add("TTTBeginRound", "ResetAjin", ResetAllAjins)
