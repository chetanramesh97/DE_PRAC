gcloud dataproc jobs submit pyspark \
  --cluster=cluster-de-usecase \
  --region=us-central1 \
  --properties="spark.driver.memory=2g,spark.executor.memory=2g,spark.executor.instances=4,spark.executor.cores=2,spark.submit.deployMode=client,spark.sql.shuffle.partitions=10,spark.shuffle.spill.compress=true" \
  /home/chetandeprac/project/Usecase4_GcpGcsReadWritehive_cloud.py

if [ $? -ne 0 ]; then
  echo "$(date) - Error occurred in the PySpark job" > /tmp/gcp_pyspark_schedule.log
else
  echo "$(date) - PySpark job completed successfully" > /tmp/gcp_pyspark_schedule.log
fi

echo "$(date) - gcloud PySpark ETL script completed" >> /tmp/gcp_pyspark_schedule.log
