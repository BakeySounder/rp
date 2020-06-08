GI = GI or {}
GI.Theme = {
	['background'] = Color(53,59,72),
	['text'] = color_white,
	['hover'] = Color(255,255,255,10),
	['s'] = Color(47,54,64),
	['Progress'] = Color(0,151,230),
	['foreground'] = Color(39,60,117),
	['button'] = Color(43,49,62),
	['line'] = Color(255, 156, 0)
}
GI.tabs = {
	{
		name = 'PlayerList' ,
		func = function(parent) 
			local plist = vgui.Create('DPanel', parent)
			plist:Dock(FILL)
			--plist:SetTall(20)
			plist:DockMargin(5, 5, 5, 5)
			plist:SetBackgroundColor(Color(255, 255, 120))
		end
	},
	{
		name = 'Inventory' ,
		func = function(parent) 
			local plist = vgui.Create('DPanel', parent)
			plist:Dock(FILL)
			--plist:SetTall(20)
			plist:DockMargin(5, 5, 5, 5)
			plist:SetBackgroundColor(Color(255, 0, 0))
		end
	},
	{
		name = 'Shop' ,
		func = function(parent) 
			local plist = vgui.Create('DPanel', parent)
			plist:Dock(FILL)
			--plist:SetTall(20)
			plist:DockMargin(5, 5, 5, 5)
			plist:SetBackgroundColor(Color(50, 255, 70))
		end
	},	
	{
		name = 'Options' ,
		func = function(parent) 
			local plist = vgui.Create('DPanel', parent)
			plist:Dock(FILL)
			--plist:SetTall(20)
			plist:DockMargin(5, 5, 5, 5)
			plist:SetBackgroundColor(Color(72, 49, 230))
		end
	}			
}

