CC = @MPICC@
FC = @MPIFC@

# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/f90/libhealpix-mpi \
-I$(top_srcdir)/src/f90/libhealpix

AM_LDFLAGS = \
-L$(top_builddir)/src/f90/libhealpix-mpi \
-L$(top_builddir)/src/f90/libhealpix

AM_CFLAGS = 

AM_CXXFLAGS =

AM_FCFLAGS = $(AM_CPPFLAGS)

AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


incmpi = mpi_alm_tools_ss.f90 mpi_alm_tools_dd.f90

EXTRA_DIST = gen_mpi_alm_code mpi_alm_tools_template.f90

noinst_SCRIPTS = gen_mpi_alm_code

include_HEADERS = mpi_alm_tools.mod

BUILT_SOURCES = mpi_alm_tools.mod

CLEANFILES = mpi_alm_tools_ss.f90 mpi_alm_tools_dd.f90 *.mod *.MOD

mpi_alm_tools_ss.f90 : $(srcdir)/mpi_alm_tools_template.f90 $(srcdir)/gen_mpi_alm_code
	@$(srcdir)/gen_mpi_alm_code "$(srcdir)/mpi_alm_tools_template.f90"

mpi_alm_tools_dd.f90 : mpi_alm_tools_ss.f90

$(srcdir)/mpi_alm_tools.lo : mpi_alm_tools_dd.f90

mpi_alm_tools.mod : mpi_alm_tools.lo


lib_LTLIBRARIES = libhealpix-mpi.la

libhealpix_mpi_la_SOURCES = mpi_alm_tools.f90

libhealpix_mpi_la_LDFLAGS = -version-info @HEALPIX_LT_VERSION@

libhealpix_mpi_la_LIBADD = $(AM_LIBS)
