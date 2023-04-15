extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.PuppySolo

func _ready():
	animationTree.active = true
	
#func updateSubAnims():
#	if(doll.getArmsCuffed()):
#		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
func playAnimation(animID, _args = {}):
	#print("Playing hogtied: "+str(animID))
	
	doll.setCustomParts({
		"PuppyGear": "res://Inventory/RiggedModels/PuppyRestraints/PuppyRestraints.tscn",
	})
	
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	

	#updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(animID == "stand"):
		state_machine.travel("PuppyIdle-loop")
	if(animID == "walk"):
		state_machine.travel("PuppyWalk-loop")
	if(animID == "sit"):
		state_machine.travel("PuppySit-loop")
	if(animID == "paw"):
		state_machine.travel("PuppySitPaw-loop")
	if(animID == "back"):
		state_machine.travel("PuppyOnBack-loop")
	if(animID == "sad"):
		state_machine.travel("PuppyIdleSad-loop")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))
