
# Initialize compile and linking flags

AM_CPPFLAGS = \
-I$(top_srcdir)/src/f90/libsharp_f \
-I$(top_srcdir)/src/f90/libhealpix

AM_LDFLAGS = \
-L$(top_builddir)/src/f90/libsharp_f \
-L$(top_builddir)/src/f90/libhealpix

AM_CFLAGS = 

AM_CXXFLAGS =

AM_FCFLAGS = \
$(FDOPT)HEALPIX=\'$(prefix)\' \
$(FDOPT)HEALPIXDATA=\'$(datadir)/healpix\' \
$(FDOPT)HEALPIXTEST=\'$(datadir)/healpix/test\'

AM_LIBS = 

# Append compile and linking flags based on configure variables
include $(top_srcdir)/src/build_options.am


include_HEADERS = \
alm_tools.mod \
fitstools.mod \
healpix_types.mod \
obsolete.mod \
rngmod.mod \
bit_manipulation.mod \
head_fits.mod \
m_indmed.mod \
paramfile_io.mod \
statistics.mod \
coord_v_convert.mod \
healpix_fft.mod \
misc_utils.mod \
pix_tools.mod \
udgrade_nr.mod \
extension.mod \
healpix_modules.mod \
num_rec.mod \
ran_tools.mod \
utilities.mod \
long_intrinsic.mod \
mask_tools.mod

BUILT_SOURCES = \
alm_tools.mod \
fitstools.mod \
healpix_types.mod \
obsolete.mod \
rngmod.mod \
bit_manipulation.mod \
head_fits.mod \
m_indmed.mod \
paramfile_io.mod \
statistics.mod \
coord_v_convert.mod \
healpix_fft.mod \
misc_utils.mod \
pix_tools.mod \
udgrade_nr.mod \
extension.mod \
healpix_modules.mod \
num_rec.mod \
ran_tools.mod \
utilities.mod \
long_intrinsic.mod \
mask_tools.mod

EXTRA_DIST = \
paramfile_io.F90.in \
gen_paramfile_io.sh \
gen_alm_code \
gen_fits_code \
gen_udgrade_code \
alm_map_template.f90 \
fits_template.f90 \
udgrade_template.f90 \
convert_inplace_nd_inc.f90 \
convert_nest2ring_nd_inc.f90 \
convert_nest2ring_1d_inc.f90 \
convert_inplace_1d_inc.f90 \
convert_ring2nest_nd_inc.f90 \
convert_ring2nest_1d_inc.f90 \
indmed_part1.f90 \
indmed_part2.f90 \
pixel_routines.F90 \
remove_dipole_inc.f90 \
source_gen_sort_inc.f90

noinst_SCRIPTS = \
gen_alm_code \
gen_fits_code \
gen_udgrade_code

CLEANFILES = \
alm_map_ss_inc.f90 \
alm_map_dd_inc.f90 \
fits_s_inc.f90 \
fits_d_inc.f90 \
udgrade_s_inc.f90 \
udgrade_d_inc.f90 \
*.mod *.MOD


alm_map_ss_inc.F90 : $(srcdir)/alm_map_template.F90 $(srcdir)/gen_alm_code
	@$(srcdir)/gen_alm_code "$(srcdir)/alm_map_template.F90"

alm_map_dd_inc.F90 : alm_map_ss_inc.F90

fits_s_inc.f90 : $(srcdir)/fits_template.f90 $(srcdir)/gen_fits_code
	@$(srcdir)/gen_fits_code "$(srcdir)/fits_template.f90"

fits_d_inc.f90 : fits_s_inc.f90

udgrade_s_inc.f90 : $(srcdir)/udgrade_template.f90 $(srcdir)/gen_udgrade_code
	@$(srcdir)/gen_udgrade_code "$(srcdir)/udgrade_template.f90"

udgrade_d_inc.f90 : udgrade_s_inc.f90

alm_tools.mod : alm_tools.lo

fitstools.mod : fitstools.lo

healpix_types.mod : healpix_types.lo

obsolete.mod : obsolete.lo

rngmod.mod : rngmod.lo

bit_manipulation.mod : bit_manipulation.lo

head_fits.mod : head_fits.lo

m_indmed.mod : indmed.lo

paramfile_io.mod : paramfile_io.lo

statistics.mod : statistics.lo

coord_v_convert.mod : coord_v_convert.lo

healpix_fft.mod : healpix_fft.lo

misc_utils.mod : misc_utils.lo

pix_tools.mod : pix_tools.lo

udgrade_nr.mod : udgrade_nr.lo

extension.mod : extension.lo

healpix_modules.mod : healpix_modules.lo

num_rec.mod : num_rec.lo

ran_tools.mod : ran_tools_dist.lo

utilities.mod : utilities.lo

long_intrinsic.mod : long_intrinsic.lo

mask_tools.mod : mask_tools.lo

obj0 = healpix_types.lo cgetEnvironment.lo indmed.lo utilities.lo
obj1 = bit_manipulation.lo extension.lo obsolete.lo ran_tools_dist.lo rngmod.lo long_intrinsic.lo
obj2 = healpix_fft.lo misc_utils.lo
obj3 = head_fits.lo num_rec.lo statistics.lo paramfile_io.lo 
obj4 = pix_tools.lo 
obj5 = coord_v_convert.lo fitstools.lo udgrade_nr.lo
obj6 = alm_tools.lo mask_tools.lo
obj7 = healpix_modules.lo

incalm = alm_map_ss_inc.F90 alm_map_dd_inc.F90

incpix = $(srcdir)/convert_inplace_1d_inc.f90 \
    $(srcdir)/convert_inplace_nd_inc.f90 \
    $(srcdir)/convert_nest2ring_nd_inc.f90 \
    $(srcdir)/convert_ring2nest_nd_inc.f90 \
    $(srcdir)/convert_nest2ring_1d_inc.f90 \
    $(srcdir)/convert_ring2nest_1d_inc.f90 \
    $(srcdir)/remove_dipole_inc.f90

incfits = fits_s_inc.f90 fits_d_inc.f90

incudgrade = udgrade_s_inc.f90 udgrade_d_inc.f90

$(srcdir)/pix_tools.lo : $(incpix)

$(srcdir)/alm_tools.lo : $(incalm)

$(srcdir)/fitstools.lo : $(incfits)

$(srcdir)/udgrade_nr.lo : $(incudgrade)

#obj1
bit_manipulation.lo : $(obj0)
extension.lo : $(obj0)
obsolete.lo : $(obj0)
ran_tools_dist.lo : $(obj0)
rngmod.lo : $(obj0)
long_intrinsic.lo : $(obj0)

#obj2
healpix_fft.lo : $(obj1)
misc_utils.lo : $(obj1)

#obj3
head_fits.lo : $(obj2)
num_rec.lo : $(obj2)
paramfile_io.lo : $(obj2)
statistics.lo : $(obj2)

#obj4
pix_tools.lo : $(obj3)

#obj5
fitstools.lo : $(obj4)
coord_v_convert.lo : $(obj4)
udgrade_nr.lo : $(obj4)

#obj6
mask_tools.lo : $(obj5)
alm_tools.lo : $(obj5)

#obj7
healpix_modules.lo : $(obj6)


lib_LTLIBRARIES = libhealpix.la

libhealpix_la_SOURCES = \
healpix_types.F90 \
cgetEnvironment.c \
indmed.f90 \
utilities.f90 \
bit_manipulation.F90 \
extension.F90 \
obsolete.f90 \
ran_tools_dist.f90 \
rngmod.f90 \
healpix_fft.F90 \
misc_utils.F90 \
head_fits.F90 \
num_rec.F90 \
statistics.f90 \
pix_tools.F90 \
coord_v_convert.f90 \
fitstools.F90 \
udgrade_nr.f90 \
alm_tools.F90 \
healpix_modules.f90 \
paramfile_io.F90 \
long_intrinsic.F90 \
mask_tools.F90

libhealpix_la_LDFLAGS = -version-info @HEALPIX_LT_VERSION@

libhealpix_la_LIBADD = \
$(top_builddir)/src/f90/libsharp_f/libsharp_f.la \
$(top_builddir)/src/cxx/libsharp/libsharp.la \
$(top_builddir)/src/cxx/libfftpack/libfftpack.la \
$(top_builddir)/src/cxx/c_utils/libc_utils.la \
$(AM_LIBS)


