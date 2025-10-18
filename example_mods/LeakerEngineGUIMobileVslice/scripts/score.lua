-- Script para mostrar el score con comas (separadores de miles)

function onUpdatePost()
    local score = getProperty('songScore')
 setHealthBarColors('red', 'lime')
    setTextString('scoreTxt', "Score: " .. formatNumber(score))

		setProperty('timeBarBG.visible', true)
		setProperty('timeBar.visible', false)
		setProperty('timeTxt.visible', false)


if downscroll then
setProperty('scoreTxt.x', 160)
setProperty('scoreTxt.y', 110)
end

if not downscroll then
setProperty('scoreTxt.x', 160)
setProperty('scoreTxt.y', 675)
end

end

-- Función para formatear con comas
function formatNumber(n)
    local formatted = tostring(n)
    local k
    while true do
        formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end
