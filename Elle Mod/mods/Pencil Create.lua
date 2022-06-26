-- Lua stuff
function onCreate()
	-- triggered when the lua file is started

	-- create a lua sprite
	makeAnimatedLuaSprite('pencil', 'characters/DADDY_DEAREST', -100, 100);
	addAnimationByPrefix('pencil', 'first', 'Dad idle dance', 24, false);
	objectPlayAnimation('pencil', 'first');
	addLuaSprite('pencil', false); -- false = add behind characters, true = add over characters
end

-- Gameplay interactions
function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('pencil', 'first');
	end
end

function onStepHit()
	-- triggered 16 times per section
	setProperty('pencil.scale.x', getProperty('pencil.scale.x') + 0.01);
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