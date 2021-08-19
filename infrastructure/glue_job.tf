resource "aws_glue_job" "censo_glue_job" {
  name     = "censo_glue_job"
  role_arn = aws_iam_role.IGTIAWSGlueServiceRole.arn

  command {
    script_location = "s3://datalake-gloria-igti-edc-desafio-producao-556116348126/glue-scripts/pyspark/glue_job_censo.py"
  }
}