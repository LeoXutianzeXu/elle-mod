function onEvent(name, value1, value2)
	if name == 'Trigger BG Ghouls' then
		setProperty('health', math.random(0.01, 0.20));
	end
end