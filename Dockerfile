FROM node:23
WORKDIR /app
COPY package*.json ./
RUN npm i
COPY . .
RUN npx prisma generate
RUN npm run build
CMD [ "npm", "run", "start:dev", "--", "-b", "swc" ]
