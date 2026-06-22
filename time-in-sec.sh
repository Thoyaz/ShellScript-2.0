START_TIME=$(date +%s)
echo "The start time of the script is: ${START_TIME}"

sleep 10

END_TIME=$(date +%s)
echo "The end time of the script is: ${END_TIME}"
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "The total time taken to execute the script is: ${TOTAL_TIME} seconds"