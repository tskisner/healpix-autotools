
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/C

AM_LDFLAGS = \
-L$(top_builddir)/src/C

AM_CFLAGS = -DENABLE_FITSIO
AM_CXXFLAGS =
AM_FCFLAGS =

AM_LDFLAGS =
AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


include_HEADERS = chealpix.h


lib_LTLIBRARIES = libchealpix.la

libchealpix_la_SOURCES = \
chealpix.c

libchealpix_la_LDFLAGS = -version-info @HEALPIX_LT_VERSION@
libchealpix_la_LIBADD = 


bin_PROGRAMS = test_chealpix
TESTS = test_chealpix

test_chealpix_SOURCES = \
test_chealpix.c

test_chealpix_LDADD = \
$(top_builddir)/src/C/libchealpix.la \
$(AM_LIBS)
