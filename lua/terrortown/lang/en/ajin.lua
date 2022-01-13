L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[AJIN.name] = "Ajin"
L["info_popup_" .. AJIN.name] = [[You are an Ajin! Work with the traitors to win!]]
L["body_found_" .. AJIN.abbr] = "They were an Ajin!"
L["search_role_" .. AJIN.abbr] = "This person was an Ajin!"
L["target_" .. AJIN.name] = "Ajin"
L["ttt2_desc_" .. AJIN.name] = [[The Ajin is a traitor role and works with the traitors to win.
If they are the last one standing, they become faster and stronger!]]

-- EPOP LANGUAGE STRINGS

L["ttt2_ajin_transform_title"] = "The Ajin has appeared!"
L["ttt2_ajin_transform_body"] = "Be careful!"
L["ttt2_ajin_self_transform_body"] = "You are the Ajin! Your powers have been unleashed!"
L["ttt2_ajin_multi"] = "Damage x{multi}"


-- EVENT STRINGS
L["title_event_ajin_awaken"] = "The Ajin Awakened"
L["desc_event_ajin_awaken"] = "{player} transformed into the Ajin!"
L["tooltip_ajin_awaken_score"] = "Became Ajin: {score}"
L["ajin_awaken_score"] = "Became Ajin:"