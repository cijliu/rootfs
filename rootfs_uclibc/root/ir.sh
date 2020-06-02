IRCUT="/sys/class/gpio/gpio50"
if [ ! -d "$IRCUT" ] 
then
echo "init ircut"
echo "50">/sys/class/gpio/export
echo "51">/sys/class/gpio/export
echo "out">/sys/class/gpio/gpio50/direction 
echo "out">/sys/class/gpio/gpio51/direction 
fi
echo "0">/sys/class/gpio/gpio50/value
echo "0">/sys/class/gpio/gpio51/value
if [ $1 == "red" ] 
then
echo "switch to filter red"
echo "1">/sys/class/gpio/gpio50/value 
echo "0">/sys/class/gpio/gpio51/value 
else
echo "switch to open red"
echo "0">/sys/class/gpio/gpio50/value
echo "1">/sys/class/gpio/gpio51/value
fi
sleep 0.1
echo "0">/sys/class/gpio/gpio50/value
echo "0">/sys/class/gpio/gpio51/value
