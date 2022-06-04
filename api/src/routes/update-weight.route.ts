import express from 'express'
import authMiddleware from '../middleware/auth.middleware'
import { UserWeight, validate } from '../models/user-weight.model'
const router = express.Router()

router.put('/', authMiddleware, async (req, res) => {
  const { error } = validate(req.body)
  if (error) return res.send(error.details[0].message, 400)
  
  const { err } = await UserWeight.findByIdAndUpdate(
    req.body.id,
    { weight: req.body.weight },
  )
  if (err) return res.send(error.details[0].message, 400)
  res.send()
})

export default router
