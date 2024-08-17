extends Area2D
@export var BULLET : PackedScene

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0 :
		var target_enemy = enemies_in_range.front() #or u can replace front() function with [0] meaning to target the 1st enemy
		look_at(target_enemy.global_position)

func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = $WeaponPivot/Pistol/ShootingPoint.global_position
	new_bullet.global_rotation = $WeaponPivot/Pistol/ShootingPoint.global_rotation
	$WeaponPivot/Pistol/ShootingPoint.add_child(new_bullet)
  

func _on_timer_timeout():
	shoot()
