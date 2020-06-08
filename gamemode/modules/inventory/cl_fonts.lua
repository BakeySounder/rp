local count = 24

for i = 1,count do
	surface.CreateFont( "GI.Font_"..i, {
	font = "Roboto", 
	size = 18+i,
	weight = 500,
	antialias = true,
	extended = true
	})

end