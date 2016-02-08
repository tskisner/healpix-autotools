
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/cxx/libfftpack

AM_LDFLAGS = \
-L$(top_builddir)/src/cxx/libfftpack

AM_CFLAGS = 
AM_CXXFLAGS =
AM_FCFLAGS =

AM_LDFLAGS =
AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


EXTRA_DIST = README

noinst_HEADERS = fftpack.h bluestein.h
include_HEADERS = ls_fft.h

lib_LTLIBRARIES = libfftpack.la
libfftpack_la_SOURCES = fftpack.c bluestein.c ls_fft.c
libfftpack_la_LDFLAGS = -version-info @HEALPIX_LT_VERSION@
libfftpack_la_LIBADD = 

