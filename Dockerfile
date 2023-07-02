FROM node:18
WORKDIR /cecy_api
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "npm", "run","start:dev"] 