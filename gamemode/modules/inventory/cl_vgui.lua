GI = GI or {}
local PANEL = {}
local next = next
function PANEL:Init()
	self.sheets = {}
	self.startTime = SysTime()
	self.Created = false
	self:MakePopup()
	self:AlphaTo(255,2,1)
	self.ActiveTab = self.ActiveTab or 1
	self.Paint = function() Derma_DrawBackgroundBlur(self, self.startTime-0.3) end
	self.TP = vgui.Create('DPanel', self)
	self.TP:Dock(TOP)
	self.TP:SetTall(30)
	self.TP.Paint = function( me,w,h )
		--surface.SetDrawColor(GI.Theme.Progress)
		--surface.DrawRect(0,0,w,h)
	end
	self.cats = vgui.Create('DPanel', self.TP)
	self.cats.Paint = nil
    self.close = vgui.Create('DButton',self.TP)
    self.close:SetText('')
    self.close.DoClick = function(me) self:Remove() end
    self.close.Paint = function(me,w,h)
		draw.RoundedBox(3, 0, 0, w, h, GI.Theme.button)
    	if me:IsHovered() then
    		surface.SetDrawColor(GI.Theme.hover)
    		surface.DrawRect(0,0,w,h)
    	end
    	draw.SimpleText('Закрыть [X]', "GI.Font_1", w/2,h/2, GI.Theme.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
	self.close:SetWide(100)
	self.body = vgui.Create('DPanel',self)
	self.body:Dock(TOP)
	self.body.Paint = function( me,w,h )
		draw.RoundedBox(3, 0, 0, w, h, GI.Theme.background)
	end
	GI.tabs[self.ActiveTab].func(self.body)
	for i = 1,#GI.tabs do
		self.sheets[i] = vgui.Create('DButton', self.cats)
		self.sheets[i]:SetWide(150)
		self.sheets[i]:SetText('')
		self.sheets[i].Paint = function(me,w,h)
			draw.RoundedBox(3, 0, 0, w, h, GI.Theme.button)
	    	surface.SetDrawColor(self.ActiveTab == i and GI.Theme.line or GI.Theme.Progress)
	    	surface.DrawRect(0,h-3,w,3)
	    	if me:IsHovered() then
	    		surface.SetDrawColor(GI.Theme.hover)
	    		surface.DrawRect(0,0,w,h)
	    	end
	    	draw.SimpleText(GI.tabs[i].name, "GI.Font_1", w/2,h/2, GI.Theme.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end
	    self.sheets[i].DoClick = function(me)
			for _,pnl in next,self.body:GetChildren() do
				pnl:Remove()
			end
			self.ActiveTab = i
			GI.tabs[self.ActiveTab].func(self.body) 
		end
	end
end
function PANEL:PerformLayout(w,h)
	self:Center()
	self.close:Dock(RIGHT)
	self.close:DockMargin(0, 0, 0, 1)
	self.body:DockMargin(1,0,0,0)
	self.body:SetTall(h)
	self.cats:Dock(FILL)
	self.cats:DockMargin(0, 0, 2, 1)
	for i = 1,#GI.tabs do
		self.sheets[i]:Dock(LEFT)
		self.sheets[i]:DockMargin(0, 0, 5, 0)
	end	
	self.Created = true
end


vgui.Register( "GI.Frame", PANEL, "Panel" )