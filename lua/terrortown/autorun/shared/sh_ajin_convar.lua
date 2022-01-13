CreateConVar("ttt2_ajin_maxhealth", "150", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Unleashed Ajin's max health")
CreateConVar("ttt2_ajin_armor", "30", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Unleashed Ajin's armor")
CreateConVar("ttt2_ajin_health_regen", "2", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Ajin's health regen")
CreateConVar("ttt2_ajin_regen_rate", "0.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Rate at which the Ajin regens health")
CreateConVar("ttt2_ajin_health_delay", "5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Delay before the Ajin begins to heal")
CreateConVar("ttt2_ajin_speed", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Ajin's speed multiplier")
CreateConVar("ttt2_ajin_stamina", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Ajin's stamina multiplier")
CreateConVar("ttt2_ajin_dmg", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Ajin's damage multiplier")
CreateConVar("ttt2_ajin_know_role", "0", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Should Ajin know their role?")

if CLIENT then
  hook.Add("TTT2FinishedLoading", "mes_devicon", function() -- addon developer emblem for me ^_^
    AddTTT2AddonDev("76561198049910438")
  end)
end

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_ajin_convars", function(tbl)
  tbl[ROLE_AJIN] = tbl[ROLE_AJIN] or {}

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_know_role",
    checkbox = true,
    desc = "ttt2_ajin_know_role (def. 0)"
  })

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_maxhealth",
    slider = true,
    min = 100,
    max = 300,
    desc = "ttt2_ajin_maxhealth (def. 150)"
  })

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_armor",
    slider = true,
    min = 0,
    max = 100,
    desc = "ttt2_ajin_armor (def. 30)"
  })

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_health_regen",
    slider = true,
    min = 0,
    max = 25,
    desc = "ttt2_ajin_health_regen (def. 2)"
  })

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_regen_rate",
    slider = true,
    min = 0,
    max = 5,
    decimal = 1,
    desc = "ttt2_ajin_regen_rate (def. 0.5)"
  })

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_health_delay",
    slider = true,
    min = 0,
    max = 60,
    desc = "ttt2_ajin_health_delay (def. 5)"
  })

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_speed",
    slider = true,
    min = 1,
    max = 5,
    desc = "ttt2_ajin_speed (def. 1.5)"
  })

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_stamina",
    slider = true,
    min = 0,
    max = 5,
    decimal = 1,
    desc = "ttt2_ajin_stamina (def. 1.5)"
  })

  table.insert(tbl[ROLE_AJIN], {
    cvar = "ttt2_ajin_dmg",
    slider = true,
    min = 0,
    max = 5,
    decimal = 1,
    desc = "ttt2_ajin_dmg (def. 1.5)"
  })
end)
