###############################################################################
# Function that allows for a clockwipe transition between the two input clips #
###############################################################################

Function clockwipe(clip bottom,clip top, int "Duration", float "blurriness")
{   
    
    width=bottom.width()
    height=bottom.height()
    wb=blankclip(bottom,duration,color=$FFFFFF)
    bb=blankclip(bottom,duration,color=$000000).spline64resize(width/2,height/2)
    hs=hshear(wb,0,$000000,0,duration/4,90)
    vs=vshear(wb,0,$000000,0,duration/4,90)
    topright=hs.crop(0,0,-width/2,-height/2).trim(0,duration/4-1) ++ bb
    bottomright=blankclip(topright,length=duration/4,color=$FFFFFF) ++ vs.crop(width/2,0,0,-height/2).trim(0,duration/4-1) ++ bb
    bottomleft=blankclip(topright,length=duration/2,color=$FFFFFF) ++ hs.crop(width/2,height/2,0,0).trim(0,duration/4-1) ++ bb
    topleft=blankclip(topright,length=duration/4+duration/2,color=$FFFFFF) ++ vs.crop(0,height/2,-width/2,0).trim(0,duration/4-1) ++ bb
    sh1=stackhorizontal(topleft,topright)
    sh2=stackhorizontal(bottomleft,bottomright)
    sv=stackvertical(sh1,sh2).trim(1,duration).spline64resize(width/10,height/10).blur(blurriness).blur(blurriness).blur(blurriness).blur(blurriness).blur(blurriness).spline64resize(width,height)
    clockmask=mask(top.converttorgb32(),sv.converttorgb32())
    clockoverlay=overlay(top,bottom,mask=clockmask.showalpha(),opacity=1)
    
    return clockoverlay
}

# Helper function that uses a transition freezeframe between the clips
function clockwipe10(clip c1, clip c2)
{
	clocked = c1 + clockwipe(last10(c1), first10(c2), 10, 0) + c2
	
	return clocked
}