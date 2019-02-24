/**
 * Convert Kelvin temperature to Celsius
 * @param {Number} kelvin - Temperature in Kelvin
 * @returns {Number} - temperature in Celsius
 */
function k_to_c(kelvin) {
  return (kelvin - 273).toFixed(0);
}

/**
 * Convert Kelvin temperature to Fahrenheit
 * @param {Number} kelvin - Temperature in Kelvin
 * @returns {Number} - temperature in Fahrenheit
 */
function k_to_f(kelvin) {
  return (kelvin * (9 / 5) - 459.67).toFixed(0);
}

/**
 * Populate weather box with info fetched from OpenWeatherMap
 * @param {String} city - User's location
 * @param {String} temp_curr - Current temperature at user's location
 * @param {String} temp_low - Low temperature at user's location
 * @param {String} temp_high - High temperature at user's location
 * @param {String} description - Description of weather at user's location
 */
function insertWeatherInfo(city, temp_curr, temp_low, temp_high, description) {
  // document.querySelector('#city').textContent = city;
  document.querySelector('#description').textContent = description;
  document.querySelector('#temp_curr').innerHTML = `${temp_curr} &deg;`;
  // document.querySelector('#temp_low').innterHTML = `${temp_low} &deg; /`;
  // document.querySelector('#temp_high').innterHTML = `${temp_high} &deg;`;
}

const json_url =
  'http://api.openweathermap.org/data/2.5/weather?q=Paris,fra&appid=YOUR_API_KEY_HERE';
fetch(json_url)
  .then(res => res.json())
  .then(json_obj => {
    const {
      name: city,
      main: { temp: temp_curr, temp_min: temp_low, temp_max: temp_high },
      weather: [{ main: description }],
    } = json_obj;
    insertWeatherInfo(
      city,
      k_to_c(temp_curr),
      k_to_c(temp_low),
      k_to_c(temp_high),
      description
    );
  });
