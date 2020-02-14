const express = require('express')
const nunjucks = require('nunjucks')

const port = process.env.PORT || 3000
const server = express()

nunjucks.configure('views', {
    autoescape: true,
    express: server,
    watch: true
});

server.get('/', (req, res) => {
    res.render('index.njk')
})

server.get('/donate', (req, res) => {
    res.render('donate.njk')
})

server.post('/apply', (req, res) => {
    res.send('Thanks')
})

server.listen(port)

module.exports = server