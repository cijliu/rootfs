# DOPI Rootfs
DOPI使用的rootfs文件系统
# 编译
如果根路径下不存在dev,sys,proc文件夹，则创建（git不记录空文件夹）
> mkdir -p ./rootfs_uclibc/dev  
> mkdir -p ./rootfs_uclibc/sys  
> mkdir -p ./rootfs_uclibc/proc

根据flash类型进行选择编译，flash为nand时，以开发板使用的flash为例,参数如下:

> ./mkyaffs2image100 ./rootfs_uclibc yaffs2-rootfs.img 1 2  

参数说明：
>mkyaffs2 {dir} {image} {pagesize} {ecctype}  
> 
>image   the output file to hold the image  
> pagesize        the page size to be converted  
>             0 | 512     512 Bytes pagesize  
>                 1 | 2k      2K Bytes pagesize  
>                 2 | 4K      4K Bytes pagesize  
>                 3 | 8K      8K Bytes pagesize  
>                 4 | 16K     16K Bytes pagesize  
>     ecctype ECC type  
>             0 | none    no ecc  
>                 1 | 1bit    used 1bit/512 ecc  
>                 2 | 4bit    used 4bit/512 ecc  
>                 3 | 8bit    used 8bit/512 ecc  
>                 4 | 24bit   used 24bit/1k ecc  
>                 5 | 40bit   used 40bit/1k ecc  
>                 6 | 64bit   used 64bit/1k ecc  

flash为nor时，64MB示例：

> ./mkfs.jffs2 -d ./rootfs_uclibc -l -e 0x10000 -o rootfs.jffs2



## DOPI开源交流群：735884031
