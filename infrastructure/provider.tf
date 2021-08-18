provider "aws" {
  region = var.aws_region
}


# Centralizar o arquivo de controle de estado do terraform

# Onde:
# bucket = bucket do s3.
# key = nome do arquivo dentro do bucket.
# region = regiao a onde o s3 esta.

terraform {
  backend "s3" {
    bucket = "terraform-state-igti-ney"
    key    = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}