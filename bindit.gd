extends Button

signal action_bind
var get_key = false

var action_name = null


func _ready():
	pass # Replace with function body.




		
func _input(event):
	if get_key :
		if event is InputEventKey :
			var actionscancode = event.scancode
			text = char(event.unicode)
			print (action_name , actionscancode, text)
			get_key = false
			emit_signal("action_bind", action_name, event)
#		elif event is InputEventMouseButton :
#			print (event, char(event.unicode))
#			get_key = false

func _on_bindit_pressed():
	get_key = true
