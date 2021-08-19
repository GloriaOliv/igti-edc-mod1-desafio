# Este script contem todas as variaveis usadas
variable "base_bucket_name" {
  default = "datalake-gloria-igti-edc-desafio"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "ambiente" {
  default = "producao"
}

variable "nu_conta"{
  default = "556116348126"
}

variable "lambda_function_name" {
  default = "IGTIexecutaEMRaovivo"
}

variable "key_pair_name" {
  default = "gloria-igti-teste"
}