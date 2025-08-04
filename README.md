# 🐳 Docker Home Lab

This project sets up and monitors a personal Docker-based home lab for media, automation, and DNS-level ad blocking. It is fully containerized and includes a service status checker written in Node.js.

## 📦 Included Services

| Service      | Port(s)    | Description                     |
| ------------ | ---------- | ------------------------------- |
| Portainer    | 9443, 9000 | Docker UI management            |
| Pi-hole      | 53, 80     | DNS server and ad blocker       |
| Plex         | various    | Media server                    |
| Komga        | 25600      | Comic/manga reader              |
| qBittorrent  | 8080, 6881 | Torrent client                  |
| Jackett      | 9117       | Indexer proxy for Sonarr/Radarr |
| Sonarr       | 8989       | TV series automation            |
| Radarr       | 7878       | Movie automation                |
| Lidarr       | 8686       | Music automation                |
| Overseerr    | 5055       | Media request platform          |
| Prowlarr     | 9696       | Indexer manager                 |
| FlareSolverr | 8191       | Cloudflare bypass helper        |

---

## 🚀 Usage

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/docker-home-lab.git
cd docker-home-lab
```

### 2. Start containers

```bash
docker compose up -d
```

### 3. Run status check

```bash
node test-home-lab.js
```

---

## 🔍 Service Monitoring (Node.js)

The `test-home-lab.js` script checks if each service is reachable and explains any HTTP response codes.

---

## 📁 Structure

```
docker-home-lab/
├── docker-compose.yml
├── test-home-lab.js
├── .gitignore
└── README.md
```

---

## 📜 License

MIT
