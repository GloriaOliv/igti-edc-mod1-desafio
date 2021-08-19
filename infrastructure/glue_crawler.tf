resource "aws_glue_catalog_database" "censo_glue" {
    name = "db_censo_glue"
}

resource "aws_glue_crawler" "censo_glue" {
  database_name = aws_glue_catalog_database.censo.name
  name          = "censo_crawler_glue"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.datalake.id}/staging-zone/censo-glue/NU_ANO_CENSO=2020/"
  }
}

resource "aws_glue_catalog_database" "censo_emr" {
    name = "db_censo_emr"
}

resource "aws_glue_crawler" "censo_emr" {
  database_name = aws_glue_catalog_database.censo.name
  name          = "censo_crawler_emr"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.datalake.id}/staging-zone/censo-emr/NU_ANO_CENSO=2020/"
  }
}