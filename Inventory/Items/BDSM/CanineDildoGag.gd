extends ItemBase

func _init():
	id = "caninedildogag"

func getVisibleName():
	return "Canine Dildo Gag"
	
func getDescription():
	return "Consists out of a harness and a knotted rubber dildo that seals the mouth"

func getClothingSlot():
	return InventorySlot.Mouth

func getBuffs():
	return [
		buff(Buff.GagBuff),
		buff(Buff.AmbientLustBuff, [20]),
		buff(Buff.MinLoosenessThroatBuff, [2.0]),
		]

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintBallGag.new()
	restraintData.setLevel(calculateBestRestraintLevel())
