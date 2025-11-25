FROM node:22-alpine

WORKDIR /app

# Install deps
COPY package*.json ./
RUN npm ci && npm prune --omit=dev

# Copy the rest of the code
COPY . .

# Environment (adjust as you like)
ENV NODE_ENV=production
ENV PORT=80

# Expose the port the app listens on
EXPOSE 80

# Start the Express server that serves the cards
CMD ["node", "express.js"]
