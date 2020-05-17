AddCSLuaFile()
local lib = {}

function lib:Internal(key, append, callback)
	http.Fetch("https://dino.gg/api/client/servers/" .. append, callback, nil, {
		["Content-Type"] = "application/json",
		["Accept"] = "application/vnd.dinopanel.v1+json",
		["Authorization"] = "Bearer " .. tostring(key)
	})
	hook.Call("CRIDENTLIB_Fetch", nil, append)
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


return lib
