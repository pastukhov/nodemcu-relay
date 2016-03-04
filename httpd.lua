
tmr.alarm(2,1000,tmr.ALARM_AUTO, function() 
    print('Waiting for a network')
    if wifi.sta.status() == wifi.STA_GOTIP then 
        print('Got a network')
        tmr.stop(2)
	-- espress dependency
	local espress = require 'espress'
	local port = 80
	-- create server instance
	local server = espress.createserver()
	-- use auto router (all files uploaded as static/*.* will be read)
	server:use("routes_auto.lc")
	server:listen(port)
    end
end)
