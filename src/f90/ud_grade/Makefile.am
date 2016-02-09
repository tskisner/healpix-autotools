
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


EXTRA_DIST = udg_sub_inc.f90

CLEANFILES = *.mod *.MOD


bin_PROGRAMS = ud_grade

ud_grade_SOURCES = ud_grade.f90
ud_grade_LDADD = $(AM_LIBS)

ud_grade.o : udg_sub_inc.f90
