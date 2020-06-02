LED="/sys/class/gpio/gpio14"
if [ ! -d "$LED" ] 
then
devmem 0x120C0018 32 0x1d02
echo "14">/sys/class/gpio/export
echo "out">/sys/class/gpio/gpio14/direction
echo "0">/sys/class/gpio/gpio14/value
fi
if [ $1 == "on" ] 
then
echo "0">/sys/class/gpio/gpio14/value
else
echo "1">/sys/class/gpio/gpio14/value
fi
