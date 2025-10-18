-- Configurações da onda
local waveAmplitude = 1   -- altura máxima da onda (Y)
local waveAmplitudeX = 0  -- deslocamento máximo horizontal (X)
local waveSpeed = 7        -- velocidade da onda

function onUpdate(elapsed)
    local songPos = getSongPosition() / 1000 -- tempo da música em segundos

    -- Notas do jogador
    for i = 0, 3 do
        local originalY = getPropertyFromGroup('playerStrums', i, 'y')
        local originalX = getPropertyFromGroup('playerStrums', i, 'x')
        
        local offsetY = math.sin(songPos * waveSpeed + i) * waveAmplitude
        local offsetX = math.cos(songPos * waveSpeed + i) * waveAmplitudeX
        
        setPropertyFromGroup('playerStrums', i, 'y', originalY + offsetY)
        setPropertyFromGroup('playerStrums', i, 'x', originalX + offsetX)
    end

    -- Notas do inimigo
    for i = 0, 3 do
        local originalY = getPropertyFromGroup('opponentStrums', i, 'y')
        local originalX = getPropertyFromGroup('opponentStrums', i, 'x')
        
        local offsetY = math.sin(songPos * waveSpeed + i) * waveAmplitude
        local offsetX = math.cos(songPos * waveSpeed + i) * waveAmplitudeX
        
        setPropertyFromGroup('opponentStrums', i, 'y', originalY + offsetY)
        setPropertyFromGroup('opponentStrums', i, 'x', originalX + offsetX)
    end
end
