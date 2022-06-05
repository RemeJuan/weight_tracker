import { model, Schema } from 'mongoose'
import jwt from 'jsonwebtoken'
import Joi from 'joi'
import { env } from 'process'

const userSchema = new Schema({
  firstName: {
    type: String,
    required: true,
  },
  lastName: {
    type: String,
    required: true,
  },
  username: {
    type: String,
    required: true,
    unique : true,
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
    firstName: Joi.string().required(),
    lastName: Joi.string().required(),
    username: Joi.string().required(),
    password: Joi.string().required(),
  })
  return schema.validate(user)
}
