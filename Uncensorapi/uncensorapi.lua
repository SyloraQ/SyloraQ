local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require("dkjson")

local request_body = json.encode({ text = "Th1s 1s @ test" })
local response_body = {}

local res, code, headers = http.request{
    url = "https://goodbyesyntax-uncensorapi.glitch.me/uncensor",
    method = "POST",
    headers = {
        ["Content-Type"] = "application/json",
        ["Content-Length"] = tostring(#request_body)
    },
    source = ltn12.source.string(request_body),
    sink = ltn12.sink.table(response_body)
}

local body = table.concat(response_body)
local data = json.decode(body)
print(data["uncensored"])
