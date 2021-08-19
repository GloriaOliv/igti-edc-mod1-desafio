resource "aws_glue_job" "glue_job_censo" {
  name     = "glue_job_censo"
  role_arn = aws_iam_role.glue_role.arn

  command {
    script_location = "s3://datalake-gloria-igti-edc-desafio-producao-556116348126/glue-scripts/pyspark/glue_job_censo.py"
  }
}