
# ref:
#   http://fowlrat.hatenablog.com/entry/2014/08/31/011056
# sudo apt-get install u-boot-tools

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-

make heliosx_defconfig

#make all -j9

make -j9 LOADADDR=0x40008000 uImage dtbs
#make -j9 LOADADDR=0x40008000 uImage
