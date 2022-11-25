extends Reference
class_name EventBase

var id = "badevent"

func _init():
	pass

func registerTriggers(_es):
	pass

func react(_triggerID, _args):
	pass
	
func run(_triggerID, _args):
	pass

func getPriority():
	return 10

func onButton(_method, _args):
	pass

func runScene(sceneid: String, args = [], tag = ""):
	var scene = GM.main.runScene(sceneid, args)
	scene.sceneTag = tag

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)

func sayn(_text: String):
	say(_text+"\n")

func saynn(_text: String):
	say(_text+"\n\n")

func addButton(text: String, tooltip: String = "", method: String = "", args = []):
	GM.ui.addButton(text, tooltip, "EVENTSYSTEM_BUTTON", [self, method, args])

func addDisabledButton(text: String, tooltip: String = ""):
	GM.ui.addDisabledButton(text, tooltip)

func addButtonUnlessLate(text: String, tooltip: String = "", method: String = "", args = [], latetext: String = "It's way too late for that"):
	if(GM.main.isVeryLate()):
		addDisabledButton(text, latetext)
	else:
		addButton(text, tooltip, method, args)
	
func addButtonWithChecks(text: String, tooltip: String, method: String, args, checks: Array):
	var badCheck = ButtonChecks.check(checks)
	if(badCheck == null):
		addButton(text, ButtonChecks.getPrefix(checks) + tooltip, method, args)
	else:
		addDisabledButton(text, ButtonChecks.getReasonText(badCheck))

func setFlag(flagID, value):
	GM.main.setFlag(flagID, value)

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)

func increaseFlag(flagID, addvalue = 1):
	GM.main.increaseFlag(flagID, addvalue)

func setModuleFlag(moduleID, flagID, value):
	GM.main.setModuleFlag(moduleID, flagID, value)

func increaseModuleFlag(moduleID, flagID, addvalue = 1):
	GM.main.increaseModuleFlag(moduleID, flagID, addvalue)

func getModuleFlag(moduleID, flagID, defaultValue = null):
	return GM.main.getModuleFlag(moduleID, flagID, defaultValue)

func grabNpcIDFromPool(poolID, _conditions = {}):
	var characters = GM.main.getDynamicCharacterIDsFromPool(poolID)
	
	if(characters.size() > 0):
		return RNG.pick(characters)
	
	return null

func generateNpcForPool(poolID, generator, _args = {}):
	var newCharacter = generator.generate(_args)
	GM.main.addDynamicCharacterToPool(newCharacter.id, poolID)
	return newCharacter.id

func grabNpcIDFromPoolOrGenerate(poolID, generator, _conditions = {}, _args = {}):
	var poolSize = GM.main.getDynamicCharactersPoolSize(poolID)
	var chanceToMeetOld = sqrt(float(poolSize)) * 25.0
	if(getFlag("PreferKnownEncounters")):
		chanceToMeetOld = 100
	
	if(RNG.chance(chanceToMeetOld)):
		var characterID = grabNpcIDFromPool(poolID, _conditions)
		if(characterID == null):
			return generateNpcForPool(poolID, generator, _args)
		return characterID
	else:
		return generateNpcForPool(poolID, generator, _args)
