// Enable CSS classes based on whether JS loads
document.documentElement.classList.remove('no-js')

// Get current weather
function getWeather() {
  const json_url = 'https://wttr.in/Portland?u&format=j1'
  let xhr = new XMLHttpRequest()
  xhr.open('GET', json_url, false)
  xhr.send(null)

  let weatherJSON = JSON.parse(xhr.responseText)

  let weatherDesc =
    weatherJSON.current_condition[0].weatherDesc[0].value.toLowerCase()
  let weatherTemp = weatherJSON.current_condition[0].temp_F
  let weatherWindDir = weatherJSON.current_condition[0].winddir16Point
  let weatherWindSpeed = weatherJSON.current_condition[0].windspeedMiles

  let weather =
    weatherDesc +
    ' and ' +
    weatherTemp +
    '°F, wind ' +
    weatherWindDir +
    ' at ' +
    weatherWindSpeed +
    'mph'

  return weather
}

// Embed weather
let weatherEl = document.getElementById('current-weather')
weatherEl.innerHTML = getWeather()
