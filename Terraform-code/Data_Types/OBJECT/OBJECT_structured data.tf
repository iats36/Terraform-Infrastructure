variable "person" {
  type = object({
    name = string
    age  = number
  })
  default = {
    name = "alice"
    age  = 25
  }
}