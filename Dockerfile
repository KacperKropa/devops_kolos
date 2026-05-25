FROM node:20-alpine

WORKDIR /app

# Skopiowanie plików konfiguracyjnych dla menedżera pakietów
COPY package.json ./

# Instalacja tylko zależności produkcyjnych
RUN npm install --omit=dev

# Skopiowanie pozostałego kodu źródłowego
COPY . .

# Wystawienie portu, na którym działa aplikacja
EXPOSE 3000

# Użycie formy exec (tablicowej) dla prawidłowego propagowania sygnałów
CMD ["node", "src/server.js"]