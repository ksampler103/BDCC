extends SceneBase

var howManyTimes = 0

func _init():
	sceneID = "AlexCh2s1Scene"

func _initScene(_args = []):
	addCharacter("alexrynard")
	howManyTimes = getFlag("AlexRynardModule.ch2SceneNum", 0)
	
	if(howManyTimes == 0):
		setState("time1")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return
	if(howManyTimes == 1):
		setState("time2")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return

func _run():
	if(state == ""):
		addCharacter("alexrynard")
	if(state == "time1"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Some time has passed since that time you tested Alex's prototype but the memories are still fresh.")

		saynn("Quietly, you take your spot near Alex and begin working on the pile of datapads. Batteries, screens, buttons, modules.. Batteries, screens, buttons, modules.. Alex is busy repairing too. He focuses on the most fucked up ones, salvaging what components he can.")

		saynn("It's boring and tedious work. So why not ask something? You wait for a good moment to do that when Alex is kneading his shoulder.")

		saynn("[say=pc]I'm curious.[/say]")

		saynn("He raises a brow.")

		saynn("[say=alexrynard]Curious?[/say]")

		saynn("[say=pc]Back then, you knew that I was fully obedient. I wouldn't have said no to anything.[/say]")

		saynn("He rests in his chair, putting the work away for now.")

		saynn("[say=alexrynard]Yeah, disagreeing with someone is a negative emotion I guess. Obvious in the hind-sight.[/say]")

		saynn("[say=pc]How hard was it to not take advantage of that?[/say]")

		saynn("Alex tilts his head, his brow raised as high as his orange forehead allows.")

		saynn("[say=alexrynard]It was.. easy? Yeah, you would have given me full consent while under the influence of my prototype. But that consent is worthless, it didn't actually come from you.[/say]")

		saynn("Consent, huh.")

		saynn("[say=pc]Consent matters that much to you?[/say]")

		saynn("He leans back, his hands resting behind his head.")

		saynn("[say=alexrynard]Yeah. Crazy, right?[/say]")

		saynn("[say=pc]Why crazy?[/say]")

		saynn("[say=alexrynard]I don't know. It's a whole station of thieves, murderers and sluts. But I'm worrying about some kind of consent. Makes me feel stupid. Like I should just give up and go fuck some free use whore. I would have been happier probably.[/say]")

		saynn("Could be why he decided to make the portal panties..")

		addButton("Not crazy", "Tell him that consent is good", "time1_notcrazy")
		addButton("Use me!", "Offer yourself as relief", "time1_useme")
	if(state == "time1_useme"):
		saynn("[say=pc]You can use me if you want. I consent~.[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]You know how many inmates like that I saw? The ones who consent to anything? What am I supposed to do with that?[/say]")

		saynn("[say=pc]Have fun? They are offering their bodies for your pleasure.[/say]")

		saynn("[say=alexrynard]So? I don't even know their limits. They probably don't know it either. What they like, what they dislike.[/say]")

		saynn("He frowns.")

		saynn("[say=alexrynard]They think they are ready for everything. No. That's a stupid way of living, sorry. You MUST know your limits. You MUST respect them. Or you will end up feeling used and broken.[/say]")

		saynn("He throws his head back and looks at the ceiling silently for about ten seconds before finally breaking the silence.")

		saynn("[say=alexrynard]Listen. I can't offer you what others can. But if you still want to submit to me.. let me know. We can start by finding your limits together during some.. trust exercises.[/say]")

		saynn("Oh wow, is he really offering you that? He sounds and looks kinda vulnerable at the moment too, way different from how grumpy and mean he usually is.")

		saynn("[say=alexrynard]But not now. Let's finish this.[/say]")

		saynn("Fair enough.")

		addButton("Continue", "See what happens next", "time1_work")
	if(state == "time1_notcrazy"):
		saynn("[say=pc]It's not crazy. You have a point. Consent is a powerful thing.[/say]")

		saynn("For some reason, your hand wants to reach out and pat the foxy. But he prevents that, shaking it off.")

		saynn("[say=alexrynard]Not on this station.[/say]")

		saynn("Foxy leans back in his chair and stares up at the ceiling, his hands resting on the back of his head.")

		saynn("[say=alexrynard]Can't blame them. When you don't have much freedom, I guess it's quite easy to give away what bits you still have. No limits, no discussion, no 'no's', just.. use me any way you see fit. A true power fantasy.[/say]")

		saynn("He frowns.")

		saynn("[say=alexrynard]Sluts think they are ready for everything. No. That's a stupid way of living, sorry. You MUST know your limits. You MUST respect them. Or you will end up feeling used and broken. And not just feeling.[/say]")

		saynn("Foxy sighs and looks at you.")

		saynn("[say=alexrynard]I'm glad you agree though. Makes me think like I'm not alone.[/say]")

		saynn("[say=pc]Yeah..[/say]")

		saynn("Some time passes. Alex seems to be gathering strength to tell you something.")

		saynn("[say=alexrynard]Don't know how you keep enduring me. But if you want to see the real power of consent.. we can try to do some.. trust exercises. And find where your limits are.[/say]")

		saynn("Oh wow. Is he really offering you that?")

		addButton("Sure", "Agree to it", "time1_agreetoit")
		addButton("Not sure", "You're not so sure", "time1_notsosure")
	if(state == "time1_agreetoit"):
		saynn("[say=pc]Sure, I wouldn't mind doing something like that.[/say]")

		saynn("Alex stays quiet for a second. And then just nods.")

		saynn("[say=alexrynard]For now let's just focus on finishing this crap.[/say]")

		saynn("Fair enough.")

		addButton("Continue", "See what happens next", "time1_work")
	if(state == "time1_notsosure"):
		saynn("[say=pc]I'm not sure about that.[/say]")

		saynn("[say=alexrynard]Yeah, that is fair. I am asking for submission which might not be your thing. But the offer is there.[/say]")

		saynn("Alex stays quiet for a second.")

		saynn("[say=alexrynard]Let's just focus on finishing this crap.[/say]")

		saynn("Fair enough.")

		addButton("Continue", "See what happens next", "time1_work")
	if(state == "time1_work"):
		saynn("Time flies as you help Alex repair the devices. A few hours later Alex finally decides to take a break.")

		saynn("[say=alexrynard]Thanks for the help, here.[/say]")

		saynn("He gives you a work credit.")

		saynn("Nice.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time2"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Time for some work. You sit near Alex and do the usual preparations, gathering all the tools, before grabbing one of the broken datapads and proceeding to tinker with it.")

		saynn("You realize something.")

		saynn("[say=pc]Did you show your prototype to the captain?[/say]")

		saynn("[say=alexrynard]Nah. The guy is busy.[/say]")

		saynn("[say=pc]Why do you need to do that anyway?[/say]")

		saynn("Alex stops working for a second and looks at you.")

		saynn("[say=alexrynard]He deserves to know how I spend the station's resources.[/say]")

		saynn("[say=pc]That's fair.[/say]")

		saynn("He returns to working, poking some exposed wiring with the screwdriver.")

		saynn("[say=alexrynard]Most likely he will shelf my prototype again. But, perhaps, he will see something in this particular one.[/say]")

		saynn("[say=pc]What did he shelf?[/say]")

		saynn("Alex tilts his head slightly.")

		saynn("[say=alexrynard]Someone is asking a few too many questions.[/say]")

		saynn("Suddenly, he pokes the electric board in the wrong place, causing a short circuit. The electricity goes through his body, causing his muscles to tense up.")

		saynn("[say=alexrynard]Ah, Fuck![/say]")

		saynn("You would think that a little shock wouldn't have such an effect.. but Alex is grumbling a lot, his shaking paws holding onto the table tightly. He speaks through his teeth.")

		saynn("[say=alexrynard]That's why you always wear rubber gloves.. fuck..[/say]")

		saynn("He does his best not to show that he is in pain.. but he clearly is.")

		saynn("[say=pc]You need help? Should I bring someone?[/say]")

		saynn("[say=alexrynard]I'm fine.. Just need a small break. I will be back..[/say]")

		addButton("Continue", "See what happens next", "time2_alexfalls")
	if(state == "time2_alexfalls"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="defeat"})
		saynn("Alex uses the table to help himself up.. before promptly collapsing onto the floor.")

		saynn("[say=alexrynard]Argh..[/say]")

		saynn("Oh shit. That could be his heart. Better help him.")

		addButton("Help Alex", "Help him to get up", "time2_helpalex")
	if(state == "time2_helpalex"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="stand"})
		saynn("You rush to him and help get up to his feet. He tries to shove you back.. but you see his arms and legs shaking, ready to give up again.")

		saynn("[say=alexrynard]I told you I'm fine! I don't need help, let go.[/say]")

		saynn("[say=pc]You clearly do. We're going to the medbay right now.[/say]")

		saynn("[say=alexrynard]I will shock you to death if you do that. Bring me to the break room.[/say]")

		saynn("He makes a good point. It is closer anyway.")

		saynn("[say=pc]Fine. Not my problem if you decide to die on me.[/say]")

		saynn("[say=alexrynard]I won't, just do it..[/say]")

		addButton("Break room", "Bring Alex there", "time2_breakroom")
	if(state == "time2_breakroom"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit"})
		aimCameraAndSetLocName("eng_breakroom")
		GM.pc.setLocation("eng_breakroom")
		saynn("You help Alex to walk out of the public workshop and into the main corridor. He reaches for the code panel of the staff-only door.. and then hesitates.")

		saynn("[say=pc]Should I close my eyes?[/say]")

		saynn("[say=alexrynard]Whatever..[/say]")

		saynn("He enters the code while you are watching, opening the door. You quickly find the break room and bring Alex there, dropping him onto the sofa.")

		saynn("[say=alexrynard]Ah.. fuck..[/say]")

		saynn("[say=pc]Will you tell me what's wrong?[/say]")

		saynn("[say=alexrynard]It's nothing..[/say]")

		saynn("His attempts to play it cool only make you angrier.")

		saynn("[say=pc]Don't lie, you look like you're dying.[/say]")

		saynn("He leans back on the sofa, panting heavily.")

		saynn("[say=alexrynard]I got shocked, it happens. I just need some rest, okay? Get me some water.[/say]")

		saynn("He points at the vending machine.")

		addButton("Vending machine", "Grab a water bottle", "time2_waterbottle")
	if(state == "time2_waterbottle"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit", npcBodyState={underwear=true}})
		saynn("It takes some time to realize that this particular vending machine doesn't require credits to dispense items. Huh, but it still has a slot for credits. It was probably hacked by the engineers here. Greed wins over greed.")

		saynn("You turn around after grabbing a water bottle.. and see Alex shirtless. And yeah, the guy got some great physique. Apart from one obvious thing.")

		saynn("Alex's spine seems to be prosthetic. Not the whole thing. But the artificial metal part spans from his neck to the base of his tail at least. You can guess that something isn't right with it by the black marks on the back of his uniform. Alex is grunting too while trying to reach it with his hands. Not too successfully.")

		saynn("[say=alexrynard]What?[/say]")

		saynn("He grabs the bottle and empties half of it in one go.")

		saynn("[say=alexrynard]Thanks..[/say]")

		saynn("[say=pc]Don't mention it. Do you need anything else?[/say]")

		saynn("[say=alexrynard]I'm good.[/say]")

		saynn("[say=pc]I can help, you know.[/say]")

		saynn("[say=alexrynard]I told you. I'm good.[/say]")

		saynn("Back to his old self.. Like nothing has changed. Alex uses a little mirror with one hand while tinkering with his spine with another. Not the most elegant way to do it. But what do you know? He catches your drilling gaze and sighs.")

		saynn("[say=alexrynard]Do you agree that a prosthetic spine is a little bit more complicated than some datapad?[/say]")

		saynn("[say=pc]I do agree. But you can guide me through it.[/say]")

		saynn("Alex pokes his spine with the screwdriver in the wrong place and that causes sparks.")

		saynn("[say=alexrynard]Fuck! Excuse me for not trusting you with my life. Thank you, but I got it from here, trust me. You can go now, inmate.[/say]")

		saynn("He keeps talking about trust.. and yet, barely has any for you.")

		addButton("Leave", "He gave you an invitation to leave. Might as well", "time2_leave")
		addButton("Watch", "Stay and watch him to make sure he is alright", "time2_watch")
	if(state == "time2_leave"):
		aimCameraAndSetLocName("eng_bay_nearbreakroom")
		GM.pc.setLocation("eng_bay_nearbreakroom")
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("alexrynard")
		saynn("Well, if he is so sure about himself.. then you should just listen and leave.")

		saynn("He is quiet as you step out of the room.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time2_watch"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit", npcBodyState={underwear=true}})
		saynn("Nope! If he thinks he can get rid of you so easily, he is clearly wrong. Days of watching him work were preparing you for this.")

		saynn("You drop your butt onto one of the comfy chairs.. and just proceed to watch Alex awkwardly try to reach his prosthetic spine.")

		saynn("[say=alexrynard]Really?[/say]")

		saynn("[say=pc]Yep.[/say]")

		saynn("He looks at you for a few seconds.. and then just returns to fixing himself. He knows better than to mess with you. And you know better than leaving a half-broken person alone with himself.")

		saynn("[say=pc]Wanna tell me how you got your spine messed up like that?[/say]")

		saynn("He sighs and grabs a remote from the tv before pressing a button on it. The small little screen starts displaying some AlphaCorp news about how many new planets are showing interest in joining the fight against Syndicate. Nothing new there..")

		saynn("[say=alexrynard]If you wanna be entertained, watch this.[/say]")

		saynn("Well.. it's better than nothing. Why not.")

		saynn("The news is full of cool shots of battles that are happening throughout the galaxy, both on some planets and in open space, between big ships. There is always information about how you can sign up to be a soldier at the bottom.")

		saynn("Alex breaks the silence first when the tv shows a shot of a big ass spaceship.")

		saynn("[say=alexrynard]Every boy's and girl's dream.[/say]")

		saynn("[say=pc]Girl's?[/say]")

		saynn("[say=alexrynard]Yeah?[/say]")

		saynn("[say=pc]Aren't wars exclusive for boys usually.[/say]")

		saynn("[say=alexrynard]Wars have been optimized for anyone a long time ago. Strength of your muscles doesn't matter much when you just need to pull a trigger of a recoilless energy weapon. You gotta be 'tough' though. This world has no space for weakness.[/say]")

		saynn("Makes sense.")

		saynn("Eventually, Alex manages to repair his spine to a somewhat acceptable condition. Even if he got shocked like twice while doing it alone.")

		saynn("[say=pc]You should really get that thing repaired properly.[/say]")

		saynn("[say=alexrynard]I'd rather spend that time on prototypes.[/say]")

		saynn("Well, looks like he will be fine. Might as well leave him alone now.")

		addButton("Leave", "See what happens next", "time2_leaveafterwatch")
	if(state == "time2_leaveafterwatch"):
		aimCameraAndSetLocName("eng_bay_nearbreakroom")
		GM.pc.setLocation("eng_bay_nearbreakroom")
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("alexrynard")
		saynn("You begin to leave but Alex stops you for a second.")

		saynn("[say=alexrynard]Here, catch.[/say]")

		saynn("He throws a credit chip in your direction.")

		saynn("[say=alexrynard]2 credits for.. extra trouble.[/say]")

		saynn("That's something.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "time1_notcrazy"):
		processTime(30*60)
		addMessage("Trust Exercise 1 is now available")

	if(_action == "time1_useme"):
		processTime(30*60)

	if(_action == "time1_work"):
		processTime(6*60*60)
		GM.pc.addCredits(1)
		addMessage("1 credit added to you")

	if(_action == "time1_agreetoit"):
		addMessage("Trust Exercise 1 is now available")

	if(_action == "time2_alexfalls"):
		processTime(30*60)

	if(_action == "time2_helpalex"):
		processTime(2*60)

	if(_action == "time2_breakroom"):
		processTime(5*60)
		setFlag("AlexRynardModule.ch2CanEnterEngineering", true)
		addMessage("You learned the code to the Engineering block")

	if(_action == "time2_waterbottle"):
		processTime(3*60)

	if(_action == "time2_leave"):
		setFlag("AlexRynardModule.ch2StayedWhenSpineBorked", false)
		GM.pc.addCredits(1)
		addMessage("You received 1 credit")

	if(_action == "time2_watch"):
		processTime(60*60*2)
		setFlag("AlexRynardModule.ch2StayedWhenSpineBorked", true)

	if(_action == "time2_leaveafterwatch"):
		GM.pc.addCredits(2)

	setState(_action)

func saveData():
	var data = .saveData()

	data["howManyTimes"] = howManyTimes

	return data

func loadData(data):
	.loadData(data)

	howManyTimes = SAVE.loadVar(data, "howManyTimes", 0)