function onCreate()
	makeLuaSprite('artroom', 'artroom', -600, -300);
	setScrollFactor('artroom', 0.9, 0.9);
	
	addLuaSprite('artroom', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end