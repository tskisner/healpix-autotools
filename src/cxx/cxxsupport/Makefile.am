
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/cxx/c_utils \
-I$(top_srcdir)/src/cxx/libfftpack \
-I$(top_srcdir)/src/cxx/libsharp \
-I$(top_srcdir)/src/cxx/cxxsupport

AM_CFLAGS = 
AM_CXXFLAGS =
AM_FCFLAGS =

AM_LDFLAGS =
AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


EXTRA_DIST = \
font_data.inc


include_HEADERS = \
announce.h \
bstream.h \
colour.h \
compress_utils.h \
geom_utils.h \
linear_map.h \
ls_image.h \
openmp_support.h \
alloc_utils.h \
arr.h \
datatypes.h \
error_handling.h \
fftpack_support.h \
fitshandle.h \
levels_facilities.h \
lsconstants.h \
math_utils.h \
paramfile.h \
planck_rng.h \
pointing.h \
rangeset.h \
rotmatrix.h \
safe_cast.h \
safe_ptr.h \
share_utils.h \
sort_utils.h \
sse_utils_cxx.h \
string_utils.h \
trafos.h \
vec3.h \
walltimer.h \
wigner.h \
xcomplex.h 


noinst_LTLIBRARIES = libcxxsupport.la

libcxxsupport_la_SOURCES = \
announce.cc \
error_handling.cc \
fitshandle.cc \
geom_utils.cc \
ls_image.cc \
paramfile.cc \
pointing.cc \
rotmatrix.cc \
string_utils.cc \
trafos.cc \
walltimer.cc \
wigner.cc

