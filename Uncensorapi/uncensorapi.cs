using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

class Program {
    static async Task Main() {
        using HttpClient client = new HttpClient();
        var content = new StringContent("{\"text\":\"Th1s 1s @ test\"}", Encoding.UTF8, "application/json");

        var response = await client.PostAsync("https://goodbyesyntax-uncensorapi.glitch.me/uncensor", content);
        var json = JObject.Parse(await response.Content.ReadAsStringAsync());
        Console.WriteLine(json["uncensored"]);
    }
}
