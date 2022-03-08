#!/bin/bash

#
#    Copyright (C) 2020 @Hais Q群:311243794
#    2020-11-26 21:39:06 
#

PROJECT=${1}						#工程目录
SHELL=$(readlink -f "$0")			#脚本文件
SHELL_PATH=$(dirname $SHELL)		#脚本路径
if [[ $(uname -m) != "aarch64" ]]; then su="sudo ";fi;


doInsert(){		#插入文件替换内容
	echo -en ""
	echo -en "\n>>>>开始配置：${1##*/}"
	source $1		#读取文件变量
	
	if [ ! -n "$FILE" ] ; then 
		FINS_RES=$PROJECT/$FILE
		if [ -f "$FINS_RES" ] ; then 
			if [ ! -n "$FIND_START" ];then 
				echo -en "\n>>>>寻找关键：$DEFAULT_CODE "
				oldStr=$DEFAULT_CODE 
			else
				echo -en "\n>>>>寻找插入：$FIND_START"
				oldStr=`sed -n "/$FIND_START/,/$FILE_END/p" $FINS_RES`
			fi
				
			if [ -n "$oldStr" ];then
				res=`${su} python3 $SHELL_PATH/repStr.py "$FINS_RES" "$oldStr" "$REPLACE_CODE"`
				echo  -en  "\n>>>>处理结束：已完成插入"
			else
				echo -en "\n>>>>无插入点：$FILE_END"
			fi
		else
			echo -en "\n>>>>文件不在：${FINS_RES}"
		fi
	else
		echo -en '\n>>>>配置文件读取FILE参数失败'
	fi
	
	FILE=""
	FIND_START=""
	DEFAULT_CODE=""
	REPLACE_CODE=""
	FINS_RES=""
	echo ""
}




echo -en  "\n>>开始进行文件插桩\n"
OldPath=$(pwd)
cd "$SHELL_PATH/../../Config/NormalPatchFile"
NormalPatchFilePath=$(pwd)
cd "$OldPath"

for file in `find ${NormalPatchFilePath}/*.sh -prune -type f` ;do
	doInsert "$file"
done
