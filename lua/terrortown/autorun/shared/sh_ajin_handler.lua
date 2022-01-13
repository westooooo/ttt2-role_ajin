hook.Add("TTTPlayerSpeedModifier", "AjinSpeedBoost", function(ply, _, _, speed_mod)
  if not IsValid(ply) or not ply:Alive() or ply:IsSpec() then return end
  if ply:GetSubRole() ~= ROLE_AJIN or not ply:GetNWBool("AjinTransformed") then return end

  speed_mod[1] = speed_mod[1] * GetConVar("ttt2_ajin_speed"):GetFloat()
end)

hook.Add("TTT2StaminaRegen", "AjinStaminaRegen", function(ply, stamina_mod)
  if not IsValid(ply) or not ply:Alive() or ply:IsSpec() then return end
  if ply:GetSubRole() ~= ROLE_AJIN or not ply:GetNWBool("AjinTransformed") then return end

  stamina_mod[1] = stamina_mod[1] * GetConVar("ttt2_ajin_stamina"):GetFloat()
end)
