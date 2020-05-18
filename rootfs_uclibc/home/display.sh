insmod /lib/modules/4.9.37/fb_ili9341.ko
modprobe fbtft_device name=ilitek,ili9341 gpios=reset:40,dc:70 busnum=0 mode=0 rotate=90 
