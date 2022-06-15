extends CustomComponent
class_name SideBar

var scroll:ScrollContainer
var visible = false

func _init(_input):
	super("sidebar",_input)

func ready():
	scroll = get_control("scroll")

func updated():
	print(input.options)
	if input.visible and not visible:
		var tween = scroll.create_tween()
		tween.set_parallel(true)
		visible = true
		tween.tween_property(scroll, "minimum_size:x", 200.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(scroll.get_child(1), "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	elif not input.visible:
		var tween = scroll.create_tween()
		tween.set_parallel(true)
		visible = false
		tween.tween_property(scroll, "minimum_size:x", 0.0, 0.3).from(200.0).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(scroll.get_child(1), "modulate:a", 0.0, 0.3).from(1.0).set_trans(Tween.TRANS_CUBIC)


func options():
	var output = []
	for option in input.options:
		var preset = "option"
		if option.current:
			preset = "current"
		output.append(
			Goo.button({
				id=option.name,
				preset=preset,
				text=option.name,
				on_pressed=func():input.on_option_pressed.call(option.name)
			})
		)
	return output

func gui():
	return \
	Goo.scrollbox({preset="sidebar-scroll", id="scroll"}, [
		Goo.color_rect({preset="fill",color=Color("#0f141a")}),
		Goo.margin({preset="fill", const_margin_all=8},[
			Goo.vbox({preset="fill"}, 
				options()
			)
		]),
	])
