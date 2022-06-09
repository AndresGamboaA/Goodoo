extends CustomComponent
class_name SideBar

var scroll:ScrollContainer

func _init(_input):
	super("sidebar",_input)

func ready():
	scroll = get_control("scroll")

func updated():
	var tween = scroll.create_tween()
	if input.visible:
		tween.tween_property(scroll, "minimum_size:x", 200.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	else:
		tween.tween_property(scroll, "minimum_size:x", 0.0, 0.3).from(200.0).set_trans(Tween.TRANS_CUBIC)

func gui():
	return \
	Goo.scrollbox({"preset":"sidebar-scroll", "id":"scroll"}, [
		Goo.color_rect({"preset":"color","color":Color(0.058824,0.078431,0.101961,1)}),
		Goo.vbox({"preset":"vbox"}, [

		])
	])
