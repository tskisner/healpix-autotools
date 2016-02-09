#!/bin/sh

PRE=$1
BIN=$2
DATA=$3
SRC=$4

sed -e "s#@PREFIX@#${PRE}#g" -e "s#@BINDIR@#${BIN}#g" -e "s#@DATADIR@#${DATA}#g" "${SRC}/hidl.in" > hidl
sed -e "s#@PREFIX@#${PRE}#g" -e "s#@BINDIR@#${BIN}#g" -e "s#@DATADIR@#${DATA}#g" "${SRC}/hidlde.in" > hidlde

chmod +x hidl hidlde

