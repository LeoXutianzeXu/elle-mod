-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Pencil Draw' then

		duration = tonumber(value1);
		enter_duration = tonumber(value2);
		x_position = tonumber(value3);
		y_position = tonumber(value4);
		if duration < 0 then
			duration = 0;
		end
		if enter_duration < 0 then
			enter_duration = 0;
		end
		

		makeAnimatedLuaSprite('pencil', 'characters/PencilDraw', -100, 100);
		addAnimationByPrefix('pencil', 'first', 'BF NOTE DOWN', 24, false);
		objectPlayAnimation('pencil', 'first');
		addLuaSprite('pencil', false); -- false = add behind characters, true = add over characters
		
	
		makeAnimatedLuaSprite('pencil', 'characters/bfPixelsDEAD', -100, 100);
		addAnimationByPrefix('pencil', 'first', 'BF Dies pixel', 24, false);
		objectPlayAnimation('pencil', 'first');
		addLuaSprite('pencil', false); -- false = add behind characters, true = add over characters

		makeAnimatedLuaSprite('pencil', 'characters/momCar', -100, 100);
		addAnimationByPrefix('pencil', 'first', 'MOM DOWN POSE', 24, false);
		objectPlayAnimation('pencil', 'first');
		addLuaSprite('pencil', false); -- false = add behind characters, true = add over characters


		--[[
		makeAnimatedLuaSprite('pencil', 'characters/Pencil Draw', 500, 0);
		addAnimationByPrefix('pencil', 'first', 'pencil', 24, false);
		objectPlayAnimation('pencil', 'first');
		addLuaSprite('pencil', false); -- false = add behind characters, true = add over characters
		]]--
	end
end

function onStepHit()
	-- triggered 16 times per section
	setProperty('pencil.scale.x', getProperty('pencil.scale.x') + 0.01);
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('pencil', 'first');
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		objectPlayAnimation('pencil', 'first');
	end
end