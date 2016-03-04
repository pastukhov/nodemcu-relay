return function(req, res)
 res:addheader("Content-Type", "application/json; charset=utf-8")
 
 if req.body then
  
  local success, json = pcall(cjson.decode, req.body)
  if not success then
   error(json)
  end
  -- Decode json object from body
  if (json.pin ~= nil) then
   res:send(cjson.encode({status = "sucsess",pin = json.pin}))
   return
  end
 end
 
 res.statuscode = 400
 -- Create and encode result as json string
 local result = { code = 400, description = "Wrong API call" }
 res:send(cjson.encode(result))
 
end
