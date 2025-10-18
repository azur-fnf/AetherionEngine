-- Script Psych Engine
-- Cambiar tamaño de las notas largas (sustain notes)

local sustainScaleY = 3 -- 1 = normal, >1 más largas, <1 más cortas

function onCreatePost()
    -- Ajustar las notas largas que aún no aparecen
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') == true then
            setPropertyFromGroup('unspawnNotes', i, 'scale.y', sustainScaleY)
            updateHitboxFromGroup('unspawnNotes', i) -- actualizar hitbox para que coincida
        end
    end
end

function onUpdatePost(elapsed)
    -- Ajustar las notas largas que ya están en pantalla
    for i = 0, getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', i, 'isSustainNote') == true then
            setPropertyFromGroup('notes', i, 'scale.y', sustainScaleY)
            updateHitboxFromGroup('notes', i)
        end
    end
end
