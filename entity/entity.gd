extends KinematicBody2D

# Member variables
const MOTION_SPEED = 0 # Pixels/second
var sprite_dir = "down_mid"

func set_animation(animation, sprite_dir):
	var animation_name = str(animation, "_", sprite_dir)
	print (str("setting animation: ", animation_name))
	if $anim.current_animation != animation_name:
		$anim.play(animation_name)
	
func perform_movement(motion):
	var norm_motion = motion.normalized() * MOTION_SPEED
	# Adjust movement for isometric
	norm_motion.y *= 0.5
	move_and_slide(norm_motion)

func update_sprite_anim_dir(motion):
	"""
	Takes un-normalised motion vector
	Udpates sprite_dir animation string in format <vert>_<hortz>
	where <vert> is up, mid or down and <hortz> is left, mid or right
	defaults to the already current one on mid_mid (no motion)
	"""
	if motion != dir.MID_MID:
		sprite_dir = dir.DIR[motion]
	return sprite_dir