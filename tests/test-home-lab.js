// @ts-check
// 🧪 Docker Home Lab Service Checker

import fetch from 'node-fetch';
import https from 'https';

// Allow self-signed certificates (e.g., Portainer)
const agent = new https.Agent({ rejectUnauthorized: false });

// Services to check
const services = [
  { name: 'Portainer (HTTPS)', url: 'https://localhost:9443', secure: true },
  { name: 'Portainer (HTTP)', url: 'http://localhost:9000' },
  { name: 'Komga', url: 'http://localhost:25600' },
  { name: 'Overseerr', url: 'http://localhost:5055' },
  { name: 'qBittorrent', url: 'http://localhost:8080' },
  { name: 'Jackett', url: 'http://localhost:9117/UI/Dashboard/' },
  { name: 'Sonarr', url: 'http://localhost:8989' },
  { name: 'Radarr', url: 'http://localhost:7878' },
  { name: 'Prowlarr', url: 'http://localhost:9696' },
  { name: 'Lidarr', url: 'http://localhost:8686' },
  { name: 'FlareSolverr', url: 'http://localhost:8191' },
  { name: 'Pi-hole', url: 'http://localhost/admin' },
];

// Optional visual messages per status code
const httpStatus = {
  200: '✅ OK',
  301: '↪ Moved Permanently',
  302: '↪ Found',
  307: '↪ Temporary Redirect',
  308: '↪ Permanent Redirect',
  403: '⛔ Forbidden',
  404: '❌ Not Found',
  500: '💥 Internal Server Error',
};

console.log(`\n🔍 Checking Docker Home Lab services on ${new Date().toLocaleString()}`);
console.log('------------------------------------------------------------');

for (const service of services) {
  const name = service.name.padEnd(25);
  try {
    const res = await fetch(service.url, { method: 'GET', agent: service.secure ? agent : undefined });
    const msg = httpStatus[res.status] || `⚠️ Code ${res.status}`;
    console.log(`${name} → ${msg}`);
  } catch (err) {
    console.log(`${name} → ❌ Error (${err.message})`);
  }
}

console.log('------------------------------------------------------------');
console.log(`\n✅ All services checked at ${new Date().toLocaleTimeString()}\n`);
