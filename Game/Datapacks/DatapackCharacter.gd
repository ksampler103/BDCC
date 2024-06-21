extends Reference
class_name DatapackCharacter

var id:String = "error"
var name:String = "Rahi"
var bodyparts:Dictionary = {}

var pickedSkin:String = "EmptySkin"
var pickedSkinRColor:Color = Color.white
var pickedSkinGColor:Color = Color.lightgray
var pickedSkinBColor:Color = Color.darkgray

func getEditorName():
	return "id="+id+" name="+name

func getEditVars():
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
		"skin": {
			name = "Base skin",
			type = "skin",
			skins = GlobalRegistry.getSkins().keys(),
			value = {skin=pickedSkin, r=pickedSkinRColor, g=pickedSkinGColor, b=pickedSkinBColor},
			noBase = true,
		},
		"bodyparts": {
			type = "bodyparts",
			value = bodyparts,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	if(varid == "bodyparts"):
		bodyparts = value
		return true
	if(varid == "skin"):
		pickedSkin = value["skin"]
		pickedSkinRColor = value["r"]
		pickedSkinGColor = value["g"]
		pickedSkinBColor = value["b"]
		return true
	
	return false

func saveData():
	return {
		"name": name,
		"bodyparts": bodyparts,
		"pickedSkin": pickedSkin,
		"pickedSkinRColor": pickedSkinRColor.to_html(),
		"pickedSkinGColor": pickedSkinGColor.to_html(),
		"pickedSkinBColor": pickedSkinBColor.to_html(),
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	bodyparts = loadVar(data, "bodyparts", {})
	pickedSkin = loadVar(data, "pickedSkin", "EmptySkin")
	pickedSkinRColor = Color(SAVE.loadVar(data, "pickedSkinRColor", "ffffff"))
	pickedSkinGColor = Color(SAVE.loadVar(data, "pickedSkinGColor", "cccccc"))
	pickedSkinBColor = Color(SAVE.loadVar(data, "pickedSkinBColor", "999999"))

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue