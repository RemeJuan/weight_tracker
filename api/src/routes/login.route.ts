import { User, validate } from '../models/user.model'
import bcrypt from 'bcrypt'
import express from 'express'
const router = express.Router()

router.post('/', async (req, res) => {
  try {
    const { error } = validate(req.body)
    if (error) return res.status(400).send(error.details[0].message)
    
    const { email, password } = req.body
    
    const user = await User.findOne({ email: email })
    if (!user) return res.status(400).send('Invalid email or password')
    
    const validPassword = await bcrypt.compare(
      password,
      user.password
    )
    if (!validPassword)
      return res.status(400).send('Invalid email or password')
    
    const token = user.generateAuthToken()
    res.send({ ...user.toJSON(), token })
  } catch (error) {
    console.log(error)
    res.send('An error occurred')
  }
})

export default router
