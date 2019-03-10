const Koa = require('koa')
const logger = require('koa-logger')
const bodyParser = require('koa-bodyparser')
const cors = require('koa-cors')

const app = new Koa()

app.use(cors())
app.use(logger('dev'))
app.use(bodyParser())
app.use(ctx => ctx.body = { message: 'Hello World!' })

process.on('warning', e => console.warn(e.stack))

module.exports = app
