extends CustomComponent

class_name Introduction

func _init():
	super("intro")

func ready():
	var scroll :Control
	scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+10.0).set_trans(Tween.TRANS_CUBIC)

func gui():
	return\
	Goo.scrollbox({"preset":"scroll-cc-exp","id":"scroll"},[
		Goo.margin({"preset":"margin-cc-exp-h", "minimum_size":Vector2(400,0)},[
			Goo.vbox({"preset":"vbox-cc-exp-h"},[
				Goo.rich_label({"preset":"animated-title","text":"[center][wave]Goodoo[/wave][/center]"}),
				Goo.label({"preset":"paragraph", "text":"Goodoo makes it painless to create interactive UIs. Design simple views for each state in your application, and Goodoo will efficiently update and render just the right components when your data changes. Declarative views make your code more predictable and easier to debug."})
			]),
		])
	])
