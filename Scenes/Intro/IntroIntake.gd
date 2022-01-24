extends "res://Scenes/SceneBase.gd"

# Heavy work in progress, the text is just to get a feel for how the game is gonna start

func _init():
	sceneID = "IntroIntake"

func _run():
	if(state == ""):
		#GM.world.aimCamera("intro_corridor")
		GM.ui.setLocationName("BDCC")
		
		addCharacter("captain")
		addCharacter("risha")
		
		saynn("You stand in a huge open hangar. Watching the colorful markings on the floor you can guess that it supports up to about 3 ships. Most of the corners are stuffed with metal crates or other types of cargo, all of it locked, behind you is a huge energy field that allows the spaceships to pass but keep the air in. The height of a hanger allows there to be many catwalks on the walls where all the guards stand, watching the fresh blood arrive. Your attention gets stolen by someone’s loud authoritative voice that gets echoed slightly.")

		saynn("[say=captain]Welcome. Welcome to this little paradise.[/say]")
		
		saynn("An officially dressed person slowly approaches you but stops a few meters away, behind him is a heavily-armored guard, single one.")

		saynn("[say=captain]Don’t stand there, the ship is gonna leave soon and you don’t wanna be there, trust me.[/say]")
		
		saynn("You look back at the spaceship, your last way of escape, and sigh. The person is pointing at the floor where there is a long marked line colored yellow. Unsure what else to do, you obey and walk towards it and stop when he gestures again.")
		
		saynn("[say=captain]Stand on the line. Good. You better start learning how to follow orders, a very useful skill.[/say]")
		
		saynn("You take a good look at the people before, the officer is a medium-sized, about 1.7 meters tall, canine with very dark, almost black, fur. He has purple eyes and a short fancy haircut, slowly swishing behind him is a black canine tail. He spots bulky shoes, tight black pants, leather belt with some pouches and a dark blue military jacket with a bright glowing trim to it, everything just screams formal. The only armor he has are the carbon shoulder pads with the same bright trim.")
		
		saynn("Behind the officer is a very tall guard, more than 2 meters tall. You notice her face to be feminine but considering how much heavy armor she is carrying she must be quite strong. Her fur is of a strange dark-cyan color, the face features show that she is some kind of feline, ears have tassels on them and behind her is a very short tail. You notice that she holds a weapon, something that looks like a stun baton.")
		
		saynn("The officer crosses his arms, he is about a meter away so you clearly see the nameplate on his jacket saying “Wright”.")

		addButton("What now", "Ask what happens next", "whatnow")
		
	if(state == "whatnow"):
		saynn("[say=pc]So. You came to take me in?[/say]")
		
		saynn("The officer walks up closer to you and takes a good look, his hand grabs you by the chin and makes you look at him.")

		saynn("[say=captain]State your name first, future inmate[/say]")
		
		addButton("It's "+GM.pc.getName(), "Say your name", "sayname")
		addButton("Shove away", "How dares he", "shoveaway")
		
	if(state == "sayname"):
		saynn("[say=pc]{pc.name}[/say]")
		
		saynn("[say=captain]Alright, inmate. I want you to forget that name as soon as possible. Here, in this prison, you will be given a number that you will be addressed by. Now, follow me, time to process you.[/say]")

		saynn("The officer taps on your shoulder twice and gestures towards the hangar exit")
		
		addButton("Follow", "Follow the officer and his guard", "follow")
		
	if(state == "shoveaway"):
		saynn("You slap his arm away and shove him back. You growl and bare your fangs.")
		
		saynn("[say=pc]Don’t touch me. And I won’t tell you anything[/say]")

		saynn("Officer staggers back but then suddenly pulls out what looks like an energy gun and aims it directly at you, the guard’s stun baton sparks, ready to hit someone.")
		
		saynn("[say=captain]I never said that you had a choice. I can shoot you right now on the spot and no one would even bat an eye. Your body will be spaced and written off as an accident. Is that how you want it?[/say]")
		
		saynn("You instinctively raise your hands, surrendering, the rush of adrenaline has worn off, replaced with fear.")
		
		saynn("[say=pc]Fine, fine. Name is {pc.name}[/say]")
		
		saynn("The officer lowers the gun.")
		
		saynn("[say=captain]See, much better. This kind of behavior is not tolerated here as you will find out. Follow me, time to process you[/say]")
		
		addButton("Follow", "Follow the officer and his guard", "follow")
		
	if(state == "follow"):
		saynn("You follow the officer through some corridor and enter an inmate processing area. You see a little showering area that's divided from the main room with glass and automatic doors. Then there are some kinds of vendomats and, lastly, a small medical area. The floor has useful lines that show the order in which to process the inmate.")
		
		saynn("The officer points at the first area and a bin before it.")
		
		saynn("[say=captain]You're gonna leave all your things and all the clothing in the bin and then go through that.[/say]")
		
		saynn("You tilt your head")
		
		saynn("[say=pc]But. That will leave me naked[/say]")
		
		saynn("The officer nods and offers you a smile. The guard seems to be smirking too")
		
		addButton("Undress", "Do as he says", "undress")
		addButton("Fuck no", "Say that you will never do it. This might not be the best idea", "notundress")
	
	if(state == "undress"):
		saynn("Initial confusion is switched with embarrassment, you immediately blush just from the thought.")
		
		saynn("[say=pc]Fine.. Can you not look at least?[/say]")
		
		saynn("[say=captain]Get used to it[/say]")
		
		saynn("Seeing that there is no other choice, you approach the bin and begin undressing. You expose your chest and then your legs, of course covering yourself when you’re done. The guard in particular seems to be hungirly watching your body but the officer just mostly smirks at your blush. He then points at the airlock")
		
		saynn("[say=captain]Go inside, every inmate needs to be washed[/say]")
		
		addButton("Shower", "Take the refreshing shower", "shower")
		
	if(state == "notundress"):
		saynn("You grit your teeth and show a middle finger to the guy.")
		
		saynn("[say=pc]Fuck no and fuck off, I’m not doing that[/say]")
		
		saynn("The officer sighs and unholsters his energy gun. You, seeing him do that, don’t waste your time and try to punch him but before you can get close, you’re blocked by the tall figure that shoves you away.")
		
		saynn("[say=risha]Hey, captain. Let me have some fun with this one, {pc.he} seems to be too eager. I won’t kill, promise, only break a little[/say]")
		
		saynn("You growl and get into the combat stance")
		
		saynn("[say=captain]Fine, {pc.he} is yours[/say]")
		
		addButton("Fight", "Well, if she really wants it", "fightrisha")
	
	if(state == "losttorisha"):
		saynn("It wasn’t a fair fight at all, the guard had every single advantage. You can’t stand up anymore, the pain is too much. You can only grunt while the guard puts her baton away and cracks her knuckles. The officer crouches near you and forces you to look at him.")

	if(state == "wonrisha"):
		saynn("The guard kneels before you, defeated, her hand drops the baton as she grunts from pain. You quickly pick up the weapon and turn it on.")

		saynn("[say=risha]Fucker, you will pay for that.. ghhh-h[/say]")
		
		saynn("You growl and raise the baton, about to strike. But you notice that the officer is aiming his weapon at you.")
		
		saynn("[say=captain]Drop it[/say]")
		
		saynn("[say=risha]You lost still. Haha..mh..[/say]")
		
		saynn("You are shaking, guards words enrage you even more and as you swing the weapon, suddenly you feel a powerful shock going through you. The officer switched the mode of his gun to the taser and took a shot. Suddenly your every single muscle begins to tense, the pain is unbearable. You cry in agony and collapse to the floor. The officer slowly approaches you, still aiming his gun and kicks the baton away. He then crouches near you.")
	
	if(state == "losttorisha" || state == "wonrisha"):
		saynn("[say=captain]Such a silly person you are. What did you think was gonna happen? Even if you would have won, what would you do? There are no ships here, the only ones that arrive bring new inmates and leave. Are you sure you can beat up every single guard here? You’re stuck here on this rock for the rest of your life. Do you wanna make that life miserable for yourself? Don’t be silly, you just arrived, don’t make me space you[/say]")
		
		saynn("[say=pc]Ugh.. fuck you..[/say]")
		
		saynn("The captain shakes his head and pulls out something from his pouch. It’s a gag, red ballgag.")
		
		saynn("[say=captain]If you’re gonna be a rebel, prepare to be punished like a rebel[/say]")
		
		saynn("He shoves his knee into your chest, causing a painful feeling, before suddenly shoving the ballgag into your mouth and tightening the straps around your head. (( Well, he will when the inventory stuff will be implemented. Pretend that you’re gagged ))")
				
		saynn("He then stands up and gestures the guard")
		
		saynn("[say=captain]Looks like {pc.he} needs some help to get up[/say]")
		
		saynn("The guard obeys and drags you to the bin where she forcibly undresses you and then shoves you into the shower room")
		
		addButton("Shower", "Take the refreshing shower", "shower")

	if(state == "shower"):
		saynn("You step into the shower area that's closed-off with glass. It’s a small room with many shower heads attached to the ceiling. You keep covering yourself as a normal person would while preparing for the worst. And yes, when the shower begins, you feel that the water is freezing cold. It's so cold that you groan audibly.")
		
		saynn("[say=pc]Why is it so cold![/say]")
		
		saynn("[say=risha]Do you think scum like you deserve anything else?[/say]")
		
		saynn("[say=captain]Well, it's a cost saving measure. But. If you prove to be a well behaving inmate. If you prove that you can rehabilitate then maybe you will get to use hot water and other benefits. We’re not monsters here. It all depends on how you act though.[/say]")
		
		saynn("While he explains all that to you, you can’t help but to begin shivering, the cold water runs down your body, washing it. Then it suddenly stops. Instead, some kind of white powder gets dispensed onto you. It sticks and covers you completely. And it stings a lot, causing you to hiss.")
		
		saynn("[say=pc]What is that?![/say]")
		
		saynn("[say=captain]Delousing powder. Gets rid of head lice, fleas, scabies and the like. Just don’t let it get into your eye[/say]")
		
		saynn("After a few seconds, the shower starts again and this time the cold water feels like a much needed breeze.")
		
		saynn("[say=risha]You should rub yourself, hah[/say]")
		
		saynn("[say=pc]Not while you’re watching[/say]")
		
		saynn("[say=risha]I’m capable of way more than just watching, trust me[/say]")
		
		saynn("When all of that is finally over, you get dried with a stream of hot air. Then you walk to the other end of the room where the second airlock is, waiting to be let out.")
		
		saynn("[say=captain]Great. Time to register you[/say]")
		
		addButton("Step out", "Do the registration", "aftershower")
		
	if(state == "aftershower"):
		saynn("You step out back into the intake room and follow the lines on the floor to your next stop. You see a vendomat mounted onto a wall, it’s a machine capable of producing and dispensing different things. Near it on a wall is a console. It looks pretty dated, a screen that can only output green color, a bulky card reader and a mechanical keyboard, not even sensory. The officer begins to type some stuff into it while the guard watches you out.")
		
		saynn("[say=captain]Was a while since the last time I used this[/say]")
		
		saynn("[say=pc]How often do you have intakes?[/say]")
		
		saynn("[say=captain]Pretty often[/say]")
		
		saynn("[say=pc]But then you should be used to this?[/say]")
		
		saynn("[say=captain]I’m the captain of this prison, {pc.name}[/say]")
		
		saynn("[say=pc]Um.. then why do I get such special treatment?[/say]")
		
		saynn("[say=captain]I don’t know. I guess you’re lucky?[/say]")
		
		saynn("The captain is done with typing in some info and the machine begins to work. Firstly, it produces something that looks like an inmate uniform. It consists of a shirt and shorts. Both are mostly made out of thick black cloth but there are some orange accent lines. It also has a number on it. “P-12054”")
		
		saynn("[say=captain]You’re not {pc.name} anymore. Now you’re an inmate number 12054, general block. Put it on.[/say]")
		
		saynn("[say=pc]Whatever you say[/say]")
		
		saynn("You take your time putting the fresh uniform on, it's exactly the right size for you.")
		
		saynn("[say=captain]If you lose it - you’re gonna be in trouble, just keep that in mind[/say]")
		
		saynn("Next, the machine produces two sets of bulky metal cuffs and a collar. They look heavy and uncomfortable but at least they have a soft padding on the inside. The captain takes it all and glances at you.")
		
		saynn("[say=captain]I will put these on you. Stand still[/say]")
		
		addButton("Stand still", "Let him do it", "cuffs")
		
	if(state == "cuffs"):
		saynn("You don’t look too happy about it but you comply, the stare of a guard makes that choice easier. You offer your wrists and ankles to the captain as he locks every cuff onto you one by one. They’re not chained together but there are eyelets for that.")
		
		saynn("[say=pc]Is that even legal?[/say]")
		
		saynn("[say=risha]Are you seriously gonna be the one who talks about the law?[/say]")
		
		saynn("[say=captain]Well, it helps with the very rebellious ones. No one ever escaped from this prison.[/say]")
		
		saynn("You notice that the captain didn’t actually answer the question but you’re not sure if you want to ask him again. The captain then proceeds to put the collar on you. That’s when you realize that the soft padding doesn’t really help much, the thing sits very uncomfortably on you, barely letting you breathe. As soon as the magnetic lock on the collar engages, it beeps and a little light begins to blink red on it.")
		
		saynn("[say=pc]What is that, is it gonna blow my head?[/say]")
		
		saynn("[say=captain]Now there is no way for you to take it off. And not a single staff member can take it off too. It won’t kill you. But it is a shock collar[/say]")
		
		saynn("[say=pc]Great..[/say]")
		
		saynn("[say=captain]I’m glad you like it. Next stop is the medical checkup, I will let the doctor take over. See you around[/say]")
		
		saynn("[say=pc]Huh?[/say]")
		
		saynn("They guide you to the medical section before leaving you to it.")
		
		addButton("Go there", "How bad can it be really", "endthescene")

func _react(_action: String, _args):
	if(_action == "fightrisha"):
		runScene("FightScene", ["risha"], "rishafight")
		return
		
	if(_action == "shower"):
		GM.pc.addPain(-10)
		GM.pc.addLust(-10)
		GM.pc.addStamina(30)
		
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "rishafight"):
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("wonrisha")
		else:
			setState("losttorisha")
