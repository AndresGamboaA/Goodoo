class_name BaseRootComponent
extends Component

var root_control:Control
var presets_path

func _init():
	super("rootComponent")

func _ready():
	mount()

func mount():
	Gui.initialize_presets(presets_path)
	var rc = Control.new()
	rc.anchors_preset = 15
	root_control = rc
	call_deferred("add_sibling", rc)
	Guidot.render(rc, self)

func update_view():
	print("updating view")
	var next = view()
	Guidot.diff(self.get_view(), next)
	component_updated()
