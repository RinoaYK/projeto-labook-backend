import z from 'zod'

export interface LoginInputDTO {
  email: string,
  password: string
}

export interface LoginOutputDTO {
  token: string
}

export const LoginSchema = z.object({
  email: z.string().email(),
  password: z.string().regex(/^(?=.*[A-Za-z]{5})(?=.*\d{2}).{7,}$/)
}).transform(data => data as LoginInputDTO)