
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
make heliosx_defconfig
make all -j9
