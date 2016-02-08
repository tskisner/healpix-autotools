
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/cxx/c_utils \
-I$(top_srcdir)/src/cxx/libfftpack \
-I$(top_srcdir)/src/cxx/libsharp

AM_CFLAGS = 
AM_CXXFLAGS =
AM_FCFLAGS =

AM_LDFLAGS =
AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


EXTRA_DIST = \
sharp_healpix_f_inc.c

noinst_HEADERS = \
ls_cfortran.h


noinst_LTLIBRARIES = libsharp_f.la

libsharp_f_la_SOURCES = \
sharp_healpix_f.c

