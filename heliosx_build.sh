
# ref:
#   http://fowlrat.hatenablog.com/entry/2014/08/31/011056
# sudo apt-get install u-boot-tools

rm uImage.bin
rm heliosx.dtb.bin

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-

make heliosx_defconfig

#make all -j9

make -j9 LOADADDR=0x08000000 uImage dtbs
#make -j9 LOADADDR=0x40008000 uImage

cp arch/arm/boot/uImage uImage.bin
cp arch/arm/boot/dts/heliosx.dtb heliosx.dtb.bin


