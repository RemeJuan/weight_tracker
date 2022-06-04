import { model, Schema } from 'mongoose'
import jwt from 'jsonwebtoken'
import Joi from 'joi'
import { env } from 'process'

const userSchema = new Schema({
  username: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
})

userSchema.methods.generateAuthToken = function () {
  return jwt.sign({ _id: this._id }, env.JWTPRIVATEKEY)
}

export const User =  model('user', userSchema)

export const validate = (user) => {
  const schema = Joi.object({
    username: Joi.string().required(),
    password: Joi.string().required(),
  })
  return schema.validate(user)
}
