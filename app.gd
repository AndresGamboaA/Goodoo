extends CustomComponent

class_name App

func _init():
	super("app")
	state = {
		sideBarVisible=false,
		options=[
			{name="Introduction", current=true},
			{name="Installation", current=false},
			{name="Set Up", current=false},
			{name="Components", current=false},
			{name="  Basic Components", current=false},
			{name="  Custom Components", current=false},
		]
	}

func toggleSideBar():
	state.sideBarVisible = not state.sideBarVisible
	update_gui()

func handle_option_pressed(_name):
	get_current_option().current = false
	get_option(_name).current = true
	update_gui()

func current_page():
	match get_current_option().name:
		"Introduction": return Introduction.new()
		"Installation": return Installation.new()

func gui():
	return\
	Goo.hbox({preset="full"},[
		SideBar.new({
			visible=state.sideBarVisible, 
			options=state.options,
			on_option_pressed=handle_option_pressed
		}),
		Goo.vbox({preset="fill"},[
			TopBar.new({on_menu_buttom_toggled=toggleSideBar}),
			current_page()
		])
	])

func get_current_option():
	for option in state.options:
		if option.current:
			return option

func get_option(_name):
	for option in state.options:
		if option.name == _name:
			return option
