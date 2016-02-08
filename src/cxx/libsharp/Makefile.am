
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
sharp_core_inc.c \
sharp_core_inc2.c \
sharp_core_inchelper.c

noinst_HEADERS = \
sharp_complex_hacks.h \
sharp_core.h \
sharp_internal.h \
sharp_vecsupport.h \
sharp_vecutil.h \
sharp_ylmgen_c.h

include_HEADERS = \
sharp.h \
sharp_cxx.h \
sharp_lowlevel.h \
sharp_geomhelpers.h \
sharp_almhelpers.h

noinst_LTLIBRARIES = libsharp.la

libsharp_la_SOURCES = \
sharp.c \
sharp_almhelpers.c \
sharp_core.c \
sharp_geomhelpers.c \
sharp_ylmgen_c.c

