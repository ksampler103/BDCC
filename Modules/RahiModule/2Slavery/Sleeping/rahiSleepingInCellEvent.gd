extends EventBase

func _init():
	id = "rahiSleepingInCellEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SleepInCell)

func react(_triggerID, _args):
	if(!getModule("RahiModule").shouldSleepInPlayerCell()):
		return false
	
	runScene("rahiSleepsInPlayerCellScene")
	return true

func getPriority():
	return 10

