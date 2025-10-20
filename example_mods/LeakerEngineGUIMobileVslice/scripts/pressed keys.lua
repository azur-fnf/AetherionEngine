-- Script Psych Engine
-- Mantém as flechas do jogador pressionadas enquanto houver notas (normais ou sustains)
-- Corrige cores (RGB) no BotPlay

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if getPropertyFromGroup('notes', id, 'mustPress') then
        -- Força animação pressed
--        setPropertyFromGroup('playerStrums', noteData, 'animation.curAnim.name', 'pressed')

        -- Copia a cor da nota para a strum (mantém RGB no BotPlay)
        local r = getPropertyFromGroup('notes', id, 'rgbShader.r')
        local g = getPropertyFromGroup('notes', id, 'rgbShader.g')
        local b = getPropertyFromGroup('notes', id, 'rgbShader.b')
        setPropertyFromGroup('playerStrums', noteData, 'rgbShader.r', r)
        setPropertyFromGroup('playerStrums', noteData, 'rgbShader.g', g)
        setPropertyFromGroup('playerStrums', noteData, 'rgbShader.b', b)

        -- Marca tempo da nota (pra manter pressionada um pouco)
        setProperty('noteHoldTimer'..noteData, getPropertyFromClass('Conductor', 'crochet') / 1000)
    end
end

function onCreatePost()
    -- Inicializa timers das 4 direções
    for i = 0, 3 do
        setProperty('noteHoldTimer'..i, 0)
    end
end

function onUpdate(elapsed)
    local songPos = getPropertyFromClass('Conductor', 'songPosition')

    for i = 0, 3 do
        local keyName = ({'left', 'down', 'up', 'right'})[i + 1]
        local pressed = keyPressed(keyName)
        local holdingSustain = false

        -- Decrementa temporizador de nota normal
        if getProperty('noteHoldTimer'..i) > 0 then
            setProperty('noteHoldTimer'..i, getProperty('noteHoldTimer'..i) - elapsed)
            pressed = true
        end

        -- Verifica sustains ativos
        for n = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', n, 'mustPress') 
            and getPropertyFromGroup('notes', n, 'noteData') == i then
                local sustain = getPropertyFromGroup('notes', n, 'isSustainNote')
                local strumTime = getPropertyFromGroup('notes', n, 'strumTime')
                if sustain and math.abs(songPos - strumTime) < 150 then
                    holdingSustain = true
                    break
                end
            end
        end

        -- Aplica animação
        if pressed or holdingSustain then
            setPropertyFromGroup('playerStrums', i, 'animation.curAnim.name', 'pressed')
        else
            setPropertyFromGroup('playerStrums', i, 'animation.curAnim.name', 'static')
        end
    end
end
