extends CustomComponent
class_name Counter

func _init():
	super("counter")
	state = {"count":0}

func increment():
	state.count = state.count+1
	update_gui()

func decrement():
	state.count = state.count-1
	update_gui()

func gui():
	return\
	Goo.center({preset="fill-h"},[
		Goo.hbox({preset="fill-h"},[
			Goo.button({preset="button",text="-",on_pressed = decrement}),
			Goo.label({text=str(state.count), preset="subtitle", minimum_size=Vector2(50,0), horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER}),
			Goo.button({preset="button",text="+",on_pressed = increment})
		])
	])
