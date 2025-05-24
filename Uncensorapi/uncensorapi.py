import requests

url,data = "https://goodbyesyntax-uncensorapi.glitch.me/uncensor",{"text": "Th1s 1s @ test"}

response = requests.post(url, json=data).json()["uncensored"]
