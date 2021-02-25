extends Popup

export(Array, String) var actions

var keybinds = {}
onready var actionbinder = $VBoxContainer/action_binder
onready var actionbinds = $VBoxContainer/action_binds




func _ready():
#	for a in actions :
#		keybinds[str(actions[a])] = null
	for r in range(actions.size()) :
		keybinds[actions[r]] = null
	print(keybinds)

func fill_popup() :
	for c in actionbinds.get_children() :
		c.queue_free()
	var i = 0
	for n in keybinds :
			var aa = actionbinder.duplicate()
			aa.get_node("action_name").text = n
			aa.get_node("bindit").action_name = n
			if keybinds[n] != null :
				aa.get_node("bindit").text = char(keybinds[n].unicode)
			actionbinds.add_child(aa)
			aa.position.y = 20 *i
			i += 1


func _on_Button_pressed():
	fill_popup()
	popup()

func new_action_bind(action_name, event) :
	if !InputMap.has_action(action_name) : 
		InputMap.add_action(action_name)
	InputMap.action_add_event(action_name, event)
	keybinds[action_name] = event

func _on_bindit_action_bind(action_name, event):
	print("received binding : ", action_name, event)
	new_action_bind(action_name, event)
