AddCSLuaFile()
local lib = {
	enums = {
		CRIDENT_START = "start",
		CRIDENT_STOP = "stop",
		CRIDENT_RESTART= "restart", 
		CRIDENT_KILL = "kill"
	}
}




function lib:Internal(key, append, callback)
	http.Fetch("https://dino.gg/api/client/servers/" .. append, callback, nil, {
		["Content-Type"] = "application/json",
		["Accept"] = "application/vnd.dinopanel.v1+json",
		["Authorization"] = "Bearer " .. tostring(key)
	})
end

function lib:InternalPost(key, append, tbl, callback)
	http.Post("https://dino.gg/api/client/servers/" .. append, tbl, callback, nil, {
		["Content-Type"] = "application/json",
		["Accept"] = "application/vnd.dinopanel.v1+json",
		["Authorization"] = "Bearer " .. tostring(key)
	})
end

function lib:ServerConnection(key, serverid, callback)
	self:Internal(key, serverid, callback)
end

function lib:ServerUsage(key, serverid, callback)
	self:Internal(key, serverid .. "/utilization", callback)
end

function lib:ClientServers(key, callback)
	self:Internal(key, nil, callback)
end


if SERVER then
	function lib:PowerChange(key, serverid, type, callback)
		if !lib.enums[type] then return end
		self:InternalPost(key, serverid .. "/power", {["signal"] = type}, callback)
	end

	function lib:Command(key, serverid, command, callback)
		self:InternalPost(key, serverid .. "/command", {["command"] = command}, callback)
	end
end

return lib
