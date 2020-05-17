AddCSLuaFile()
local lib = {}
local object = {__index=self}


function object:Internal(key, append, callback)
	http.Fetch("https://dino.gg/api/client/servers/" .. append, callback, nil, {
		["Content-Type"] = "application/json",
		["Accept"] = "application/vnd.dinopanel.v1+json",
		["Authorization"] = "Bearer " .. key
	})
end

function object:ServerConnection(callback)
	object:Internal(self.key, self.serverid, callback)
end

function object:ServerUsage(callback)
	self:Internal(self.key, self.serverid .. "/utilization", callback)
end

function object:ClientServers(callback)
	self:Internal(self.key, nil, callback)
end

function lib:Init(key, serverid)
	object.key = key
	object.serverid = serverid
	return object
end

return lib
