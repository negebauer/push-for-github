FROM node:alpine

WORKDIR /server

COPY package.json .
RUN yarn --production=true --frozen-lockfile --non-interactive

ENV PORT 3000
EXPOSE 3000

COPY . .

CMD ["yarn", "start"]
