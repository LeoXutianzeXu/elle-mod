function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pencil Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PENCILNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.5);
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	playSound('pencildraw', 1.0);
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, Pencil: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Pencil Note' then
		number = math.random(1,4);
		if number == 1 then
			playSound('Hit1', 0.25);
		elseif number == 2 then
			playSound('Hit2', 0.25);
		elseif number == 3 then
			playSound('Hit3', 0.25);
		elseif number == 4 then
			playSound('Hit5', 0.25);
		end
		-- put something here if you want
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Pencil Note' then
	end
end