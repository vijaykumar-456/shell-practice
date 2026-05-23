#!bin/bash
echo " All variable passed in the script: $@"
echo " Number if variable passed: $#"
echo " First variable passed: $1"
echo " who is running this: $USER"
echo " current working directory: $PWD"
echo " home directory: $HOME"
echo " Process Instance ID: $$ "
sleep 5 &
echo " background prcoess running just now: $!"
wait $!
echo " Line Number: $LINENO"
echo " Script executed in seconds: $SECONDS"