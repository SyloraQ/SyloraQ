import java.io.*;
import java.net.*;
import org.json.JSONObject;

public class Uncensor {
    public static void main(String[] args) throws Exception {
        String input = "{\"text\": \"Th1s 1s @ test\"}";
        URL url = new URL("https://goodbyesyntax-uncensorapi.glitch.me/uncensor");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();

        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; utf-8");
        con.setDoOutput(true);

        try(OutputStream os = con.getOutputStream()) {
            byte[] inputBytes = input.getBytes("utf-8");
            os.write(inputBytes, 0, inputBytes.length);
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
        StringBuilder response = new StringBuilder();
        String responseLine;
        while ((responseLine = br.readLine()) != null) {
            response.append(responseLine.trim());
        }

        JSONObject json = new JSONObject(response.toString());
        System.out.println(json.getString("uncensored"));
    }
}
