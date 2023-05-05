import z from 'zod'

export interface SignupInputDTO {
  name: string,
  email: string,
  password: string
}

export interface SignupOutputDTO {
  token: string
}

// export const SignupSchema = z.object({
//   name: z.string().min(2),
//   email: z.string().email(),
//   password: z.string().min(5)
// }).transform(data => data as SignupInputDTO)

export const SignupSchema = z.object({
  name: z.string().min(2),
  email: z.string().email(),
  password: z.string().regex(/^(?=.*[A-Za-z]{5})(?=.*\d{2}).{7,}$/)
}).transform(data => data as SignupInputDTO)

// export const SignupSchema = z.object({
//   name: z.string().min(2),
//   email: z.string().email(),
//   password: z.string().refine(value => {
//     const hasMinimumLength = value.length >= 7;
//     const hasTwoNumbers = /\d.*\d/.test(value);
//     const hasFiveLetters = /[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z]/.test(value);
//     return hasMinimumLength && hasTwoNumbers && hasFiveLetters;
//   }, {
//     message: 'Password must have at least 7 characters, 2 numbers and 5 letters'
//   })
// }).transform(data => data as SignupInputDTO);
