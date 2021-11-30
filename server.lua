for i, v in ipairs(Config.Teleports) do
    addCommandHandler( Config.Teleports[i][2], function(thePlayer, cmd)
        triggerClientEvent(thePlayer, "Notify", thePlayer, "verde", Config.Teleports[i][6])
        setElementPosition(thePlayer, Config.Teleports[i][3], Config.Teleports[i][4], Config.Teleports[i][5] )
            if Config.Teleports[i][10] == true then
                setElementData(thePlayer, "Local", Config.Teleports[i][1])
                setElementData(thePlayer, "Immortal", true)
                addEventHandler ( "onPlayerDamage", thePlayer, function()
                        
                    if getElementData(thePlayer, "Immortal", true ) then 
                        cancelEvent()
                    else
                        return
                        end

                        setTimer(function() setElementData( thePlayer, "Immortal", false ) end, 2500, 1)

                    end)
                addEventHandler( "onPlayerWasted", thePlayer,
                function()
                    local element_spawn = getElementData(thePlayer, "Local" ) or false 
                    if element_spawn == Config.Teleports[i][1] then
                    setTimer( function() spawnPlayer(thePlayer, Config.Teleports[i][3], Config.Teleports[i][4], Config.Teleports[i][5] ) end, 2500, 1)
                end
            end)                    
        end
    end) 
end


for i, v in ipairs(Config.Weapons) do
    addCommandHandler( Config.Weapons[i][2], function(thePlayer, cmd)
        local logged = getElementData(thePlayer, "status") or nil
        
        if logged == "logged" then

            giveWeapon(thePlayer, Config.Weapons[i][3], Config.Weapons[i][4] )
            triggerClientEvent(thePlayer, "Notify", thePlayer, "verde", "Você pegou uma "..Config.Weapons[i][1].." com 100 munições")
        else
            triggerClientEvent(thePlayer, "Notify", thePlayer, "verde", "Player que não estão logados não podem se teletransportar, e detalhe, se você esta lendo essa mensagem, reporte para a equipe de desnvolvimento no discord.")
        end
    end) 
end


for i, v in ipairs(Config.Commands) do
    addCommandHandler( Config.Commands[i][2], Config.Commands[i][3])
end
