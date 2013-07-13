############################################################################
# Function that automatically creates the owlcraft intro from an input clip #
############################################################################

function makeMCintro(clip c)
{
	# Standard variables for section lengths
	section1_l = 80
	main_l = 140
	section3_l = 44

	# The standard owlcraft audio file
	intro_audio = WAVSource("F:\Video\fraps\minecraft\intro\municipale_balcanica - vodka - clip.wav")
	# The standard blank clip in beginning
	section1 = blankclip(c, section1_l)
	# The banner, overlayed at the end
	intro_graphic = ImageReader("F:\Video\fraps\minecraft\banner720p.png", pixel_type = "RGB32")

	# Trim the beginning of the input clip
	c = trim(c, c.framecount - main_l, 0)
	# Create the freezeframe that appears at the end. Freeze the last frame of the input clip and overlay the graphic.
	section3 =  freezeframe(trim(c, main_l-1, main_l)+blankclip(c, section3_l-1), 1, section3_l, 0).ApplyRange(0, section3_l, "Overlay", intro_graphic, 0, 0, intro_graphic.ShowAlpha, 1, "blend")

	# Return the combined clips
	return audiodub(section1+c+section3, intro_audio)
}