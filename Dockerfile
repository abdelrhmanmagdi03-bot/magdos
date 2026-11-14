FROM node as development


WORKDIR /Magdi 
copy package.json .
RUN npm install 
COPY .  .
EXPOSE 4000
CMD [ "npm", "run","start-dev" ]

FROM node as test

WORKDIR /Magdi 
copy package.json .
RUN npm install 
COPY .  .
EXPOSE 4000
CMD [ "npm", "run","start-dev" ]

FROM node as producation

WORKDIR /Magdi 
copy package.json .
RUN npm install --only=production
COPY .  .
#EXPOSE 4000
CMD [ "npm", "run","start" ]








