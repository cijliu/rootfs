insmod esp8089.ko
ifconfig wlan0 up
wpa_supplicant -B -Dwext -iwlan0 -c ./wifi.conf &
udhcpc -iwlan0 &
