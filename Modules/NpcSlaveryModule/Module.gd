extends Module

func getFlags():
	return {
		"slavesSpace": flag(FlagType.Number),
		
		"hasSybian": flag(FlagType.Bool),
		
	}

func _init():
	id = "NpcSlaveryModule"
	author = "Rahi"
	
	scenes = [
			"res://Modules/NpcSlaveryModule/SocketBuyCellUpgradesScene.gd",
		
			"res://Modules/NpcSlaveryModule/Enslaving/EnslaveDynamicNpcScene.gd",
			"res://Modules/NpcSlaveryModule/Enslaving/KidnapDynamicNpcScene.gd",
			
			"res://Modules/NpcSlaveryModule/Slavery/SlaveTalkScene.gd",
			"res://Modules/NpcSlaveryModule/Slavery/SlavesCheckScene.gd",
			"res://Modules/NpcSlaveryModule/Slavery/SlaveStartActionScene.gd",
			"res://Modules/NpcSlaveryModule/Slavery/SlaveActionWrapperScene.gd",
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/NpcSlaveryModule/Enslaving/EnslaveDynamicNpcEvent.gd",
		"res://Modules/NpcSlaveryModule/Slavery/SlaveTalkEvent.gd",
	]

func resetFlagsOnNewDay():
	pass

func getSlavesSpace() -> int:
	return int(getFlag("NpcSlaveryModule.slavesSpace", 0))

func canEnslave():
	return getSlavesSpace()

func getSlaves():
	return GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)

func hasSlaves():
	return int(GM.main.getDynamicCharactersPoolSize(CharacterPool.Slaves)) > 0

func hasFreeSpaceToEnslave():
	var currentSlaveAmount = int(GM.main.getDynamicCharactersPoolSize(CharacterPool.Slaves))

	var freeSpace = getSlavesSpace() - currentSlaveAmount
	return freeSpace > 0

func slavesHaveAnyEvents():
	var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
	
	for charID in slaves:
		var character:DynamicCharacter = GlobalRegistry.getCharacter(charID)
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		if(npcSlavery == null):
			continue
		if(npcSlavery.hasRandomEventToTrigger()):
			return true
	return false

func getSlavesSpaceUpgradeCost():
	var currentSpace = getSlavesSpace()
	
	if(currentSpace == 0):
		return 30
	return currentSpace * 10
	
func doEnslaveCharacter(npcID):
	var theChar:DynamicCharacter = GlobalRegistry.getCharacter(npcID)
	
	if(theChar == null || !theChar.isDynamicCharacter()):
		return false
	if(theChar.isSlaveToPlayer()):
		return false
	
	var theEnslaveQuest:NpcEnslavementQuest = theChar.getEnslaveQuest()
	theChar.setEnslaveQuest(null)
	
	var slaveType = SlaveType.Slut
	if(theEnslaveQuest != null):
		slaveType = theEnslaveQuest.slaveType
	
	var newNpcSlavery = NpcSlave.new()
	newNpcSlavery.setChar(theChar)
	newNpcSlavery.setMainSlaveType(slaveType)
	newNpcSlavery.slaveSpecializations = {
		slaveType: 0,
	}
	#newNpcSlavery.generateTasks()
	theChar.setNpcSlavery(newNpcSlavery)
	
	GM.main.removeDynamicCharacterFromAllPools(npcID)
	GM.main.addDynamicCharacterToPool(npcID, CharacterPool.Slaves)
	return true
