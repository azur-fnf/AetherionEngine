-- Script Evade Note

local looping = false
local animToLoop = ''
local remainingLoopTime = 0

function onCreate()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Evade' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/EVADE')
            setPropertyFromGroup('unspawnNotes', i, 'hitHealth', 0)
            setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0)

            -- A nota continua nos charts dos dois
            -- Must press = true faz só o jogador apertar
            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false) -- jogador não ignora
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Evade' then
        startLoopAnim('boyfriend', 'dodge', 0.5)

        cameraShake('game', 0.02, 0.15)
        cameraShake('hud', 0.015, 0.12)
        playSound('evadeHit', 0.8)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == 'Evade' then
        startLoopAnim('boyfriend', 'hurt', 0.5)

        setProperty('health', getProperty('health') - 0.6)
        cameraShake('game', 0.08, 0.35)
        cameraShake('hud', 0.05, 0.3)
        playSound('evadeMiss', 1)
    end
end

-- Função chamada a CADA nota que é criada no jogo
-- Função chamada SEMPRE que o oponente acerta uma nota
function opponentNoteHit(id, direction, noteType, isSustainNote)
    
    -- 1. Verifica se a nota que foi acertada é do tipo 'Evade'
    if noteType == 'Evade' then
        
        -- **BLOQUEAR ANIMAÇÃO DO OPOENTE (SING):**
        -- A animação de canto é geralmente controlada pelo código-fonte
        -- Mas a gente usa 'cancelPlayNote' para cancelar o evento de acerto
        -- e *impedir* que a animação padrão de canto ou miss seja acionada.
        
        -- **BLOQUEAR MUDANÇA DE VIDA:**
        -- O 'cancelPlayNote' também impede que o código de acerto padrão
        -- do jogo mude a barra de vida.
        
        -- O return cancelPlayNote é a *chave* para fazer tudo isso de uma vez!
        return cancelPlayNote;
    end
    
    -- Para qualquer outra nota, a função continua normalmente.
end

function startLoopAnim(char, anim, duration)
    looping = true
    animToLoop = anim
    remainingLoopTime = duration
    characterPlayAnim(char, anim, false)
    runTimer('stopLoop', duration)
end

function onUpdate(elapsed)
    if looping then
        remainingLoopTime = remainingLoopTime - elapsed
        if remainingLoopTime <= 0 then
            stopLoopAnim()
        end
    end
end

function onUpdatePost(elapsed)
    if looping and animToLoop ~= '' then
        local curAnim = getProperty('boyfriend.animation.curAnim.name')
        local finished = getProperty('boyfriend.animation.curAnim.finished')

        -- se outra animação (sing, idle, etc) substituir, força de volta
        if curAnim ~= animToLoop then
            characterPlayAnim('boyfriend', animToLoop, false)
        elseif finished then
            -- se terminou naturalmente, reinicia pra manter looping
            characterPlayAnim('boyfriend', animToLoop, false)
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'stopLoop' then
        stopLoopAnim()
    end
end

function stopLoopAnim()
    looping = false
    animToLoop = ''
    remainingLoopTime = 0
    characterPlayAnim('boyfriend', 'idle', true)
end
