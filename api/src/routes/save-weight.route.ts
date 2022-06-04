import express from 'express'
import authMiddleware from '../middleware/auth.middleware'
import { UserWeight, validate } from '../models/user-weight.model'
const router = express.Router()

router.post('/', authMiddleware, async (req, res) => {
  const { error } = validate(req.body)
  if (error) return res.status(400).send(error.details[0].message)
  
  const weight = new UserWeight({ ...req.body, userId: req.user._id })
  weight.save()
  res.send(weight)
})

export default router
