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

## Documentation

This project aims to make no changes to the public HEALPix API.  So you
should consult the documentation for the original tools.  It is not included
here.  In addition to the original source tarball, documentation is also
online here:

    http://healpix.sourceforge.net/documentation.php



