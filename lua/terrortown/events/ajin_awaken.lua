if CLIENT then
    EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_ajin.vmt")
    EVENT.title = "title_event_ajin_awaken"
    -- EVENT.description = "desc_event_ajin_awaken"

    function EVENT:GetText()
        return {
            {
                string = "desc_event_ajin_awaken",
                params = {
                    player = self.event.ajin.nick,
                },
                translateParams = false
            }
        }
    end
end

if SERVER then
    function EVENT:Trigger(ajin)
        self:AddAffectedPlayers(
            {ajin:SteamID64()},
            {ajin:Nick()}
        )

        return self:Add({
            ajin = {
                nick = ajin:Nick(),
                sid64 = ajin:SteamID64()
            }
        })
    end

    function EVENT:CalculateScore()
        self:SetPlayerScore(self.event.ajin.sid64, {
            score = 1
        })
    end

    function EVENT:Serialize()
        return self.event.ajin.nick .. " has awakened as an Ajin"
    end
end