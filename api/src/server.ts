import express from 'express'
import 'dotenv/config'
import connection from './db'
import cors from 'cors'

import swaggerUi from 'swagger-ui-express'
import swaggerDocument from './swagger.json'

import {
  signup,
  login,
  saveWeight,
  getWeight,
  updateWeight,
  deleteWeight
} from './routes/index.routes'

const app = express()
const port = process.env.PORT || 5006

new connection()

app.use(express.json())
app.use(cors())

app.use('/api/login', login)
app.use('/api/sign_up', signup)

app.use('/api/save_weight', saveWeight)
app.use('/api/get_weight_history', getWeight)
app.use('/api/update_weight', updateWeight)
app.use('/api/delete_weight', deleteWeight)

app.use('/api/docs', swaggerUi.serve)
app.get('/api/docs', swaggerUi.setup(swaggerDocument))
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok' })
})

app.listen(port, () => {
  console.log(`Listening on http://localhost:${port}`)
})
