GI = GI or {}

function GI.ShowMenu()
	local scrw,scrh = ScrW(),ScrH()

	GI.Primary = vgui.Create('GI.Frame')
	GI.Primary:SetSize(scrw*.6,scrh*.7)

	return false
end

hook.Add('ScoreboardShow', 'GI.ShowMenu', GI.ShowMenu)