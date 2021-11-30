--[[
#######  #     #  ######     ###              #####     ####   ######    #####   ######   #######   #####
#        #     #  #     #   #   #            #     #   #    #  #     #     #     #     #     #     #     #
#        #     #  #     #  #     #           #        #        #     #     #     #     #     #     #
#####    #     #  ######   #     #            #####   #        ######      #     ######      #      #####
#        #     #  #   #    #     #                 #  #        #   #       #     #           #           #
#        #     #  #    #    #   #            #     #   #    #  #    #      #     #           #     #     #
#######   #####   #     #    ###              #####     ####   #     #   #####   #           #      #####
]]--

function isPedDrivingVehicle(ped)
    assert(isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player"), "Bad argument @ isPedDrivingVehicle [ped/player expected, got " .. tostring(ped) .. "]")
    local isDriving = isPedInVehicle(ped) and getVehicleOccupant(getPedOccupiedVehicle(ped)) == ped
    return isDriving, isDriving and getPedOccupiedVehicle(ped) or nil
end


Config = {
    Teleports = { 
        [1] = {"Lobby", "lobby", 1181.5146484375,-1324.0905761719,13.58379650116, "Você foi teleportado para o lobby.", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn, fuzil, armas
        [2] = {"Loja 01", "loja1", 1313.0408935547,-935.4755859375,38.255577087402, "Você foi teleportado para a loja 1. ", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
        [3] = {"Ammunation 01", "ammu1", 2384.2463378906,-1971.1379394531,13.382837295532, "Você foi teleportado para a Ammunation. ", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
        [4] = {"Ammunation 02", "ammu2", 2537.7153320312,2045.2351074219,10.815614700317, "Você foi teleportado para a Ammunation. ", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
        [5] = {"Navio Ponta 1", "navio1", -2308.7834472656,1544.5867919922,18.7734375, "Você foi teleportado para o navio.", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
        [6] = {"Navio Ponta 2", "navio2", -2471.9772949219,1546.6630859375,23.6484375, "Você foi teleportado para a Ammunation.", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
    };

    

    Weapons = { 
        [1] = {"Pistola", "pt", 23, 100}; -- NOME, Comando, ID, Quantidade de munição;
        [2] = {"M4", "m4", 31, 100}; -- NOME, Comando, ID, Quantidade de munição;
    };

    Commands = { 
        [1] = {"Take Weapons", "tkw", function(thePlayer)

            takeAllWeapons(thePlayer)

            end};

        [2] = {"Kill", "kill", function(thePlayer)

                killPlayer(thePlayer)
    
            end};


        [3] = {"Armas", "arma", function(thePlayer,cmd, arma, ammo)
            local admin = getElementData(thePlayer, "player").Admin
            if admin == "true" then
                if arma and tonumber(ammo) then
                    local weapon = getWeaponIDFromName ( arma )  
                    if weapon then
                    giveWeapon(thePlayer, weapon, tonumber(ammo))
                    end
                else
                    local weapon = getWeaponIDFromName ( arma )  
                    if weapon then
                    giveWeapon(thePlayer, weapon, 100)
                    end
                end
             end
        end};

        [4] = {"Tunnig", "tunning", function(thePlayer, cmd, value)

            local admin = getElementData(thePlayer, "player").Admin
            local driving, vehicle = isPedDrivingVehicle ( thePlayer )
            if admin == "true" then
                addVehicleUpgrade(vehicle, "all")
            end
        end};

        [5] = {"Slap", "slap2", function(thePlayer, cmd, value)

            local admin = getElementData(thePlayer, "player").Admin

            setElementHealth(thePlayer, getElementHealth(thePlayer) - tonumber(value) )

        end};


        [6] = {"Money", "money", function(thePlayer, cmd, value)

            local admin = getElementData(thePlayer, "player").Admin

            if admin == "true" and tonumber(value) then 
                givePlayerMoney(thePlayer, tonumber(value))
            end
        end};

    };
}