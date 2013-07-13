function first10(clip c)
{
	return c.loop(10, 0, 0).trim(0, 9)
}

function first10clip(clip c)
{
	return c.loop(10, 0, 0)
}

function last10(clip c)
{
	c = c.trim(c.framecount - 9, 0)
	return c.freezeframe(0, c.framecount-1, 0)
}

function last10clip(clip c)
{
	return c.loop(10, c.framecount-1)
}

function firstandlast10clip(clip c)
{
	return c.first10clip().last10clip()
}

function seconds(int minutes, int seconds)
{
	return (60 * minutes) + seconds
}

function paint10(clip c1, clip c2, string type)
{
	return c1.last10clip().transpaint(c2.first10clip(), 10, type)
}

function fadeinto(clip c1, clip c2)
{
	return c1.fadeout(5) + c2.fadein(5)
}