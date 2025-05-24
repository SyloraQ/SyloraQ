#include <iostream>
#include <curl/curl.h>
#include <string>
#include <sstream>
#include <json/json.h>

size_t WriteCallback(void* contents, size_t size, size_t nmemb, void* userp) {
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}

int main() {
    CURL* curl = curl_easy_init();
    if (curl) {
        std::string readBuffer;
        struct curl_slist *headers = nullptr;
        headers = curl_slist_append(headers, "Content-Type: application/json");

        curl_easy_setopt(curl, CURLOPT_URL, "https://goodbyesyntax-uncensorapi.glitch.me/uncensor");
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, "{\"text\":\"Th1s 1s @ test\"}");
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);

        CURLcode res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);

        Json::Value jsonData;
        Json::CharReaderBuilder reader;
        std::istringstream s(readBuffer);
        std::string errs;
        Json::parseFromStream(reader, s, &jsonData, &errs);

        std::cout << jsonData["uncensored"].asString() << std::endl;
    }
    return 0;
}
