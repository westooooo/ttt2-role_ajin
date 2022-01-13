net.Receive("ttt2_ajin_transform", function()
  local client = LocalPlayer()
  if client:GetSubRole() ~= ROLE_AJIN then
    EPOP:AddMessage(
      {text = LANG.TryTranslation("ttt2_ajin_transform_title"),
        color = AJIN.ltcolor},
      LANG.TryTranslation("ttt2_ajin_transform_body"),
      6
    )
  elseif client:Alive() then
    EPOP:AddMessage(
      {text = LANG.TryTranslation("ttt2_ajin_transform_title"),
        color = AJIN.ltcolor},
      LANG.TryTranslation("ttt2_ajin_self_transform_body"),
      6
    )
  end
end)


hook.Add("TTTRenderEntityInfo", "ttt2_ajin_multiplier", function(tData)
  if not AJIN then return end

  local ent = tData:GetEntity()

  if not ent:IsPlayer() then return end

  local client = LocalPlayer()

  if client:GetSubRole() ~= ROLE_AJIN or not client:GetNWBool("AjinTransformed") then return end

  local multiplier = math.Round(GetConVar("ttt2_ajin_dmg"):GetFloat(), 1)

  if multiplier <= 1 then return end

  if tData:GetAmountDescriptionLines() > 0 then
    tData:AddDescriptionLine()
  end

  tData:AddDescriptionLine(
    LANG.GetParamTranslation("ttt2_ajin_multi", {multi = multiplier}),
    AJIN.ltcolor
  )
end)
