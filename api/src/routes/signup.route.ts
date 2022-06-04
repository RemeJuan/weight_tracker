import { User, validate } from '../models/user.model'
import bcrypt from 'bcrypt'
import express from 'express'
const router = express.Router()

router.post('/', async (req, res) => {
  try {
    const { error } = validate(req.body)
    if (error) return res.status(400).send(error.details[0].message)
    
    const user = new User(req.body)
    
    const salt = await bcrypt.genSalt(Number(process.env.SALT))
    user.password = await bcrypt.hash(user.password, salt)
    await user.save()
    
    res.send(user)
  } catch (error) {
    console.log(error)
    res.send('An error occurred')
  }
})

export default router
