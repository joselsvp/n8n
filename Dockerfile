# Use the official n8n Docker image as base
FROM n8nio/n8n:latest

# Install curl for health checks
USER root
RUN apk add --no-cache curl

# Create n8n user and set permissions
RUN mkdir -p /home/node/.n8n
RUN chown -R node:node /home/node/.n8n

# Switch back to n8n user
USER node

# Expose the port
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

# Start n8n
CMD ["npx", "n8n", "start"]
