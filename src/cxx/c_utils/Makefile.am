
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/cxx/c_utils

AM_CFLAGS = 
AM_CXXFLAGS =
AM_FCFLAGS =

AM_LDFLAGS =
AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


EXTRA_DIST = 

noinst_HEADERS = sse_utils.h walltime_c.h
include_HEADERS = c_utils.h

lib_LTLIBRARIES = libc_utils.la
libc_utils_la_SOURCES = c_utils.c walltime_c.c
libc_utils_la_LDFLAGS = -version-info @HEALPIX_LT_VERSION@
libc_utils_la_LIBADD = 

