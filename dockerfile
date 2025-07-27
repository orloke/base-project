# Estágio de construção
FROM node:20-alpine AS builder

WORKDIR /app

# Copie package.json e package-lock.json
# Se você não tem package-lock.json, pode remover ele daqui,
# mas geralmente é boa prática tê-lo para builds consistentes.
COPY package.json package-lock.json ./

# Instale as dependências com npm
RUN npm ci
# Ou se preferir 'npm install'
# RUN npm install

# Copie o restante do código
COPY . .

# Construa o aplicativo Next.js
RUN npm run build

# Estágio de produção
FROM node:20-alpine AS runner

WORKDIR /app

# Variáveis de ambiente de produção
ENV NODE_ENV production

# Copie os arquivos de construção do estágio anterior
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/package-lock.json ./package-lock.json

EXPOSE 3000

# Comando para iniciar o aplicativo Next.js com npm
CMD ["npm", "start"]
