extends CustomComponent

class_name App

func _init():
	#Always call super("name_of_the_class")
	super("app")
	state = {"count":0}

func handle_change():
	state.count += 1
	update_gui()

func gui():
	return\
	Goo.vbox({"preset":"vbox"},[
		Goo.label({"text":"goodoo"}),
		Goo.vbox({"preset":"vbox"},[
			Goo.button({"preset": "red-button left-button", "text":"button", "on_pressed":handle_change})
		]),
		Goo.label({"text":"oo"}) if state.count % 2 == 0 else Goo.button({"text":"click"})
	])
