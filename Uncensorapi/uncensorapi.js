const fetch = require('node-fetch');

const url = "https://goodbyesyntax-uncensorapi.glitch.me/uncensor";
const data = { text: "Th1s 1s @ test" };

fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
})
.then(res => res.json())
.then(json => console.log(json.uncensored));
