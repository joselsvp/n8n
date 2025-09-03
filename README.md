# n8n en Render

Este proyecto configura n8n para ser desplegado en Render, una plataforma de hosting en la nube.

## 🚀 Características

- ✅ Configuración optimizada para Render
- ✅ Dockerfile personalizado
- ✅ Variables de entorno configuradas
- ✅ Autenticación básica habilitada
- ✅ Health checks incluidos
- ✅ Configuración de timezone para México

## 📋 Prerrequisitos

- Cuenta en [Render](https://render.com)
- Git configurado
- Docker (para desarrollo local)

## 🛠️ Configuración Local

### 1. Clonar el repositorio
```bash
git clone <tu-repositorio>
cd n8n-render-deployment
```

### 2. Configurar variables de entorno
```bash
cp env.example .env
# Edita el archivo .env con tus configuraciones
```

### 3. Ejecutar localmente con Docker
```bash
# Desarrollo
npm run dev

# O directamente con docker-compose
docker-compose up
```

### 4. Acceder a n8n
- URL: http://localhost:5678
- Usuario: admin
- Contraseña: password123 (cambiar en producción)

## 🌐 Despliegue en Render

### Opción 1: Usando render.yaml (Recomendado)

1. **Sube tu código a GitHub**
   ```bash
   git add .
   git commit -m "Initial n8n configuration for Render"
   git push origin main
   ```

2. **Conecta con Render**
   - Ve a [Render Dashboard](https://dashboard.render.com)
   - Click en "New +" → "Blueprint"
   - Conecta tu repositorio de GitHub
   - Render detectará automáticamente el archivo `render.yaml`

3. **Configura las variables de entorno**
   - Render generará automáticamente las credenciales
   - Puedes personalizar otras variables en el dashboard

### Opción 2: Configuración Manual

1. **Crear nuevo Web Service**
   - Ve a Render Dashboard
   - Click en "New +" → "Web Service"
   - Conecta tu repositorio

2. **Configurar el servicio**
   - **Name**: n8n-automation
   - **Environment**: Docker
   - **Dockerfile Path**: ./Dockerfile
   - **Plan**: Starter (gratuito)
   - **Region**: Oregon (o la más cercana)

3. **Variables de entorno**
   ```
   N8N_HOST=0.0.0.0
   N8N_PORT=5678
   N8N_PROTOCOL=https
   GENERIC_TIMEZONE=America/Mexico_City
   N8N_BASIC_AUTH_ACTIVE=true
   N8N_BASIC_AUTH_USER=admin
   N8N_BASIC_AUTH_PASSWORD=tu-password-seguro
   N8N_ENCRYPTION_KEY=tu-clave-de-32-caracteres
   ```

## 🔧 Configuración Avanzada

### Base de Datos PostgreSQL (Opcional)

Para usar PostgreSQL en lugar de SQLite:

1. **Crear base de datos en Render**
   - New + → PostgreSQL
   - Configurar según tus necesidades

2. **Agregar variables de entorno**
   ```
   DB_TYPE=postgresdb
   DB_POSTGRESDB_HOST=tu-host-postgres
   DB_POSTGRESDB_PORT=5432
   DB_POSTGRESDB_DATABASE=n8n
   DB_POSTGRESDB_USER=tu-usuario
   DB_POSTGRESDB_PASSWORD=tu-password
   ```

### Configuración de Email (Opcional)

Para notificaciones por email:

```
N8N_EMAIL_MODE=smtp
N8N_SMTP_HOST=tu-servidor-smtp
N8N_SMTP_PORT=587
N8N_SMTP_USER=tu-email
N8N_SMTP_PASS=tu-password
N8N_SMTP_SENDER=tu-email@dominio.com
```

## 🔒 Seguridad

### Variables Importantes

- **N8N_ENCRYPTION_KEY**: Clave de 32 caracteres para encriptar datos
- **N8N_BASIC_AUTH_PASSWORD**: Contraseña segura para acceso
- **WEBHOOK_URL**: URL correcta de tu aplicación en Render

### Generar Clave de Encriptación

```bash
# Generar clave aleatoria de 32 caracteres
node -e "console.log(require('crypto').randomBytes(16).toString('hex'))"
```

## 📊 Monitoreo

- **Health Check**: `/healthz`
- **Métricas**: Habilitadas por defecto
- **Logs**: Disponibles en el dashboard de Render

## 🚨 Solución de Problemas

### Error de Puerto
Si n8n no inicia, verifica que `N8N_PORT` coincida con `PORT` de Render.

### Error de Webhook
Asegúrate de que `WEBHOOK_URL` apunte a tu URL de Render.

### Problemas de Memoria
En el plan gratuito, considera:
- Reducir `N8N_PAYLOAD_SIZE_MAX`
- Deshabilitar métricas si no las necesitas
- Optimizar workflows complejos

## 📚 Recursos

- [Documentación de n8n](https://docs.n8n.io/)
- [Documentación de Render](https://render.com/docs)
- [n8n en Docker](https://docs.n8n.io/hosting/installation/docker/)

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📄 Licencia

MIT License - ver archivo LICENSE para detalles.
