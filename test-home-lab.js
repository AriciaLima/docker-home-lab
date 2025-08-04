// test-home-lab.js
import fetch from 'node-fetch'

const services = [
  { name: 'Portainer', url: 'https://localhost:9443' },
  { name: 'Portainer (HTTP)', url: 'http://localhost:9000' },
  { name: 'Komga', url: 'http://localhost:25600' },
  { name: 'Overseerr', url: 'http://localhost:5055' },
  { name: 'qBittorrent', url: 'http://localhost:8080' },
  { name: 'Jackett', url: 'http://localhost:9117' },
  { name: 'Sonarr', url: 'http://localhost:8989' },
  { name: 'Radarr', url: 'http://localhost:7878' },
  { name: 'Prowlarr', url: 'http://localhost:9696' },
  { name: 'Lidarr', url: 'http://localhost:8686' },
  { name: 'FlareSolverr', url: 'http://localhost:8191' },
  { name: 'Pi-hole', url: 'http://localhost/admin' }
]

const httpStatus = {
  200: '✅ OK',
  301: '↪️ Moved Permanently (redirect)',
  302: '↪️ Found (redirect)',
  307: '↪️ Temporary Redirect',
  308: '↪️ Permanent Redirect',
  403: '❌ Forbidden',
  404: '❌ Not Found',
  500: '❌ Internal Server Error'
}

console.log(
  `\n🔍 Checking Home Lab services on ${new Date().toLocaleString()}\n`
)
console.log('---------------------------------------------')

for (const service of services) {
  try {
    const res = await fetch(service.url, { method: 'GET' })
    const statusMsg = httpStatus[res.status] || `⚠️ Code ${res.status}`
    console.log(`${statusMsg} — ${service.name}`)
  } catch (err) {
    console.log(`❌ Error — ${service.name} (${err.message})`)
  }
}

console.log('---------------------------------------------')
console.log(`\n✅ All services checked at ${new Date().toLocaleTimeString()}\n`)
