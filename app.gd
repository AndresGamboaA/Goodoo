extends CustomComponent

class_name App

func _init():
	super("app")
	state = {
		sideBarVisible=false,
		options=[
			{name="Introduction", current=true},
			{name="Installation", current=false},
		]
	}

func toggleSideBar():
	state.sideBarVisible = not state.sideBarVisible
	update_gui()

func handle_option_pressed(_name):
	print(_name)
	get_current_option().current = false
	get_option(_name).current = true
	update_gui()

func get_current_option():
	for option in state.options:
		if option.current:
			return option

func get_option(_name):
	for option in state.options:
		if option.name == _name:
			return option

func gui():
	return\
	Goo.vbox({preset="vbox-exp"},[
		Goo.hbox({preset="hbox-cc-exp"},[
			SideBar.new({
				visible=state.sideBarVisible, 
				options=state.options,
				on_option_pressed=handle_option_pressed
			}),
			Goo.vbox({preset="vbox-cc-exp"},[
				TopBar.new({on_menu_buttom_toggled=toggleSideBar}),
#				current_page()
			])
		])
	])
