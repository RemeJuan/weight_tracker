import { loginValidate, User } from '../models/user.model'
import bcrypt from 'bcrypt'
import express from 'express'
const router = express.Router()

router.post('/', async (req, res) => {
  try {
    const { error } = loginValidate(req.body)
    if (error) return res.send(error.details[0].message, 400)
    
    const { username, password } = req.body
    
    const user = await User.findOne({ username: username })
    if (!user) return res.send('Invalid username or password', 400)
    
    const validPassword = await bcrypt.compare(
      password,
      user.password
    )
    if (!validPassword)
      return res.send('Invalid username or password', 400)
    
    const token = user.generateAuthToken()
    res.send({ ...user.toJSON(), token })
  } catch (error) {
    console.log(error)
    res.send('An error occurred')
  }
})

export default router
