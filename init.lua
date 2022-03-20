local mesh = 'character.b3d'
local tex = 'character.png'
local fps = '30'
local function genfs()
    local fspec =
    "size[12,9]"..
    "field[8,0.5;4,1;mesh;Mesh:;"..mesh.."]"..
    "field[8,1.7;4,1;tex;Textures:;"..tex.."]"..
    "field[8,2.9;4,1;fps;Animation speed:;"..fps.."]"..
    "field_close_on_enter[mesh;false]"..
    "field_close_on_enter[tex;false]"..
    "field_close_on_enter[fps;false]"..
    "button[9,3.5;1.4,1;update;Update]"..
    "model[0,0;9,10.5;model;"..mesh..";"..tex..";0,180;;;;"..fps.."]"
    return fspec
end
minetest.register_chatcommand("modelv", {
    description = "Open model viewer",
    func = function(param)
core.show_formspec('modelview',genfs())
end})
core.register_on_formspec_input(function(formname, fields)
	if formname == "modelview" then
	if fields.update then
		mesh = fields.mesh
		tex = fields.tex
		fps = fields.fps
		core.display_chat_message(fields.anim)
		core.show_formspec('modelview',genfs())
	end
	end
end)
