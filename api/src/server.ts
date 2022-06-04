import express from 'express'
import 'dotenv/config'
import connection from './db'

import { signup, login, saveWeight, getWeight } from './routes/index.routes'

const app = express()
const port = process.env.PORT || 5006

new connection()

app.use(express.json())
app.use('/login', login)
app.use('/sign_up', signup)

app.use('/save_weight', saveWeight)
app.use('/get_weight_history', getWeight)

app.get('/health', (req, res) => {
  res.json({ status: 'ok' })
})

app.listen(port, () => {
  console.log(`Listening on http://localhost:${port}`)
})
