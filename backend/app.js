const express = require('express');

const contacts = require('./contacts.json');

const app = express();

const delay = ms => new Promise(resolve => setTimeout(resolve, ms));

app.get('/',(request, response) => {
    response.send("Flutter in Practice");
});
app.get('/contacts', async (request, response) => {
    const { q } = request.query

    console.log(`backend hit with: ${q}`);

    let r = contacts;

    if(q) {
        if(q === "le") await delay(2000);
        r = contacts.filter( ({ name }) =>  name.match(q));
    }

    response.json(r);
});

console.log("Escutando na porta 3000");
app.listen(3000);