xskew = approach(xskew, xset, 0.5); //0.5

//xset += 0.5;
//xset = min(xset, skewmax);

if (xskew == xset)
    xset *= -0.5;
	
if (--delay <= 0)
{
    skewmax = random_range(4, 8);
    delay = 4;
}