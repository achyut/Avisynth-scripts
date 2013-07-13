###################################################################
# A function to add minecraft styled subtitles to owlcraft videos #
# TODO: Use SubtitleEX instead                                    #
###################################################################

# Args
# c -> the input clip
# text -> the text to be displayed
# start_in -> the beginning time of the subtitle (in frames)
# end_in -> the end time of the subtitle (in frames)
# line_in -> What line the subtitles should appear on. Use for multiple uses of MCsub.

function MCsub(clip c, string text, int "start_in", int "end_in")
{
	# Optional arguments don't work...so invalid floats and ints must be tested for
	start = isint(start_in) ? start_in : 0
	end = isint(end_in) ? end_in : c.framecount

	#Subtitle the clip twice. The first acts as the drop shadow.
	return c\
		.SubtitleEX(text, (c.width/2)+5, -90, start, end, "Minecrafter 3 Regular", "cf(10,10)sss", 40, $00000000)\
		.SubtitleEX(text, c.width/2, -95, start, end, "Minecrafter 3 Regular", "cf(10,10)", 40)
}