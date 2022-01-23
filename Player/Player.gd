extends BaseCharacter
class_name Player

signal bodypart_changed
signal location_changed(newloc)

var gamename = "Rahi"
var credits:int = 0
var location:String = "ScriptedRoom"
var legs: BodypartLeg
var arms
var head
var ears
var tail
var breasts: BodypartBreasts
var hair: BodypartHair
var pickedGender = Gender.Female
var pronounsGender = null

func _init():
	initialDodgeChance = 0.05 # Player has a small chance to dodge anything

# Called when the node enters the scene tree for the first time.
func _ready():
	#legs = GlobalRegistry.getBodypart("humanleg")
	setLegs(GlobalRegistry.getBodypart("felineleg"))
	var mybreasts: BodypartBreasts = GlobalRegistry.getBodypart("humanbreasts")
	mybreasts.size = BodypartBreasts.BreastsSize.C
	setBreasts(mybreasts)
	setHair(GlobalRegistry.getBodypart("baldhair"))
	updateNonBattleEffects()


func updateAppearance():
	emit_signal("bodypart_changed")

func setLegs(bodypart: BodypartLeg):
	legs = bodypart
	emit_signal("bodypart_changed")

func setBreasts(bodypart: BodypartBreasts):
	breasts = bodypart
	emit_signal("bodypart_changed")

func setHair(bodypart: BodypartHair):
	hair = bodypart
	emit_signal("bodypart_changed")

func setLocation(newRoomID:String):
	location = newRoomID
	#var roomInfo = GM.world.getRoomByID(location)
	#if(roomInfo):
	#	var roomName = roomInfo.getName()
	#	GM.ui.setLocationName(roomName)
	emit_signal("location_changed", newRoomID)
	
func getName() -> String:
	return gamename
	
func setName(newname: String):
	newname = newname.replace("{", "")
	newname = newname.replace("}", "")
	newname = newname.replace("[", "")
	newname = newname.replace("]", "")
	if(newname == ""):
		newname = "Player"
	
	gamename = newname
	emit_signal("stat_changed")
	
func addCredits(_c: int):
	credits += _c
	emit_signal("stat_changed")

func getCredits() -> int:
	return credits

func painThreshold():
	return 100

func isPlayer():
	return true

func _getAttacks():
	return ["simplepunchattack", "scratchattack", "biteattack", "simplekickattack", "shoveattack", "strongkickattack", "simplelustattack", "begattack", "youslutattack", "gropeattack"]

func hasBoundArms():
	return false

func hasBoundLegs():
	return false

func isBlindfolded():
	return false

func isGagged():
	return false

# They may have effect on your damage in battles but they're not a 'battle' effects
func updateNonBattleEffects():
	if(hasBoundArms()):
		if(!hasEffect(StatusEffect.ArmsBound)):
			addEffect(StatusEffect.ArmsBound)
	else:
		if(hasEffect(StatusEffect.ArmsBound)):
			removeEffect(StatusEffect.ArmsBound)
			
	if(hasBoundLegs()):
		if(!hasEffect(StatusEffect.LegsBound)):
			addEffect(StatusEffect.LegsBound)
	else:
		if(hasEffect(StatusEffect.LegsBound)):
			removeEffect(StatusEffect.LegsBound)
			
	if(isBlindfolded()):
		if(!hasEffect(StatusEffect.Blindfolded)):
			addEffect(StatusEffect.Blindfolded)
	else:
		if(hasEffect(StatusEffect.Blindfolded)):
			removeEffect(StatusEffect.Blindfolded)
			
	if(isGagged()):
		if(!hasEffect(StatusEffect.Gagged)):
			addEffect(StatusEffect.Gagged)
	else:
		if(hasEffect(StatusEffect.Gagged)):
			removeEffect(StatusEffect.Gagged)

func processBattleTurn():
	.processBattleTurn()
	updateNonBattleEffects()

func processTime(_minutesPassed):
	updateNonBattleEffects()

func getGender():
	return pickedGender

func getPronounGender():
	if(pronounsGender == null):
		return getGender()
	return pronounsGender

func setGender(newgender):
	pickedGender = newgender

func setPronounGender(newgender):
	pronounsGender = newgender

func getChatColor():
	var gender = getGender()
	
	if(gender == Gender.Male):
		return "#92B3DD"
	if(gender == Gender.Female):
		return "#FFB7B2"
	if(gender == Gender.Androgynous):
		return "#DABFFF"
	if(gender == Gender.Other):
		return "#C3E8BE"
	
	return "red"

func formatSay(text):
	var color = getChatColor()
	
	if(isGagged()):
		text = Util.muffledSpeech(text)
	
	return "[color="+color+"]\""+text+"\"[/color]"

func saveData():
	var data = {
		"gamename": gamename,
		"credits": credits,
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
		"location": location,
		"pickedGender": pickedGender,
		"pronounsGender": pronounsGender,
	}
	
	data["legs"] = legs.id
	data["legsData"] = legs.saveData()
	data["breasts"] = breasts.id
	data["breastsData"] = breasts.saveData()
	data["hair"] = hair.id
	data["hairData"] = hair.saveData()
	
	data["statusEffects"] = saveStatusEffectsData()
	
	return data

func loadData(data):
	gamename = SAVE.loadVar(data, "gamename", "Player")
	credits = SAVE.loadVar(data, "credits", 0)
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	location = SAVE.loadVar(data, "location", "ScriptedRoom")
	pickedGender = SAVE.loadVar(data, "pickedGender", Gender.Female)
	pronounsGender = SAVE.loadVar(data, "pronounsGender", null)

	setLegs(GlobalRegistry.getBodypart(SAVE.loadVar(data, "legs", "humanleg")))
	legs.loadData(SAVE.loadVar(data, "legsData", {}))
	
	setBreasts(GlobalRegistry.getBodypart(SAVE.loadVar(data, "breasts", "humanbreasts")))
	breasts.loadData(SAVE.loadVar(data, "breastsData", {}))
	
	setHair(GlobalRegistry.getBodypart(SAVE.loadVar(data, "hair", "baldhair")))
	hair.loadData(SAVE.loadVar(data, "hairData", {}))
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
