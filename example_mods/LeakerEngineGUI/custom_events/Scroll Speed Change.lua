function onEvent(name, value1, value2)
    if name == "Scroll Speed Change" then
        setProperty('songSpeed', value1)
    end
end
