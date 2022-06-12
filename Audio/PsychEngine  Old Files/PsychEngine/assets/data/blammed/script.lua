function onEvent(name, value1, value2)
	if name == 'Blammed Lights' then
		setProperty('health', math.random(0.01, 0.05));
	end
end