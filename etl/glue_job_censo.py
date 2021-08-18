import sys
from pyspark.context import SparkContext
from awsglue.utils import getResolvedOptions
from awsglue.context import GlueContext
from awsglue.job import Job

# params:['JOB_NAME']
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext=GlueContext(sc)
spark = glueContext.sparkSession
job = Job(glueContext)
job.init(args['JOB_NAME'], args)


# A partir daqui o mesmo código executado no EMR


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

(
    censo
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("NU_ANO_CENSO")
    .save("s3://datalake-gloria-igti-edc-desafio-producao-556116348126/staging-zone/censo-glue/")
)