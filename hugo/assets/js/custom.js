// Enable CSS classes based on whether JS loads
document.documentElement.classList.remove('no-js')

// Get current weather
function getWeather() {
  const json_url = 'https://wttr.in/Portland?format=j1'
  let xhr = new XMLHttpRequest()
  xhr.open('GET', json_url, false)
  xhr.send(null)

  let weatherJSON = JSON.parse(xhr.responseText)
  let weatherCurrent = weatherJSON.current_condition[0]

  let weatherDesc = weatherCurrent.weatherDesc[0].value.toLowerCase()
  let weatherTemp = weatherCurrent.temp_F
  let weatherWindDir = weatherCurrent.winddir16Point
  let weatherWindSpeed = weatherCurrent.windspeedMiles

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
