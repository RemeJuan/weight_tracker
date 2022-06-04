import express from 'express'
import authMiddleware from '../middleware/auth.middleware'
import { UserWeight } from '../models/user-weight.model'
const router = express.Router()

router.delete('/:id', authMiddleware, async (req, res) => {
  const { error } = await UserWeight.findByIdAndDelete(req.params.id.trim())
  if (error) return res.status(400).send(error.details[0].message)
  
  res.send()
})

export default router
