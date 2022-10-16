#!/bin/bash 

# change to current working directory
cd `dirname $0`

# just for output
echo off
clear

# target device (for supported devices see stm8l15x.h)
DEVICE=STM8L15X_MD

# set make tool (if not in PATH, set complete path)
MAKE=make

# use Makefiles to delete outputs
$MAKE -f Makefile DEVICE=$DEVICE clean 

echo on

