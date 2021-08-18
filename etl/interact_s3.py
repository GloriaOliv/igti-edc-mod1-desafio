
import boto3
import pandas as pd


# Criar um cliente para interagir com o AWS S3
s3_client = boto3.client('s3')

#s3_client.upload_file("raw-data/matricula_co.CSV",
#                      "datalake-gloria-igti-edc-desafio",
#					   "raw-data/matricula_co.CSV")

#s3_client.upload_file("raw-data/matricula_nordeste.CSV",
#                     "datalake-gloria-igti-edc-desafio",
#					  "raw-data/matricula_nordeste.CSV")

#s3_client.upload_file("raw-data/matricula_norte.CSV",
#                   "datalake-gloria-igti-edc-desafio",
#					  "raw-data/matricula_norte.CSV") 


#s3_client.upload_file("raw-data/matricula_sudeste.CSV",
#                     "datalake-gloria-igti-edc-desafio",
#					  "raw-data/matricula_sudeste.CSV")

#s3_client.upload_file("raw-data/matricula_sul.CSV",
#                     "datalake-gloria-igti-edc-desafio",
#					  "raw-data/matricula_sul.CSV")               