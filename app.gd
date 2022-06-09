extends CustomComponent

class_name App

func _init():
	super("app")
	state = {"sideBarVisible":false}

func toggleSideBar():
	state.sideBarVisible = not state.sideBarVisible
	update_gui()

func gui():
	return\
	Goo.hbox({"preset":"hbox"},[
#		SideBar.new({"visible":state.sideBarVisible}),
		Goo.scrollbox({"preset":"scroll"},[])
	])
