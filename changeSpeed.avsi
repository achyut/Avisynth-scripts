##################################################
# Function to change the speed of clip c by rate #
##################################################

function ChangeSpeed(clip c, float rate)
{
  orig = c.framerate
  newvid = AssumeFPS(c, orig * rate)
  return ChangeFPS(newvid, c, linear=false)#.AudioDub(c.TimeStretch(tempo=100*rate))
  #TESTING AGAIN
}