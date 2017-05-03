# HEALPix Built with Autotools

This repo is mostly a mirror of the main healpix source code distribution, 
found here:

    http://sourceforge.net/projects/healpix/

and the latest healpy release from here:

    https://github.com/healpy/healpy/releases

but with small modifications that allow the software to be more easily
installed.  Due to historical reasons beyond the scope of this document, the
different language flavors contained within healpix were developed separately
(rather than simply writing the code in one language and offering bindings
for the others).  The goals of this healpix-derived product are:

1.  Use autotools to configure and build the Fortran, C, and C++ libraries
    and executables (the Java tools are not included here).  The IDL routines
    are installed, but nothing further is done with those.

2.  Ensure that the Python healpy package is installed to use this exact
    version of the C++ healpix library.

This effort has grown out of much past work in attempting to install healpix
on HPC systems, and is essentially a place to consolidate all the patches and
other work used to streamline that process.

## Version

Current basis of this source is:

    Healpix_3.31_2016Aug26.tar.gz    md5 = c0dc75e57f237b634fec97df55997918
    healpy-1.10.3.tar.gz             md5 = 6491777d1bcbd36d356551bf240d3a2f

Source changes from future releases will have to be merged by hand, so your
patience is appreciated.

## User Documentation

This project aims to make no changes to the public HEALPix API.  So you
should consult the documentation for the original tools.  It is not included
here.  In addition to the original source tarball, documentation is also
online here:

    http://healpix.sourceforge.net/documentation.php

## Installation

The installation of this healpix bundle is different from the original (that
is the point).  Before installing, you should consciously plan where you intend
to install the software.  You will likely need to set up your shell environment
in order to make use of the installed software.  In particular, if you configure
the software with

    ./configure --prefix=/path/to/install

then you must add /path/to/install/bin to your PATH, /path/to/install/lib to 
your LD_LIBRARY_PATH, and /path/to/install/lib/python[2,3].X/site-packages to
your PYTHONPATH environment variables.

### Installing from a git checkout

If you are installing directly from a git checkout (rather than a release 
tarball), then you must have a fairly recent set of autoconf, automake, and 
libtool installed on your system.  You must then do:

    ./autogen.sh

from the top-level directory.  Then follow the usual configure instructions
below.

### Installing from a Release Tarball

If you download a release tarball, you do not need to have autotools installed.
Simply extract the source and all the following commands assume you are in the
top of the source tree.  The configure script has many options and environment
variables that influence its behavior.  You can see these by doing:

    ./configure --help

The most common option that you should almost always specify is the install
prefix.  After running configure, make sure that the detected values of the 
compilers, compile flags, and enabled packages looks correct.  Now build the 
software with

    make

and install the software with

    make install

After installation, you can run some tests by doing

    make check

If you only want the C and C++ HEALPix libraries, you can disable the Fortran,
IDL, and / or Python packages like this:

    ./configure --prefix=/path/to/install \
    --disable-fortran --disable-python --disable-idl


### Using healpy with virtualenv or conda

Unless you are only ever using a single version of python and a single set of 
packages, it is great to manage all of your various python flavors with a tool
like virtualenv or conda.  To install healpy in this situation, simply activate
the environment first, and then install to it:

    source /path/to/env/bin/activate
    ./configure --prefix=/path/to/env --disable-fortran --disable-idl
    make install

and then repeat that for each virtualenv / environment.

