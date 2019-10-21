#!/bin/bash
OUT_DIR=out
COMMON_ARGS="-C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm CROSS_COMPILE=arm-linux-androideabi- KCFLAGS=-mno-android"
export PATH=../PLATFORM/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:$PATH
export ARCH=arm
[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}
make clean ${OUT_DIR} && make mrproper ${OUT_DIR}
make ${COMMON_ARGS} j4primelte_sea_open_defconfig
//make ${COMMON_ARGS} menuconfig 
make -j$(nproc --all) ${COMMON_ARGS} 

cp ${OUT_DIR}/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage
