FROM node as development


WORKDIR /app 
copy package.json .
RUN npm install 
COPY .  .
EXPOSE 4000
CMD [ "npm", "run","start-dev" ]

FROM node as test

WORKDIR /app 
copy package.json .
RUN npm install 
COPY .  .
EXPOSE 4000
CMD [ "npm", "run","start-dev" ]

FROM node as producation

WORKDIR /app
copy package.json .
RUN npm install --only=production
COPY .  .
#EXPOSE 4000
CMD [ "npm", "run","start" ]








