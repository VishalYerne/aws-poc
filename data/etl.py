import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Initialize Glue Context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init("glue-etl-job", getResolvedOptions(sys.argv, []))

# Load Data from Source S3
source_df = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options={"paths": ["s3://source-s3-bucket/initial_data.csv"]},
    format="csv"
)

# Transform Data (Example: Convert to Parquet)
transformed_df = source_df.toDF()
transformed_df.write.parquet("s3://dest-s3-bucket/output/")

# Commit Glue Job
job.commit()
