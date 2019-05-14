while :
do
timeout 2 curl --write-out %{http_code} --silent --output /dev/null http://10.10.100.13/index.html
RETVAL=$?
if [ $RETVAL -ne 124 ]
then
  echo " $(date) The server ran ok"
else
  echo " $(date) The server failed" 
fi
sleep 1
done

