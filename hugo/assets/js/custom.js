// Enable CSS classes based on whether JS loads
document.documentElement.classList.remove('no-js')

// Get current weather
function getWeather() {
  const json_url = 'https://wttr.in/Portland,+OR?format=j1'
  let xhr = new XMLHttpRequest()
  xhr.open('GET', json_url, false)
  xhr.send(null)

  let weatherJSON = JSON.parse(xhr.responseText)
  let weatherCurrent = weatherJSON.current_condition[0]

  let weatherDesc = weatherCurrent.weatherDesc[0].value.toLowerCase()
  let weatherTemp = weatherCurrent.temp_F
  let weatherWindDir = weatherCurrent.winddir16Point
  let weatherWindSpeed = weatherCurrent.windspeedMiles

  let baseWeather = weatherDesc + ' and ' + weatherTemp + '°F'

  let windWeather = ''
  if (weatherWindSpeed !== '0') {
    windWeather = ', wind ' + weatherWindDir + ' at ' + weatherWindSpeed + 'mph'
  }

  let weather = baseWeather + windWeather

  return weather
}

// Embed weather
let weatherEl = document.getElementById('current-weather')
if (weatherEl) {
  weatherEl.innerHTML = getWeather()
}
