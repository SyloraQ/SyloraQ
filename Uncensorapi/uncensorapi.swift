import Foundation

let url = URL(string: "https://goodbyesyntax-uncensorapi.glitch.me/uncensor")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let body = ["text": "Th1s 1s @ test"]
request.httpBody = try? JSONSerialization.data(withJSONObject: body)

let task = URLSession.shared.dataTask(with: request) { data, _, _ in
    if let data = data,
       let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
       let uncensored = json["uncensored"] as? String {
        print(uncensored)
    }
}
task.resume()
