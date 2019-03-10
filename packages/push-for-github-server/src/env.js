const {
  NODE_ENV: NODE_ENV_RAW,
} = process.env

const NODE_ENV = NODE_ENV_RAW || 'development'

module.exports = {
  PORT: 3000,

  NODE_ENV,
  PRODUCTION: NODE_ENV === 'production',
  DEVELOPMENT: NODE_ENV === 'development',
}
