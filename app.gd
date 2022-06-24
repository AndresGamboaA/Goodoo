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
	state.options.filter(func(item): return item.current )[0].current = false
	state.options.filter(func(item): return item.name==_name)[0].current = true
	update_gui()

func current_page():
	var current_option = state.options.filter(func(item): return item.current )[0]
	match current_option.name:
		"Introduction": return Introduction.new()
		"Installation": return Installation.new()
		_:              return Goo.nothing()


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
