from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
SparkSession.builder.appName("DesafioSpark")
    .getOrCreate()
)


# Ler os dados no Censo 2020
censo = ( 
    spark
    .read
    .format("CSV")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", "|")
    .load("s3://datalake-gloria-igti-edc-desafio/raw-data/")

)

# Criando arquivos parquet. 
# Atenção: Esse command não será executado neste notebook!

(
    censo
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("NU_ANO_CENSO")
    .save("s3://datalake-gloria-igti-edc-desafio-producao-556116348126/staging-zone/censo-emr/")
)