import mongoose from 'mongoose'
import { env } from 'process'

export default class DB {
  constructor() {
    mongoose.connect(`${env.DB}`, {
      // eslint-disable-next-line @typescript-eslint/ban-ts-comment
      // @ts-ignore
      useNewUrlParser: true,
      useUnifiedTopology: true,
    })
    mongoose.connection.on('error', console.error.bind(console, 'connection error:'))
    mongoose.connection.once('open', () => {
      console.log('Connected to DB')
    })
  }
}
