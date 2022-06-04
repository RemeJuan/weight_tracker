import express from 'express'
import authMiddleware from '../middleware/auth.middleware'
import { UserWeight } from '../models/user-weight.model'
const router = express.Router()

router.get('/', authMiddleware, async (req, res) => {
  const weights = await UserWeight.find(
    { userId: req.user._id },
    {},
    { sort: { created: -1 } },
  )
  res.send(weights)
})

export default router
