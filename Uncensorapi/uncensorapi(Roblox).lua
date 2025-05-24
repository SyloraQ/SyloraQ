local HttpService = game:GetService("HttpService")

local data = HttpService:JSONEncode({ text = "Th1s 1s @ test" })
local response = HttpService:PostAsync("https://goodbyesyntax-uncensorapi.glitch.me/uncensor", data, Enum.HttpContentType.ApplicationJson)

local result = HttpService:JSONDecode(response)
print(result.uncensored)
