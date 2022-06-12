extends CustomComponent

class_name Installation

func _init():
	super("installation")

func ready():
	var scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+20.0).set_trans(Tween.TRANS_CUBIC)

func gui():
	return\
	Goo.scrollbox({preset="scroll-cc-exp",id="scroll"},[
		Goo.margin({preset="margin-cc-exp-h", minimum_size=Vector2(0,0)},[
			Goo.vbox({preset="vbox-cc-exp-h"},[
				Goo.label({preset="title", text="Installation"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({
					preset="paragraph", 
					text="Goodoo makes it painless to create interactive UIs. Design simple views for each state in your application, and Goodoo will efficiently update and render just the right components when your data changes. Declarative views make your code more predictable and easier to debug."
				})
			]),
		])
	])
