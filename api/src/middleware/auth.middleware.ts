import jwt from 'jsonwebtoken'

export default (req, res, next) => {
  try {
    const token = req.header('x-auth-token')
    if (!token) return res.status(403).send('Access denied.')
    
    req.user = jwt.verify(token, process.env.JWTPRIVATEKEY)
    next()
  } catch (_) {
    res.status(400).send('Invalid token')
  }
}
