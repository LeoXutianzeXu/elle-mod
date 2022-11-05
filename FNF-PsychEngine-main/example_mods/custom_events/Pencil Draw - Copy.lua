--Global varibles for pencil entering and exiting animation
entering = false;
exiting = false;
candraw = false;
motionconstant = 1;

function onEvent(name, value1, value2)
	if name == 'Pencil Draw' then
		if value1 == "true" then -- let sprite enter screen 
			entering = true;
			exiting = false;
			motionconstant = 200;
			setProperty('pencil.y', -1200);
		else
			exiting = true;
			candraw = false;
			entering = false;
			motionconstant = 10;
		end
		
	end
end

function onCreate()
	makeAnimatedLuaSprite('pencil', 'characters/PencilDraw', 750, 1000);
	addAnimationByPrefix('pencil', 'idle', 'Pencil Draw', 24, false);
	addLuaSprite('pencil', true); 
	setScrollFactor('pencil', 0.0, 0.0);
end

function onStepHit()
	-- triggered 16 times per section, smooth entrance or exit of pencil
	if (entering) then
		setProperty('pencil.y', getProperty('pencil.y') + motionconstant);
		motionconstant = motionconstant * (19/20);

		if (getProperty('pencil.y') >= 300) then
			setProperty('pencil.y', 300);
			entering = false;
			candraw = true;
			objectPlayAnimation('pencil', 'idle', true);
		end
	end

	if (exiting) then
		setProperty('pencil.y', getProperty('pencil.y') + motionconstant);
		motionconstant = motionconstant * (2);

		if (getProperty('pencil.y') >= 1000) then
			setProperty('pencil.y', 1000);
			exiting = false;
		end
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if (curBeat % 3 == 0 and candraw) then
		objectPlayAnimation('pencil', 'idle', true);
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
end