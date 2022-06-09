extends CustomComponent

class_name TopBar

func _init(_input):
	super("topbar",_input)


func gui():
	return\
	Goo.control({"preset":"control-cc","minimum_size":Vector2(0,30)},[
		Goo.hbox({"preset":"hbox-exp"},[
			Goo.button({
				"preset":"basic",
				"text":"Menu", 
				"on_pressed":func():input.on_menu_buttom_toggled.call()
			})
		])
	])
