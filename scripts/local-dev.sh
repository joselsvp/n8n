#!/bin/bash

# Script para desarrollo local de n8n

echo "🚀 n8n Local Development Script"
echo "================================"

case "$1" in
    "start")
        echo "Iniciando n8n en modo desarrollo..."
        docker-compose up -d
        echo "✅ n8n iniciado en http://localhost:5678"
        echo "📊 Para ver logs: docker-compose logs -f"
        ;;
    "stop")
        echo "Deteniendo n8n..."
        docker-compose down
        echo "✅ n8n detenido"
        ;;
    "restart")
        echo "Reiniciando n8n..."
        docker-compose restart
        echo "✅ n8n reiniciado"
        ;;
    "logs")
        echo "Mostrando logs de n8n..."
        docker-compose logs -f
        ;;
    "status")
        echo "Estado de n8n:"
        docker-compose ps
        ;;
    "reset")
        echo "⚠️  Reseteando n8n (eliminando datos)..."
        docker-compose down
        docker volume rm n8n_n8n_data 2>/dev/null || true
        docker-compose up -d
        echo "✅ n8n reseteado"
        ;;
    "auth-on")
        echo "Activando autenticación básica..."
        sed -i '' 's/N8N_BASIC_AUTH_ACTIVE=false/N8N_BASIC_AUTH_ACTIVE=true/' .env
        docker-compose restart
        echo "✅ Autenticación activada - Usuario: admin, Contraseña: password123"
        ;;
    "auth-off")
        echo "Desactivando autenticación básica..."
        sed -i '' 's/N8N_BASIC_AUTH_ACTIVE=true/N8N_BASIC_AUTH_ACTIVE=false/' .env
        docker-compose restart
        echo "✅ Autenticación desactivada"
        ;;
    *)
        echo "Uso: $0 {start|stop|restart|logs|status|reset|auth-on|auth-off}"
        echo ""
        echo "Comandos disponibles:"
        echo "  start     - Iniciar n8n"
        echo "  stop      - Detener n8n"
        echo "  restart   - Reiniciar n8n"
        echo "  logs      - Ver logs en tiempo real"
        echo "  status    - Ver estado del contenedor"
        echo "  reset     - Resetear n8n (eliminar datos)"
        echo "  auth-on   - Activar autenticación básica"
        echo "  auth-off  - Desactivar autenticación básica"
        echo ""
        echo "URL: http://localhost:5678"
        ;;
esac
