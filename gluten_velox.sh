# Specify where the gluten jar is.
export gluten_jar=$GLUTEN_HOME/package/target/gluten-package-1.1.0-SNAPSHOT.jar

# Start the spark shell.
spark-shell \
  --master "local[1]" \
  --deploy-mode client \
  --conf spark.plugins=io.glutenproject.GlutenPlugin \
  --conf spark.memory.offHeap.enabled=true \
  --conf spark.sql.adaptive.enabled=false \
  --conf spark.gluten.sql.injectNativePlanStringToExplain=true \
  --conf spark.memory.offHeap.size=1g \
  --conf spark.driver.extraClassPath=${gluten_jar} \
  --conf spark.executor.extraClassPath=${gluten_jar} \
  --conf spark.shuffle.manager=org.apache.spark.shuffle.sort.ColumnarShuffleManager

# Scripts to test.
val path = "people.json"
val people = spark.read.json(path);
people.registerTempTable("person");
spark.sql("select count(*) from person limit 10").explain();

