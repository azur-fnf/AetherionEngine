function onUpdateScore(miss)
if miss then
       health = getProperty('health')
       setProperty('health', health- 0.02);
end
end