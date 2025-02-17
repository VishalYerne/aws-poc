import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Fetch arguments
args = getResolvedOptions(sys.argv, ['source_bucket', 'dest_bucket'])

source_bucket = args['source_bucket']
dest_bucket = args['dest_bucket']

# Initialize Glue Context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init("glue-etl-job", args)

# Load Data from Source S3
source_df = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options={"paths": [f"s3://{source_bucket}/initial_data.csv"]},
    format="csv",
    format_options={"withHeader": True, "separator": ","}
)

# Transform Data (Example: Convert to Parquet)
transformed_df = source_df.toDF()
transformed_df.write.mode("overwrite").parquet(f"s3://{dest_bucket}/output/")

# Commit Glue Job
job.commit()
