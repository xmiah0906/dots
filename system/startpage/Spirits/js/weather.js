var json_url = "http://api.openweathermap.org/data/2.5/weather?q=60646,ma&appid=6e131a2916d5d45d8367b72a4675be0a";
var city;
var temp_curr;
var temp_low;
var temp_high;
var description;
$.when($.getJSON(json_url).done( function(json_obj) {
        city = json_obj["name"];
        temp_curr = k_to_f(json_obj["main"]["temp"]);
        description = json_obj["weather"][0]["main"];
        insertWeatherInfo();
});
function k_to_f(kelvin) {
        return ( (kelvin - 273.15) + 32).toFixed(0);
}
function insertWeatherInfo() {
        $("#description").append(description);
        $("#temp_curr").prepend(temp_curr + "&deg;");
}