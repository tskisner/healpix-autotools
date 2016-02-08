
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/cxx/c_utils \
-I$(top_srcdir)/src/cxx/libfftpack \
-I$(top_srcdir)/src/cxx/libsharp \
-I$(top_srcdir)/src/cxx/cxxsupport \
-I$(top_srcdir)/src/cxx/Healpix_cxx

AM_LDFLAGS = \
-L$(top_builddir)/src/cxx/Healpix_cxx

AM_CFLAGS = 
AM_CXXFLAGS =
AM_FCFLAGS =

AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


EXTRA_DIST = \
alice3_usage.txt

bin_PROGRAMS = \
alice3


alice3_SOURCES = alice3.cc

alice3_LDADD = \
$(top_builddir)/src/cxx/Healpix_cxx/libhealpix_cxx.la \
$(AM_LIBS)


