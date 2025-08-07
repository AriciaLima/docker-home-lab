#!/bin/bash

# 🧪 Docker Home Lab Service Checker (by Arícia)
# Checks each service, returns HTTP status and explanation.

SERVICES=(
  "Portainer|https://localhost:9443"
  "Portainer (HTTP)|http://localhost:9000"
  "Komga|http://localhost:25600"
  "Overseerr|http://localhost:5055/login"
  "qBittorrent|http://localhost:8080"
  "Jackett|http://localhost:9117/UI/Dashboard/"
  "Sonarr|http://localhost:8989"
  "Radarr|http://localhost:7878"
  "Prowlarr|http://localhost:9696"
  "Lidarr|http://localhost:8686"
  "FlareSolverr|http://localhost:8191"
  "Pi-hole|http://localhost/admin/login"
)

# 📅 Header
echo -e "\n🔍 Verificando serviços do Home Lab"
echo "🕒 Data: $(date)"
echo "------------------------------------------------------------"

# 🔁 Status code descriptions
get_status_description() {
  case "$1" in
    200) echo "✅ OK - Resposta correta" ;;
    301) echo "↪ Redirect permanente (HTTP > HTTPS?)" ;;
    302) echo "↪ Redirect temporário" ;;
    307) echo "↪ Redirect mantido (POST > POST)" ;;
    308) echo "↪ Redirect permanente (POST mantido)" ;;
    401) echo "🔒 Autenticação necessária" ;;
    403) echo "⛔ Acesso proibido" ;;
    404) echo "❌ Não encontrado (rota errada?)" ;;
    500) echo "💥 Erro interno do servidor" ;;
    502) echo "🚧 Bad Gateway (proxy?)" ;;
    503) echo "🚫 Serviço indisponível" ;;
    000) echo "❌ Sem resposta (timeout ou offline)" ;;
    *)   echo "❓ Código desconhecido" ;;
  esac
}

# 🔄 Loop pelos serviços
for service in "${SERVICES[@]}"; do
  IFS="|" read -r name url <<< "$service"

  # Curl para pegar o status
  code=$(curl -k -s -o /dev/null -w "%{http_code}" --max-time 3 "$url")
  [[ -z "$code" ]] && code="000"
  desc=$(get_status_description "$code")

  printf "🔧 %-22s → Código: %-3s | %s\n" "$name" "$code" "$desc"
done

echo "------------------------------------------------------------"
