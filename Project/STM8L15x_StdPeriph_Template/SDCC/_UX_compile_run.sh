#!/bin/bash 

# change to current working directory
cd `dirname $0`

# just for output
clear

# target device (for supported devices see stm8l15x.h)
DEVICE=STM8L15X_MD

# set make tool (if not in PATH, set complete path)
MAKE=make

# set serial upload tool and serial port (stm8gal from https://github.com/gicking/stm8gal)
BSL_LOADER=~/Öffentlich/GitHub/stm8gal/stm8gal/stm8gal
BSL_PORT=/dev/ttyUSB0

# set SWIM upload tool and device name (stm8flash from https://github.com/vdudouyt/stm8flash)
SWIM_LOADER=~/Öffentlich/GitHub/stm8flash/stm8flash
SWIM_TOOL=stlinkv2
SWIM_DEVICE=stm8l152?6

# target hexfile
TARGET=./$DEVICE/$DEVICE.hex

# make project
echo "make application"
$MAKE -f Makefile DEVICE=$DEVICE
if [ $? -ne 0 ]; then
  echo " "
  read -p "press key to close window..."
  echo on
  exit
fi
echo "done with application"
echo " "

# upload using STM8 serial bootloader (stm8gal from https://github.com/gicking/stm8gal)
#$BSL_LOADER -p $BSL_PORT -w $TARGET -v

# upload using SWIM debug interface (stm8flash from https://github.com/vdudouyt/stm8flash)
$SWIM_LOADER -c $SWIM_TOOL -w $TARGET -p $SWIM_DEVICE

echo " "
read -p "press key to close window..."
echo " "


