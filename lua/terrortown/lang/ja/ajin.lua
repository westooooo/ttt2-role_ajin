L = LANG.GetLanguageTableReference("ja")

-- GENERAL ROLE LANGUAGE STRINGS
L[AJIN.name] = "Ajin"
L["info_popup_" .. AJIN.name] = [[あなたはAjinです！仲間のTraitor達と協力して勝利しよう！]]
L["body_found_" .. AJIN.abbr] = "奴はAjinだったな！"
L["search_role_" .. AJIN.abbr] = "こいつはAjinだったようだな！"
L["target_" .. AJIN.name] = "Ajin"
L["ttt2_desc_" .. AJIN.name] = [[AjinはTraitor陣営。仲間のTraitor達と協力し、他陣営の全員を殺害すれば勝利。
Traitor陣営の最後の一人になったら、力が覚醒し、全ステータスが上昇！]]

-- EPOP LANGUAGE STRINGS

L["ttt2_ajin_transform_title"] = "Ajinが現れたぞ！"
L["ttt2_ajin_transform_body"] = "戦闘態勢に入るんだ！"
L["ttt2_ajin_self_transform_body"] = "Ajinとしての力が覚醒したぞ！"
L["ttt2_ajin_multi"] = "ダメージ倍率:{multi}倍"


-- EVENT STRINGS
L["title_event_ajin_awaken"] = "Ajin覚醒"
L["desc_event_ajin_awaken"] = "{player}がAjinへと覚醒した！"
L["tooltip_ajin_awaken_score"] = "Ajin覚醒:{score}"
L["ajin_awaken_score"] = "Ajin覚醒:"