function onEvent(name, value1, value2)
    if name == "Flash Black" then
        -- cria sprite preto cobrindo a tela
        makeLuaSprite('flashBlack', '', 0, 0)
        makeGraphic('flashBlack', screenWidth, screenHeight, '000000') -- preto
        setObjectCamera('flashBlack', 'other')
        addLuaSprite('flashBlack', true)

        -- começa totalmente visível
        setProperty('flashBlack.alpha', 1)

        -- fade-out em 0.5s
        doTweenAlpha('flashOutBlack', 'flashBlack', 0, 0.8, 'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'flashOutBlack' then
        removeLuaSprite('flashBlack', false)
    end
end
