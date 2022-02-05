L = LANG.GetLanguageTableReference("ru")

-- GENERAL ROLE LANGUAGE STRINGS
L[AJIN.name] = "Нелюдь"
L["info_popup_" .. AJIN.name] = [[Вы - Нелюдь! Сотрудничайте с предателями, чтобы победить!]]
L["body_found_" .. AJIN.abbr] = "Он был Нелюдем!"
L["search_role_" .. AJIN.abbr] = "Этот человек был Нелюдем!"
L["target_" .. AJIN.name] = "Нелюдь"
L["ttt2_desc_" .. AJIN.name] = [[Нелюдь - роль предателя и он работает с предателями для победы.
Если Нелюдь остаётся последним, то становятся быстрее и сильнее!]]

-- EPOP LANGUAGE STRINGS

L["ttt2_ajin_transform_title"] = "Нелюдь появился!"
L["ttt2_ajin_transform_body"] = "Будьте осторожны!"
L["ttt2_ajin_self_transform_body"] = "Вы - Нелюдь! Ваши силы высвободились!"
L["ttt2_ajin_multi"] = "Урон x{multi}"


-- EVENT STRINGS
L["title_event_ajin_awaken"] = "Нелюдь пробудился"
L["desc_event_ajin_awaken"] = "{player} превратился в Нелюдя!"
L["tooltip_ajin_awaken_score"] = "Стал Нелюдем: {score}"
L["ajin_awaken_score"] = "Стал Нелюдем:"