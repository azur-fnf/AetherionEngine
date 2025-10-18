-- Cambiar tamaño de las notas del jugador (NO las flechas)

local noteScale = 0.8 -- tamaño (1 = normal, 0.5 = más pequeño, 1.5 = más grande)

function onCreatePost()
    -- Ajustar notas que aún no han salido
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then
            setPropertyFromGroup('unspawnNotes', i, 'scale.x', noteScale)
            setPropertyFromGroup('unspawnNotes', i, 'scale.y', noteScale)
        end
    end
end

function onUpdatePost(elapsed)
    -- Ajustar notas que ya están en pantalla
    for i = 0, getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', i, 'mustPress') == true then
            setPropertyFromGroup('notes', i, 'scale.x', noteScale)
            setPropertyFromGroup('notes', i, 'scale.y', noteScale)
        end
    end
end
