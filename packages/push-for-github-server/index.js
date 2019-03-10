/* eslint no-console:0 */

const app = require('./src/app')
const { PORT } = require('./src/env')

const port = PORT || 3000

app.listen(port, err => {
  if (err) {
    return console.error('Failed', err)
  }
  console.log('Listening on port', port)
})
