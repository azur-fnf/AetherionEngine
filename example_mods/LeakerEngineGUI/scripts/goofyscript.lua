-- Variáveis para os textos
local bfText, oppText

function onCreatePost()
    -- Aumenta a barra de vida visualmente
    setProperty('healthBar.scale.x', 1.5)
    setProperty('healthBarBG.scale.x', 1.5)

    -- Cria textos acima dos ícones
    bfText = makeLuaText('bfText', '50%', 100, getProperty('iconP1.x'), getProperty('iconP1.y') - 50)
    setTextSize(bfText, 20)
    setObjectCamera(bfText, 'hud')
    addLuaText(bfText)

    oppText = makeLuaText('oppText', '50%', 100, getProperty('iconP2.x'), getProperty('iconP2.y') - 50)
    setTextSize(oppText, 20)
    setObjectCamera(oppText, 'hud')
    addLuaText(oppText)
end

function onUpdatePost()
    -- Ajusta posição dos ícones
    setProperty('iconP1.x', screenWidth - 250)
    setProperty('iconP2.x', 120)

    -- Ajusta posição dos textos acima dos ícones
    if downscroll then
        setProperty('bfText.x', getProperty('iconP1.x'))
        setProperty('bfText.y', getProperty('iconP1.y') - 30)
        setProperty('oppText.x', getProperty('iconP2.x'))
        setProperty('oppText.y', getProperty('iconP2.y') - 30)
    else
        setProperty('bfText.x', getProperty('iconP1.x'))
        setProperty('bfText.y', getProperty('iconP1.y') + 30)
        setProperty('oppText.x', getProperty('iconP2.x'))
        setProperty('oppText.y', getProperty('iconP2.y') + 30)
    end

    -- Atualiza a porcentagem de vida
    local health = getProperty('health')
    local bfPercent = math.floor(health * 100)
    local oppPercent = math.floor((1 - health) * 100)
    setTextString(bfText, bfPercent .. '%')
    setTextString(oppText, oppPercent .. '%')
end

-- Reduz o dano que o jogador recebe




-- Função que roda a cada beat
function onBeatHit()
    -- Rotação aleatória para ícones (-45 ou 45)
    local bfRotation = (math.random(0,1) == 0 and -35 or 35)
    local oppRotation = (math.random(0,1) == 0 and -35 or 35)

    -- Aplica a rotação
    setProperty('iconP1.angle', bfRotation)
    setProperty('iconP2.angle', oppRotation)

    -- Volta ao normal suavemente em 0.2 segundos
    doTweenAngle('bfRotate', 'iconP1', 0, 0.2, 'sineOut')
    doTweenAngle('oppRotate', 'iconP2', 0, 0.2, 'sineOut')
end
