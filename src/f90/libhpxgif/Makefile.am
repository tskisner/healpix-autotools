
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/f90/libhealpix

AM_LDFLAGS = \
-L$(top_builddir)/src/f90/libhealpix

AM_CFLAGS = 

AM_CXXFLAGS =

AM_FCFLAGS = $(AM_CPPFLAGS)

AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am

CLEANFILES = *.mod *.MOD

noinst_HEADERS = \
gd.h \
chopst.h \
gdfontg.h \
gdfontl.h \
gdfontmb.h \
gdfonts.h \
gdfontt.h

noinst_LTLIBRARIES = libhpxgif.la

libhpxgif_la_SOURCES = \
chopst.c \
gd.c \
gdfontg.c \
gdfontl.c \
gdfontmb.c \
gdfonts.c \
gdfontt.c \
gifarr.c \
gifdim.c \
gifmod.f90 \
gifout.c \
gifstr.c \
giftogd.c \
mtables.c


