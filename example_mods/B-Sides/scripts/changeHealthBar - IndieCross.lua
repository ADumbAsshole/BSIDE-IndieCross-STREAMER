local healthBarStyle = ''
function onCreatePost()
    if songName == 'burning-in-hell' or songName == 'final-stretch' or songName == 'bad-time-old' or songName == 'Sansational' or songName == 'Whoopee' or songName == 'Bad-Time' then
		healthBarStyle = 'Sans'

		makeLuaSprite('SansHealthBar', 'health_IC/sanshealthbar', 0, 0)
		setObjectCamera('SansHealthBar', 'hud')
		addLuaSprite('SansHealthBar', true)
	
		makeLuaSprite('SansHealthBarP2','',getProperty('healthBar.x'),getProperty('healthBar.y') - 6.6)
		setObjectCamera('SansHealthBarP2','hud')
		makeGraphic('SansHealthBarP2',getProperty('healthBar.width'),getProperty('healthBar.height'),'FF0000')
		addLuaSprite('SansHealthBarP2',true)
		setObjectOrder('SansHealthBarP2',4)
--E001DE is KR, FFFF00 is yellow	
		makeLuaSprite('SansHealthBarP1','',getProperty('healthBar.x'),getProperty('healthBar.y') - 6.6)
		setObjectCamera('SansHealthBarP1','hud')
		makeGraphic('SansHealthBarP1',getProperty('healthBar.width')/2,getProperty('healthBar.height'),'E001DE')
		addLuaSprite('SansHealthBarP1',true)
		setObjectOrder('SansHealthBarP1',5)
	elseif songName == 'despair' or songName == 'nightmare-run' or songName == 'last-reel' or songName == 'terrible-sin' or songName == 'imminent-demise' then
		healthBarStyle = 'Bendy'
		makeLuaSprite('BendyHealthBar', 'health_IC/bendyhealthbar', 0, 0)
		setObjectCamera('BendyHealthBar', 'hud')
		addLuaSprite('BendyHealthBar', true)
	elseif songName == 'Snake-eyes' or songName == 'wallop' or songName == 'technicolor-tussle' or songName == 'rubberhose' or songName == 'knockout' or songName == 'devils-gambit' or songName == 'satanic-funkin' or songName == 'devils-gambit-old' or songName == 'snake-eyes-old' then
	    healthBarStyle = 'Cuphead'
		makeLuaSprite('CupheadHealthBar', 'health_IC/cuphealthbar', 0, 0)
		setObjectCamera('CupheadHealthBar', 'hud')
		addLuaSprite('CupheadHealthBar', true)
	end
end

function onUpdate()
	if healthBarStyle == 'Sans' then
		
		setProperty('SansHealthBar.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))



		setProperty('SansHealthBar.x', getProperty('healthBar.x') - 55)
		setProperty('SansHealthBar.y', getProperty('healthBar.y') - 6)

		setProperty('SansHealthBarP1.x',getProperty('healthBar.x'))
		setProperty('SansHealthBarP1.y',getProperty('healthBar.y') - 6.6)
		
		setProperty('SansHealthBarP2.x',getProperty('healthBar.x'))
		setProperty('SansHealthBarP2.y',getProperty('healthBar.y') - 6.6)
	
		
	
		setProperty('SansHealthBar.angle', getProperty('healthBar.angle'))
	
		setObjectOrder('SansHealthBar', 4)

		if getProperty('health') <= 2 then
			scaleObject('SansHealthBarP1',getProperty('health'),getProperty('healthBar.scale.y'))
			scaleObject('SansHealthBarP2',getProperty('healthBar.scale.x'),getProperty('healthBar.scale.y'))
		end
	   
		   setProperty('SansHealthBarP2.width',getProperty('healthBar.width'))
		   setProperty('SansHealthBarP2.height',getProperty('healthBar.height'))
	   
		   setProperty('iconP1.alpha', 0)
		   setProperty('iconP2.alpha', 0)
		   setProperty('healthBar.flipX', true)

	elseif healthBarStyle == 'Bendy' then
	    setProperty('BendyHealthBar.alpha',getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))

		setProperty('BendyHealthBar.x', getProperty('healthBar.x') - 50)

		setProperty('BendyHealthBar.y', getProperty('healthBar.y') - 87)
		setObjectOrder('BendyHealthBar', 4)

    elseif healthBarStyle == 'Cuphead' then
		setProperty('CupheadHealthBar.alpha',getProperty('healthBar.alpha'))

		setProperty('CupheadHealthBar.x', getProperty('healthBar.x') - 25)

		setProperty('CupheadHealthBar.y', getProperty('healthBar.y') - 18)

		setObjectOrder('CupheadHealthBar',4)
	end

	if healthBarStyle ~= '' then

		setProperty('healthBarBG.visible', false)
		setProperty('healthBar.scale.y', 2.2)
		setObjectOrder('healthBar', 3)
		setObjectOrder('healthBarBG', 2)
	end
end