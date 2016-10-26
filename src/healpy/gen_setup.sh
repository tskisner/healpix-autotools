#!/bin/sh

PRE=$1
LIB=$2
CFITS=$3

# first, generate setup.cfg and specify the install prefix

cat setup.cfg.in > setup.cfg
echo "[install]" >> setup.cfg
echo "prefix=${PRE}" >> setup.cfg
echo "" >> setup.cfg

# now, substitute the extra_link_args, based on the installed location
# of healpix_cxx, as well as the CFITSIO location passed to configure.
# Do the same with the include dirs.

extra="\"-L${LIB}\""
if [ "x${CFITS}" != "x" ]; then
    extra="${extra}, \"-L${CFITS}/lib\""
fi

incdir="\"${PRE}/include\""
if [ "x${CFITS}" != "x" ]; then
    incdir="${incdir}, \"${CFITS}/include\""
fi

sed -e "s#@EXTRA@#${extra}#g" -e "s#@INCDIR@#${incdir}#g" setup.py.in > setup.py

