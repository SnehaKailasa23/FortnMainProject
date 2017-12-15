CP_JAVA_OPTS="-Dserver.port=${port} -Dspring.datasource.username=$db_details -Dspring.datasource.password=$db_details"
#printenv
#echo i am here$CP_JAVA_OPTS
#printenv
java -jar $CP_JAVA_OPTS /app.jar
