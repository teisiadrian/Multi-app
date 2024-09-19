FROM node:14

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY . .

COPY wait-for-it.sh /usr/src/app/

RUN chmod +x /usr/src/app/wait-for-it.sh

EXPOSE 3001

# Run the app, but wait for MySQL to be ready first
CMD ["./wait-for-it.sh", "mysql", "3306", "--", "node", "app.js"]
