-- THIS SCRIPT USES PSYCH ENGINE 0.6.1 AND LATER ONLY
-- author: TheLeerName (adapted)
function onCreatePost()
    addHaxeLibrary('FlxTrail', 'flixel.addons.effects')

    -- cria trails
    runHaxeCode('dadtrail = new FlxTrail(game.dad, null, 3, 6, 0.3, 0.002)')
    runHaxeCode('game.addBehindDad(dadtrail)')

    runHaxeCode('bftrail = new FlxTrail(game.boyfriend, null, 3, 6, 0.3, 0.002)')
    runHaxeCode('game.addBehindBF(bftrail)')

    runHaxeCode('gftrail = new FlxTrail(game.gf, null, 3, 6, 0.3, 0.002)')
    runHaxeCode('game.addBehindGF(gftrail)')

    -- inicia invisível
    runHaxeCode('dadtrail.visible = false')
    runHaxeCode('bftrail.visible = false')
    runHaxeCode('gftrail.visible = false')
end

-- controla visibilidade nas sections
function onSectionHit()
    local s = curSection -- pega a section atual
    -- ativa trails nas sections desejadas
    if (s >= 19 and s <= 28) or (s >= 31 and s <= 55) then
        runHaxeCode('dadtrail.visible = true')
        runHaxeCode('bftrail.visible = true')
        runHaxeCode('gftrail.visible = true')
    else
        runHaxeCode('dadtrail.visible = false')
        runHaxeCode('bftrail.visible = false')
        runHaxeCode('gftrail.visible = false')
    end
end
