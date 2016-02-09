
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


EXTRA_DIST = \
README \
my_ng_sim.par \
my_ng_sim_bin.par \
my_ng_sim_large.par \
sky.par \
sky_bin.par

CLEANFILES = *.mod *.MOD

bin_PROGRAMS = sky_ng_sim sky_ng_sim_bin


sky_ng_sim_SOURCES = \
sky_ng_sim.F90 \
sky_sub.f90 \
sub_ngpdf_powergauss.F90 \
sub_ngpdf_sho.F90

sky_ng_sim_LDADD = $(AM_LIBS)


sky_ng_sim_bin_SOURCES = \
sky_ng_sim_bin.F90 \
sky_sub.f90 \
sub_ngpdf_powergauss.F90 \
sub_ngpdf_sho.F90

sky_ng_sim_bin_LDADD = $(AM_LIBS)


sub_ngpdf_powergauss.o : sky_sub.o

sub_ngpdf_sho.o : sky_sub.o

sky_ng_sim.o : sky_sub.o sub_ngpdf_powergauss.o sub_ngpdf_sho.o

sky_ng_sim_bin.o : sky_sub.o sub_ngpdf_powergauss.o sub_ngpdf_sho.o

