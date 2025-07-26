# Estágio de construção
FROM node:20-alpine AS builder

WORKDIR /app

# Copie package.json e package-lock.json (ou yarn.lock)
COPY package.json yarn.lock ./

# Instale as dependências
RUN yarn install --frozen-lockfile

# Copie o restante do código
COPY . .

# Construa o aplicativo Next.js
RUN yarn build

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

# Se você usa alguma variável de ambiente específica para o Next.js no runtime,
# certifique-se de passá-las aqui ou no Cloud Run.
# Exemplo: ENV NEXT_PUBLIC_API_URL=https://api.example.com

EXPOSE 3000

# Comando para iniciar o aplicativo Next.js
CMD ["npm", "start"]
