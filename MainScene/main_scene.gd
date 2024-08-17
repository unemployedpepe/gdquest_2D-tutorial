extends Node2D
var spawn_slime : PackedScene = preload("res://Mobs/slime.tscn")
func spawn_mob():
	#var spawn_slime = preload("res://Mobs/slime.tscn").instantiate() #this way it load it efficiently performance wise is good. 
	var s = spawn_slime.instantiate()
	%PathFollow2D.progress_ratio = randf()
	s.global_position = %PathFollow2D.global_position
	add_child(s)

func _on_slime_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	$GameOver.visible = true
	get_tree().paused = true
