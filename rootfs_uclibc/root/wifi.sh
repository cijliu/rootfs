insmod /root/esp8089.ko
sleep 5
WIFI=$(ifconfig wlan0)
if [ -z ${WIFI} ]
then
    echo "No wifi"
    sed -i "5c bind_address = \"192.168.137.25\"" /etc/config.hcl
    return
fi
ifconfig wlan0 up
sleep 2
wpa_supplicant -B -Dwext -iwlan0 -c ./wifi.conf &
udhcpc -iwlan0 &
sleep 3
let TRY=0
IP=$(ifconfig wlan0|grep "inet addr"|awk '{print $2}'|awk -F: '{print $2}')
while [ -z $IP ]
do
    TRY=$((${TRY}+1))
    if [ ${TRY} -gt 10 ]
    then
	sed -i "5c bind_address = \"192.168.137.25\"" /etc/config.hcl
        return
    fi
    IP=$(ifconfig wlan0|grep "inet addr"|awk '{print $2}'|awk -F: '{print $2}')
    sleep 1
done
echo $IP
sed -i "5c bind_address = \"${IP}\"" /etc/config.hcl
killall mDNS
sleep 1
/bin/mDNS --config /etc/config.hcl >/dev/null 2>&1 &
#ifconfig wlan0 192.168.1.25 
#route add default gw 192.168.1.1
LED="/sys/class/gpio/gpio14"
if [ ! -d "$LED" ]
then
devmem 0x120C0018 32 0x1d02
echo "14">/sys/class/gpio/export
echo "out">/sys/class/gpio/gpio14/direction
echo "0">/sys/class/gpio/gpio14/value
fi
echo "0">/sys/class/gpio/gpio14/value
