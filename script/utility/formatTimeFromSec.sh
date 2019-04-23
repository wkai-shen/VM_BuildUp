#!/usr/bin/env bash

TIME_IN_SEC=${1:-0}

hh=$(( $TIME_IN_SEC / 3600 ))
mm=$(( $(($TIME_IN_SEC - $hh * 3600)) / 60 ))
ss=$(($TIME_IN_SEC - $hh * 3600 - $mm * 60))

if [ $hh -le 9 ];then h=0$hh;fi
if [ $mm -le 9 ];then m=0$mm;fi
if [ $ss -le 9 ];then s=0$ss;fi

echo $hh:$mm:$ss