
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/f90/libhealpix \
-I$(top_srcdir)/src/f90/libhpxgif

AM_LDFLAGS = \
-L$(top_builddir)/src/f90/libhealpix \
-L$(top_builddir)/src/f90/libhpxgif

AM_CFLAGS = 

AM_CXXFLAGS =

AM_FCFLAGS = $(AM_CPPFLAGS)

AM_LIBS = \
$(top_builddir)/src/f90/libhealpix/libhealpix.la

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


EXTRA_DIST = med_sub_inc.f90

CLEANFILES = *.mod *.MOD


bin_PROGRAMS = median_filter

median_filter_SOURCES = median_filter.f90
median_filter_LDADD = $(AM_LIBS)

median_filter.o : med_sub_inc.f90
