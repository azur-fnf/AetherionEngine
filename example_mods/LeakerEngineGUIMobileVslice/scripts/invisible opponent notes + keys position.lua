-- Estilo tipo captura: notas del oponente invisibles, jugador normal
-- Funciona en Psych Engine (colocar en mods/scripts/)

function onCreatePost()
    -- Hacer invisibles TODAS las notas del oponente
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
            setPropertyFromGroup('unspawnNotes', i, 'visible', false)
        end
    end

    -- Ajustar tamaño y posición de las strums del jugador y oponente
    for i = 0, 3 do
        -- Oponente (solo flechas estáticas visibles, no notas)
        setPropertyFromGroup('opponentStrums', i, 'visible', true)
        setPropertyFromGroup('opponentStrums', i, 'scale.x', 0.4)
        setPropertyFromGroup('opponentStrums', i, 'scale.y', 0.4)

        setPropertyFromGroup('opponentStrums', i, 'y', 10)

	setPropertyFromGroup('opponentStrums', 0, 'x', 20);
	setPropertyFromGroup('opponentStrums', 1, 'x', 80);
	setPropertyFromGroup('opponentStrums', 2, 'x', 140);
	setPropertyFromGroup('opponentStrums', 3, 'x', 200);

-- player strums!!
if downscroll then
	setPropertyFromGroup('playerStrums', 0, 'x', 290);
	setPropertyFromGroup('playerStrums', 1, 'x', 490);
	setPropertyFromGroup('playerStrums', 2, 'x', 690);
	setPropertyFromGroup('playerStrums', 3, 'x', 890);
end
if not downscroll then
setPropertyFromGroup('playerStrums', 0, 'x', 290);
	setPropertyFromGroup('playerStrums', 1, 'x', 490);
	setPropertyFromGroup('playerStrums', 2, 'x', 690);
	setPropertyFromGroup('playerStrums', 3, 'x', 890);
end

        -- Jugador (flechas + notas normales)
        setPropertyFromGroup('playerStrums', i, 'scale.x', 0.8)
        setPropertyFromGroup('playerStrums', i, 'scale.y', 0.8)

        setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.8)
        setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.8)

    -- Detecta si el stage actual es 'pixel'
    if curStage == 'pixel' then

        setPropertyFromGroup('playerStrums', i, 'scale.x', 3)
        setPropertyFromGroup('playerStrums', i, 'scale.y', 3)

        setPropertyFromGroup('unspawnNotes', i, 'scale.x', 3)
        setPropertyFromGroup('unspawnNotes', i, 'scale.y', 3)

end
    end
end

function onSpawnNote(i)
    -- Si la nota es del oponente, volverla invisible
    if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
        setPropertyFromGroup('unspawnNotes', i, 'visible', false)
    end
end
