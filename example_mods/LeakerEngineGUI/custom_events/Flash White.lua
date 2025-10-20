function onEvent(name, value1, value2)
    if name == "Flash White" then
        -- cria sprite branco cobrindo a tela
        makeLuaSprite('flashWhite', '', 0, 0)
        makeGraphic('flashWhite', screenWidth, screenHeight, 'FFFFFF')
        setObjectCamera('flashWhite', 'other')
        setBlendMode('flashWhite', 'add') -- dá mais intensidade
        addLuaSprite('flashWhite', true)

        -- começa no máximo
        setProperty('flashWhite.alpha', 1)

        -- fade-out em 0.5s
        doTweenAlpha('flashOut', 'flashWhite', 0, 0.8, 'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'flashOut' then
        removeLuaSprite('flashWhite', false)
    end
end
