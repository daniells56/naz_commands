# naz_commands
Sistema de spawn e comandos pra pvp.

# Lembrando, todos os exemplos abaixo estão no arquivo: Config.lua, já existe uma pré-config, fique á vontade pra mudar.

Outro mod que fiz já faz um tempo, bom, resumindo, é um mod que você consegue fazer varias "arenas", exemplo:

/loja1 (Teleporta pra certa localização)
/loja2 (Teleporta pra certa localização)
/barco1 (Teleporta pra certa localização)
/barco2 (Teleporta pra certa localização)

quando você morre, você volta pra "arena" que tava, também tem um sistema de comandos q fiz p facilitar minha vida de baiano, exemplo:

```lua
    --[[ Lembrando que o sistema já possui alguns comandos, como: /m4, /tkw, /kill, /armas, /tunning, 
    /slap2, /money, alguns desses comandos 
    são para administração, e está vinculado  com o sistema de whitelit. ]]
    Commands = { 
        [1] = {"Take Weapons", "tkw", function(thePlayer) -- {"CommandName", "command", funcao(parametros) código end
        
            takeAllWeapons(thePlayer)

            end};
      }

```


Abaixo vai um exemplo de como adicionar arenas.
```lua

Config = {
    Teleports = {
        -- para adicionar, é só seguir o exemplo abaixo.
        [1] = {"Lobby", "lobby", 1181.5146484375,-1324.0905761719,13.58379650116, "Você foi teleportado para o lobby.", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn, fuzil, armas
        [2] = {"Loja 01", "loja1", 1313.0408935547,-935.4755859375,38.255577087402, "Você foi teleportado para a loja 1. ", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
        [3] = {"Ammunation 01", "ammu1", 2384.2463378906,-1971.1379394531,13.382837295532, "Você foi teleportado para a Ammunation. ", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
        [4] = {"Ammunation 02", "ammu2", 2537.7153320312,2045.2351074219,10.815614700317, "Você foi teleportado para a Ammunation. ", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
        [5] = {"Navio Ponta 1", "navio1", -2308.7834472656,1544.5867919922,18.7734375, "Você foi teleportado para o navio.", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
        [6] = {"Navio Ponta 2", "navio2", -2471.9772949219,1546.6630859375,23.6484375, "Você foi teleportado para a Ammunation.", 255,255,255, true, false, true}; -- Nome, comando, x, y, z, Mensagem, r,g,b, Respawn
    };

```
