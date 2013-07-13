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

function MCsub(clip c, string text, int "start_in", int "end_in", float "line_in")
{
	# Optional arguments don't work...so invalid floats and ints must be tested for
	line = isfloat(line_in) ? line_in : 0
	start = isint(start_in) ? start_in : 0
	end = isint(end_in) ? end_in : c.framecount

	#Subtitle the clip twice. The first acts as the drop shadow.
	return c\
		.subtitle(" "+text, font="MineCrafter 3 Regular", y=c.Height-95+(line*40), size=40, align=5, text_color=color_black, first_frame=start, last_frame=end)\
		.subtitle(text, font="MineCrafter 3 Regular", y=c.Height-100+(line*40), size=40, align=5, text_color=color_white, first_frame=start, last_frame=end)
}