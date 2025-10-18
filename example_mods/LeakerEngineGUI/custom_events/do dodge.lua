-- dodge.lua
-- Custom Event: "DODGE"
-- Usage (Haxe): triggerEvent('DODGE','player','0.7')
-- (target = "player" or "opponent", duration in seconds)

local dodgeDuration = 0.6
local dodgeCooldown = 0.4

local isDodging = false
local canDodge = true
local dodgeTimer = 0
local dodgeTarget = "player" -- 'player' or 'opponent'
local storedHealth = 0

-- helper: get property path for target
local function charPrefix(target)
    if target == "opponent" or target == "dad" then
        return "dad"
    else
        return "boyfriend"
    end
end

function onCreatePost()
    -- preload sound/anim if you want
    -- make sure your characters have an animation named "dodge"
    -- if you want a custom sound, put it in mods/sounds/ and call playSound('dodgeSound', 1)
end

function onEvent(name, value1, value2)
    if name == "do dodge" then
        if not canDodge then return end

        local target = tostring(value1 or "player")
        local dur = tonumber(value2) or dodgeDuration

        -- start dodge
        startDodge(target, dur)
    end
end

function startDodge(target, dur)
    if not canDodge then return end

    dodgeTarget = (target == "opponent" and "opponent") or "player"
    isDodging = true
    canDodge = false
    dodgeTimer = dur

    -- store current health to restore while dodging (prevents damage)
    storedHealth = getProperty("health")

    local prefix = charPrefix(dodgeTarget)

    -- play dodge animation if available
    if hasProperty(prefix .. ".animation") then
        -- try to play animation called "dodge"; the third parameter true forces it
        -- some characters may require a different flag; adjust if needed
        runHaxeCode(string.format([[
            if (game.getCharacter('%s') != null) {
                var char = game.getCharacter('%s');
                if (char.anim.hasAnim('dodge')) {
                    char.playAnim('dodge', true);
                }
            }
        ]], prefix, prefix))
    end

    -- flash text "DODGED"
    runHaxeCode(string.format([[
        var txt = new FlxText(0, 40, FlxG.width, 'DODGED!');
        txt.setFormat(null, 32, FlxColor.WHITE, 'center');
        game.addFront(txt);
        FlxTween.tween(txt, {alpha: 0}, %f, {ease: FlxEase.circOut, onComplete: function() { txt.kill(); }});
    ]], math.min(0.8, dur)))

    -- optional: play sound, uncomment if you have a dodge sound
    -- playSound('dodgeSound', 1)

    -- set a timer for cooldown (we handle in onUpdate)
end

function onUpdate(elapsed)
    -- update dodge timer
    if isDodging then
        dodgeTimer = dodgeTimer - elapsed
        -- while dodging, keep health not decreasing by restoring storedHealth
        -- (this counters the engine's damage that may have occurred)
        if getProperty("health") < storedHealth then
            setProperty("health", storedHealth)
        else
            -- keep storedHealth updated to not accidentally heal during dodge
            storedHealth = getProperty("health")
        end

        if dodgeTimer <= 0 then
            endDodge()
        end
    else
        -- cooldown handling: tiny delay after dodge to prevent instant re-dodge
        if not canDodge then
            dodgeCooldown = dodgeCooldown - elapsed
            if dodgeCooldown <= 0 then
                canDodge = true
                -- reset cooldown to default for next time
                dodgeCooldown = 0.4
            end
        end
    end
end

function endDodge()
    isDodging = false
    -- slight visual/animation reset: try to return to idle
    local prefix = charPrefix(dodgeTarget)
    runHaxeCode(string.format([[
        if (game.getCharacter('%s') != null) {
            var char = game.getCharacter('%s');
            // try to play idle; depends on character implementation
            if (char.anim.hasAnim('idle')) {
                char.playAnim('idle', true);
            }
        }
    ]], prefix, prefix))
end

-- prevent damage in opponentNoteHit by restoring health there immediately too
-- opponentNoteHit is called when an opponent note "hits" the player (i.e., player takes damage)
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if isDodging and dodgeTarget == "player" then
        -- restore health (prevents damage)
        setProperty("health", storedHealth)
        -- optional: spawn small particle or play sound to indicate dodge
        runHaxeCode([[
            game.camFlash(0xff00ff00, 0.12);
        ]])
    end
end

-- if you want player dodging to also avoid missing/penalty on goodNoteHit, handle accordingly:
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if isDodging and dodgeTarget == "opponent" then
        -- opponent was dodging player's notes; cancel score/points or show 'miss' effect if desired
        -- This block depends on how you want opponent dodge to behave; left mostly empty.
    end
end
