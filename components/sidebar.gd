extends CustomComponent
class_name SideBar

var scroll:ScrollContainer

func _init(_input):
	super("sidebar",_input)

func ready():
	scroll = get_control("scroll")

func updated():
	print("SIDEBARUPDATED........")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	if input.visible:
		tween.tween_property(scroll, "minimum_size:x", 200.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(scroll.get_child(1), "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	else:
		tween.tween_property(scroll, "minimum_size:x", 0.0, 0.3).from(200.0).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(scroll.get_child(1), "modulate:a", 0.0, 0.3).from(1.0).set_trans(Tween.TRANS_CUBIC)

func options():
	var output = []
	for option in input.options:
		output.append(Goo.button({
			"preset": "current-option" if option.current else "option", 
			"text": option.name,
			"on_pressed":func():input.on_option_pressed.call(option.name)
		}))
	return output

func gui():
	return \
	Goo.scrollbox({"preset":"sidebar-scroll", "id":"scroll"}, [
		Goo.color_rect({"preset":"color-cc","color":Color(0.058824,0.078431,0.101961,1)}),
		Goo.margin({"preset":"margin-cc-exp", "const_margin_all":8},[
				Goo.vbox({"preset":"vbox"}, 
					options()
				)
		])
	])
