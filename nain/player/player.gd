extends Node2D
var direction:int=0
var speed:int=300
var bullet_scene:PackedScene=preload("res://bullets/bullet.tscn")
var shoot_time:=1.0
var shoot_counter=0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shoot_counter+=delta
	if Input.is_action_pressed("shoot") and shoot_counter>shoot_time:
		shoot_counter=0
		var bullet_instance=bullet_scene.instantiate()
		get_parent().get_node("bullets").add_child(bullet_instance)
		
		
	if Input.is_action_pressed("move_left"): 
		direction=-1
	elif Input.is_action_pressed("move_right"):
		direction=1
	else:
		direction=0
#	position.x+=direction*speed*delta
	#clamp function to limit the  value 
	position.x=clamp(position.x+direction*speed*delta,13,390)
	
