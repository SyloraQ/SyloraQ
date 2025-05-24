extends Node

func _ready():
    var url = "https://goodbyesyntax-uncensorapi.glitch.me/uncensor"
    var body = {"text": "Th1s 1s @ test"}
    var json_body = JSON.print(body)

    var http = HTTPRequest.new()
    add_child(http)
    http.connect("request_completed", self, "_on_request_completed")
    http.request(url, ["Content-Type: application/json"], true, HTTPClient.METHOD_POST, json_body)

func _on_request_completed(result, response_code, headers, body):
    var json = JSON.parse(body.get_string_from_utf8())
    if json.error == OK:
        print(json.result["uncensored"])
