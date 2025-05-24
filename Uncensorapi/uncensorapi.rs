use reqwest::Client;
use serde_json::json;

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    let client = Client::new();
    let res = client
        .post("https://goodbyesyntax-uncensorapi.glitch.me/uncensor")
        .json(&json!({ "text": "Th1s 1s @ test" }))
        .send()
        .await?
        .json::<serde_json::Value>()
        .await?;

    println!("{}", res["uncensored"]);
    Ok(())
}
