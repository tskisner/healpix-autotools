# HEALPix with an improved build system

This repo is mostly a mirror of the main healpix source code distribution, 
found here:

    http://sourceforge.net/projects/healpix/

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

    Healpix_3.30_2015Oct08.tar.gz    md5 = 5c51820dbdc9e2295e319587ad883ac7

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

    ./configure --prefix=/path/to/healpix

then you must add /path/to/healpix/bin to your PATH, /path/to/healpix/lib to 
your LD_LIBRARY_PATH, and /path/to/healpix/lib/python<version>/site-packages to
your PYTHONPATH environment variables.

In addition to specifying the install prefix, there are other options and
environment variables that affect the configure script.  Run

    ./configure --help

for a full list of these.  After running configure, make sure that the detected
values of the compilers, compile flags, and enabled packages looks correct.  Now
build the software with

    make

and install the software with

    make install

After installation, you can run some tests by doing

    make check




