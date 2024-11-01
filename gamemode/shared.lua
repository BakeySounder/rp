AddCSLuaFile()

GM.Name 		= "Gmod Role Play"
GM.Author 		= "Bakey Sounder"
GM.Email 		= ""
GM.Website 		= ""
DeriveGamemode('sandbox')
function recursiveInclusion( scanDirectory, isGamemode )
	isGamemode = isGamemode or false
	local queue = { scanDirectory }
	while #queue > 0 do
		for _, directory in pairs( queue ) do
			 print( "Сканирование папки: ", directory )
			local files, directories = file.Find( directory .. "/*", "LUA" )
			for _, fileName in pairs( files ) do
				if fileName ~= "shared.lua" and fileName ~= "init.lua" and fileName ~= "cl_init.lua" then
					local relativePath = directory .. "/" .. fileName
					if isGamemode then
						relativePath = string.gsub( directory .. "/" .. fileName, GM.FolderName .. "/gamemode/", "" )
					end
					print( "Найдено: ", relativePath )
					if string.match( fileName, "^sv" ) then
						if SERVER then
							include( relativePath )
						end
					end
					if string.match( fileName, "^sh" ) then
						AddCSLuaFile( relativePath )
						include( relativePath )
					end
					if string.match( fileName, "^cl" ) then
						AddCSLuaFile( relativePath )
						if CLIENT then
							include( relativePath )
						end
					end
				end
			end
			for _, subdirectory in pairs( directories ) do
				print( "Найдена папка: ", subdirectory )
				table.insert( queue, directory .. "/" .. subdirectory )
			end
			table.RemoveByValue( queue, directory )
		end
	end
end

recursiveInclusion( GM.FolderName .. "/gamemode", true )
