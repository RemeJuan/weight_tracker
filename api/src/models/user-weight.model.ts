import { model, Schema } from 'mongoose'
import Joi from 'joi'

const userWeightSchema = new Schema({
  weight: {
    type: Number,
    required: true,
  },
  userId: {
    type: String,
    required: true,
  }
},{
  toObject: { virtuals: true },
  toJSON: { virtuals: true },
})

export const UserWeight = model('userWeight', userWeightSchema)

userWeightSchema.virtual('created').get(function () {
  if (this['_created']) return this['_created']
  return this['_created'] = this._id.getTimestamp()
})

export const validate = (userWeight) => {
  const schema = Joi.object({
    id: Joi.string().optional(),
    weight: Joi.number().required()
  })
  return schema.validate(userWeight)
}
