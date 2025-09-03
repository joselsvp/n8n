# 🚀 Guía de Despliegue en Render

## 📋 Pasos para Desplegar n8n en Render

### 1. Subir a GitHub

```bash
# Si no tienes un repositorio en GitHub, créalo primero
# Luego conecta tu repositorio local:

git remote add origin https://github.com/TU_USUARIO/TU_REPOSITORIO.git
git branch -M main
git push -u origin main
```

### 2. Desplegar en Render

#### Opción A: Usando Blueprint (Recomendado)

1. **Ve a [Render Dashboard](https://dashboard.render.com)**
2. **Click en "New +" → "Blueprint"**
3. **Conecta tu repositorio de GitHub**
4. **Render detectará automáticamente el archivo `render.yaml`**
5. **Click en "Apply"**

#### Opción B: Configuración Manual

1. **Ve a [Render Dashboard](https://dashboard.render.com)**
2. **Click en "New +" → "Web Service"**
3. **Conecta tu repositorio de GitHub**
4. **Configura el servicio:**
   - **Name**: `n8n-automation`
   - **Environment**: `Docker`
   - **Dockerfile Path**: `./Dockerfile`
   - **Plan**: `Starter` (gratuito)
   - **Region**: `Oregon` (o la más cercana)

### 3. Variables de Entorno

Render generará automáticamente:
- ✅ `N8N_BASIC_AUTH_USER` (usuario admin)
- ✅ `N8N_BASIC_AUTH_PASSWORD` (contraseña segura)
- ✅ `N8N_ENCRYPTION_KEY` (clave de encriptación)

### 4. Configuración Adicional

Si necesitas configurar variables adicionales:

```bash
# En el dashboard de Render, ve a Environment
# Agrega estas variables si es necesario:

N8N_WEBHOOK_URL=https://tu-app-name.onrender.com
N8N_DISABLE_UI=false
N8N_USER_MANAGEMENT_DISABLED=false
```

## 🔧 Configuración Post-Despliegue

### 1. Acceder a n8n

Una vez desplegado, podrás acceder a:
- **URL**: `https://tu-app-name.onrender.com`
- **Usuario**: El generado por Render
- **Contraseña**: La generada por Render

### 2. Configurar Webhooks

Actualiza la URL de webhook en Render:
```bash
N8N_WEBHOOK_URL=https://tu-app-name.onrender.com
```

### 3. Configurar Base de Datos (Opcional)

Para persistencia de datos, puedes agregar PostgreSQL:

1. **Crear base de datos en Render**
   - New + → PostgreSQL
   - Configurar según tus necesidades

2. **Agregar variables de entorno**
   ```bash
   DB_TYPE=postgresdb
   DB_POSTGRESDB_HOST=tu-host-postgres
   DB_POSTGRESDB_PORT=5432
   DB_POSTGRESDB_DATABASE=n8n
   DB_POSTGRESDB_USER=tu-usuario
   DB_POSTGRESDB_PASSWORD=tu-password
   ```

## 🚨 Consideraciones Importantes

### Plan Gratuito
- ⚠️ **Sleep**: La app se duerme después de 15 minutos de inactividad
- ⚠️ **Memoria**: Limitada a 512MB
- ⚠️ **CPU**: Limitada

### Plan Pago
- ✅ **Siempre activo**
- ✅ **Más memoria y CPU**
- ✅ **Mejor rendimiento**

## 🔍 Verificación del Despliegue

### 1. Health Check
```bash
curl https://tu-app-name.onrender.com/healthz
# Debería devolver: {"status":"ok"}
```

### 2. Logs
- Ve al dashboard de Render
- Click en tu servicio
- Ve a la pestaña "Logs"

### 3. Estado del Servicio
- Verifica que el estado sea "Live"
- Revisa que no haya errores en los logs

## 🛠️ Comandos Útiles

```bash
# Ver logs en tiempo real
# (Desde el dashboard de Render)

# Reiniciar servicio
# (Desde el dashboard de Render)

# Ver variables de entorno
# (Desde el dashboard de Render)
```

## 📞 Soporte

Si tienes problemas:
1. Revisa los logs en Render
2. Verifica las variables de entorno
3. Asegúrate de que el repositorio esté actualizado
4. Consulta la documentación de n8n

## 🎯 Próximos Pasos

1. **Desplegar**: Sigue los pasos anteriores
2. **Configurar**: Accede a n8n y configura tu primer workflow
3. **Automatizar**: Crea tus automatizaciones
4. **Monitorear**: Revisa logs y rendimiento
