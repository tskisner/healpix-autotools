
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/cxx/c_utils \
-I$(top_srcdir)/src/cxx/libfftpack \
-I$(top_srcdir)/src/cxx/libsharp \
-I$(top_srcdir)/src/cxx/cxxsupport \
-I$(top_srcdir)/src/cxx/Healpix_cxx

AM_LDFLAGS = \
-L$(top_builddir)/src/cxx/c_utils \
-L$(top_builddir)/src/cxx/libfftpack \
-L$(top_builddir)/src/cxx/libsharp \
-L$(top_builddir)/src/cxx/cxxsupport \
-L$(top_builddir)/src/cxx/Healpix_cxx

AM_CFLAGS = 
AM_CXXFLAGS =
AM_FCFLAGS =

AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


EXTRA_DIST = \
alm2map_cxx.par.txt \
anafast_cxx.par.txt \
map2tga.par.txt \
mult_alm.par.txt \
smoothing_cxx.par.txt \
syn_alm_cxx.par.txt


include_HEADERS = \
alm.h \
alm_fitsio.h \
alm_healpix_tools.h \
alm_powspec_tools.h \
healpix_base.h \
healpix_data_io.h \
healpix_map.h \
healpix_map_fitsio.h \
healpix_tables.h \
moc.h \
moc_fitsio.h \
moc_query.h \
powspec.h \
powspec_fitsio.h


lib_LTLIBRARIES = libhealpix_cxx.la

libhealpix_cxx_la_SOURCES = \
alm.cc \
alm_fitsio.cc \
alm_healpix_tools.cc \
alm_powspec_tools.cc \
healpix_base.cc \
healpix_data_io.cc \
healpix_map.cc \
healpix_map_fitsio.cc \
healpix_tables.cc \
moc_fitsio.cc \
moc_query.cc \
powspec.cc \
powspec_fitsio.cc


libhealpix_cxx_la_LDFLAGS = -version-info @HEALPIX_LT_VERSION@

libhealpix_cxx_la_LIBADD = \
$(top_builddir)/src/cxx/cxxsupport/libcxxsupport.la \
$(top_builddir)/src/cxx/libsharp/libsharp.la \
$(top_builddir)/src/cxx/libfftpack/libfftpack.la \
$(top_builddir)/src/cxx/c_utils/libc_utils.la


bin_PROGRAMS = \
syn_alm_cxx \
alm2map_cxx \
anafast_cxx \
map2tga \
udgrade_cxx \
udgrade_harmonic_cxx \
hotspots_cxx \
calc_powspec \
median_filter_cxx \
hpxtest \
smoothing_cxx \
mult_alm \
rotalm_cxx

TESTS = hpxtest


hpxtest_SOURCES = hpxtest.cc
hpxtest_LDADD = libhealpix_cxx.la $(AM_LIBS)

alm2map_cxx_SOURCES = alm2map_cxx.cc alm2map_cxx_module.cc
alm2map_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)

anafast_cxx_SOURCES = anafast_cxx.cc anafast_cxx_module.cc
anafast_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)

calc_powspec_SOURCES = calc_powspec.cc calc_powspec_module.cc
calc_powspec_LDADD = libhealpix_cxx.la $(AM_LIBS)

hotspots_cxx_SOURCES = hotspots_cxx.cc hotspots_cxx_module.cc
hotspots_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)

map2tga_SOURCES = map2tga.cc map2tga_module.cc
map2tga_LDADD = libhealpix_cxx.la $(AM_LIBS)

median_filter_cxx_SOURCES = median_filter_cxx.cc median_filter_cxx_module.cc
median_filter_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)

mult_alm_SOURCES = mult_alm.cc mult_alm_module.cc
mult_alm_LDADD = libhealpix_cxx.la $(AM_LIBS)

rotalm_cxx_SOURCES = rotalm_cxx.cc
rotalm_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)

smoothing_cxx_SOURCES = smoothing_cxx.cc smoothing_cxx_module.cc
smoothing_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)

syn_alm_cxx_SOURCES = syn_alm_cxx.cc syn_alm_cxx_module.cc
syn_alm_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)

udgrade_cxx_SOURCES = udgrade_cxx.cc udgrade_cxx_module.cc
udgrade_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)

udgrade_harmonic_cxx_SOURCES = udgrade_harmonic_cxx.cc udgrade_harmonic_cxx_module.cc
udgrade_harmonic_cxx_LDADD = libhealpix_cxx.la $(AM_LIBS)
