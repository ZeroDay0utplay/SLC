import requests
import base64

url = "http://127.0.0.1:3000/test"
jsonOBJ = {"topic": "letters"}


res = requests.get(url, json=jsonOBJ)
if res.status_code == 200: jsonData = res.json()
else : exit()
decodedString = base64.b64decode(jsonData)

with open("lett.mp3", "wb") as f:
    f.write(decodedString)