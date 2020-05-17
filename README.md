# gmod-crident-lib
Crident API Library for Gmod with Object Oriented Programming

Using this library is extremely simple,

```lua
  local lib = include("cridentlib.lua")
  
  local obj = lib:Init(APIKEY, SERVERID)
```
<br>
Replace APIKEY with your Crident dino.gg API Key

Replace SERVERID with the ID found in the URL of your server

<br>

Use obj for the following functions

All functions callback data from http.Fetch

In the callback make sure to use ``util.JSONToTable()``
<br><br><br>
``obj:ServerConnection(callback)`` 

Returns [The Server](https://docs.dino.gg/#get-a-specific-server)
<br>
<br>
<br>
``obj:ServerUsage(callback)``

Returns [Server Usage](https://docs.dino.gg/#get-server-resource-usage)
<br>
<br>
<br>
``obj:ClientServers(callback)``

Returns [All Your Servers](https://docs.dino.gg/#get-all-servers)
