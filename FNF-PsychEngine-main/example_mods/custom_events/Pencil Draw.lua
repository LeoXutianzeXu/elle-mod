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
			motionconstant = 150;
		else
			exiting = true;
			candraw = false;
			entering = false;
			motionconstant = 1;
		end
		
	end
end

function onCreate()
	makeAnimatedLuaSprite('pencil', 'characters/PencilDraw', 750, -1200);
	addAnimationByPrefix('pencil', 'idle', 'Pencil Draw', 24, false);
	objectPlayAnimation('pencil', 'idle');
	addLuaSprite('pencil', true); 
	setScrollFactor('pencil', 0.0, 0.0);
end

function onStepHit()
	-- triggered 16 times per section, smooth entrance or exit of pencil
	if (entering) then
		setProperty('pencil.y', getProperty('pencil.y') + motionconstant);
		motionconstant = motionconstant - 5;

		if (getProperty('pencil.y') >= 300) then
			setProperty('pencil.y', 300);
			entering = false;
			candraw = true;
		end
	end

	if (exiting) then
		setProperty('pencil.y', getProperty('pencil.y') - motionconstant);
		motionconstant = motionconstant + 5;

		if (getProperty('pencil.y') <= -1200) then
			setProperty('pencil.y', -1200);
			exiting = false;
		end
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if (curBeat % 2 == 0 and candraw) then
		objectPlayAnimation('pencil', 'idle');
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		objectPlayAnimation('pencil', 'idle');
	end
end