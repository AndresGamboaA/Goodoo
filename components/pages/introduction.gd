extends CustomComponent

class_name Introduction

func _init():
	super("intro")

func ready():
	var scroll :ScrollContainer
	scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+10.0).set_trans(Tween.TRANS_CUBIC)

func gui():
	return\
	Goo.scrollbox({"preset":"scroll-cc-exp","id":"scroll"},[
		Goo.margin({"preset":"margin-cc-exp-h", "minimum_size":Vector2(100,0)},[
			Goo.vbox({"preset":"vbox-cc-exp-h"},[
				Goo.rich_label({"preset":"animated-title","text":"[center][wave]Goodoo[/wave][/center]"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({"preset":"paragraph", "text":"Goodoo is a UI library written in Gdscript to build interactive user interfaces. It is heavelly inspired by class components in React. It works by rendering and updating your GUI based on a state. When you change data in the state, call the update_gui function and Goodoo will update all the control nodes that need to change."}),
				Goo.margin({minimum_size=Vector2(0,40)}),
				Goo.label({"preset":"subtitle", "text":"Why to use Goodoo?"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({"preset":"paragraph", "text":"Using control nodes and conecting its signals may work fine for most GUIs in videogames, but it can be painful when creating a complex appliation using Godot."}),
				Goo.margin({minimum_size=Vector2(0,40)}),
				Goo.label({"preset":"subtitle", "text":"Create reusable components"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Goodoo makes easy to integrate a component multiple times through your project."}),
				Goo.margin({minimum_size=Vector2(0,40)}),
				Goo.label({"preset":"subtitle", "text":"Presets"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Presets are predefined properties of control nodes that can be use to easelly styled your components."}),
				Goo.margin({minimum_size=Vector2(0,40)}),
				Goo.label({"preset":"subtitle", "text":"About this app"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="This application was creating in Godot using Goodoo, it works as a demo and as a introduction to start creating your own UIs using this library."}),
				
			]),
		])
	])
