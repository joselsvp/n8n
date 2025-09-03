# 🆓 Despliegue en Render - Plan Gratuito

## ⚠️ Información Importante sobre el Plan Gratuito

### 🔄 **Características del Plan Gratuito:**

✅ **Gratis**: Sin costo alguno
✅ **512MB RAM**: Suficiente para n8n básico
✅ **0.1 CPU**: Para workflows simples
✅ **Sleep automático**: Se duerme después de 15 minutos de inactividad
✅ **Despertar automático**: Se activa cuando recibe una petición

### ⚠️ **Limitaciones del Plan Gratuito:**

- **Sleep**: La app se duerme después de 15 minutos sin actividad
- **Tiempo de despertar**: 30-60 segundos para activarse
- **Memoria limitada**: 512MB (suficiente para n8n básico)
- **CPU limitada**: 0.1 CPU (para workflows simples)
- **Sin persistencia**: Los datos se pueden perder al reiniciar

## 🚀 **Pasos para Desplegar en Plan Gratuito:**

### 1. **Actualizar el repositorio**
```bash
git push origin main
```

### 2. **Desplegar en Render**
1. Ve a [Render Dashboard](https://dashboard.render.com)
2. Click "New +" → "Blueprint"
3. Conecta tu repositorio
4. Render detectará el `render.yaml` actualizado
5. Click "Apply"

### 3. **Configuración Automática**
Render configurará automáticamente:
- ✅ Plan gratuito
- ✅ Variables de entorno
- ✅ Credenciales seguras
- ✅ URL de webhook

## 🔧 **Configuración Recomendada para Plan Gratuito:**

### Variables de Entorno Optimizadas:
```bash
N8N_PAYLOAD_SIZE_MAX=8          # Reducido para ahorrar memoria
N8N_METRICS=false              # Deshabilitar métricas
N8N_LOG_LEVEL=warn             # Solo logs importantes
N8N_EXECUTION_TIMEOUT=300      # 5 minutos máximo
```

### Workflows Optimizados:
- **Evita workflows complejos** que consuman mucha memoria
- **Usa timeouts cortos** en tus workflows
- **Evita procesamiento de archivos grandes**
- **Usa webhooks simples** en lugar de polling frecuente

## 🎯 **Casos de Uso Ideales para Plan Gratuito:**

✅ **Automatizaciones simples**
✅ **Webhooks básicos**
✅ **Integraciones simples**
✅ **Workflows de notificación**
✅ **Procesamiento de datos pequeños**

❌ **Procesamiento de archivos grandes**
❌ **Workflows complejos con muchos nodos**
❌ **Aplicaciones que requieren estar siempre activas**
❌ **Procesamiento de datos masivos**

## 🔄 **Manejo del Sleep Mode:**

### **¿Qué pasa cuando se duerme?**
- La app se detiene después de 15 minutos de inactividad
- Los datos en memoria se pierden
- La base de datos SQLite se mantiene

### **¿Cómo despertarla?**
- **Automático**: Se activa cuando recibe una petición HTTP
- **Tiempo**: 30-60 segundos para estar completamente activa
- **Webhook**: Los webhooks la despertarán automáticamente

### **Estrategias para mantener activa:**
1. **Uptime Robot**: Servicio gratuito que hace ping cada 5 minutos
2. **Cron job**: Workflow que se ejecuta cada 10 minutos
3. **Webhook externo**: Servicio que llama a tu webhook periódicamente

## 📊 **Monitoreo del Plan Gratuito:**

### **Métricas importantes:**
- **Tiempo de respuesta**: Puede ser lento al despertar
- **Memoria**: Monitorea el uso de RAM
- **Logs**: Revisa errores de memoria

### **Señales de que necesitas upgrade:**
- Errores de memoria frecuentes
- Tiempos de respuesta muy lentos
- Workflows que fallan por timeout
- Necesidad de estar siempre activo

## 💡 **Consejos para Optimizar:**

1. **Workflows eficientes**: Usa solo los nodos necesarios
2. **Timeouts cortos**: Configura timeouts apropiados
3. **Logs mínimos**: Solo logs de error y warning
4. **Datos pequeños**: Evita procesar archivos grandes
5. **Webhooks simples**: Usa webhooks en lugar de polling

## 🔄 **Upgrade a Plan Pago:**

Si necesitas más recursos:
1. Ve al dashboard de Render
2. Click en tu servicio
3. Click "Settings" → "Plan"
4. Selecciona el plan que necesites

## 🎉 **¡Listo para Desplegar!**

Con el plan gratuito configurado, puedes desplegar n8n sin costo alguno. Es perfecto para:
- **Aprender n8n**
- **Automatizaciones personales**
- **Proyectos pequeños**
- **Prototipos**

¿Quieres proceder con el despliegue en plan gratuito?
