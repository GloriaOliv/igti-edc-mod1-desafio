# Referenciado o bucket AWS S3

resource "aws_s3_bucket" "datalake" {
  
  # parametros de configuracao
  #bucket = "${var.base_bucket_name}-${var.ambiente}-${var.nu_conta}"
  bucket = "${var.base_bucket_name}-${var.nu_conta}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }

}

resource "aws_s3_bucket_object" "codigo_spark" {

  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../etl/job_spark.py"
  etag   = filemd5("../etl/job_spark.py")
}

resource "aws_s3_bucket_object" "codigo_glue" {

  bucket = aws_s3_bucket.datalake.id
  key    = "glue-scripts/pyspark/glue_job_censo_from_tf.py"
  acl    = "private"
  source = "../etl/glue_job_censo.py"
  etag   = filemd5("../etl/glue_job_censo.py")
}
