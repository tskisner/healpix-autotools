dnl
dnl This is the Autoconf file for Healpix
dnl

dnl +------------------------
dnl | Initialize package info
dnl +------------------------
AC_INIT([HEALPix], [3.30], [work@theodorekisner.com], [healpix], [https://github.com/tskisner/healpix])
AC_CONFIG_SRCDIR([Makefile.am])
AM_INIT_AUTOMAKE([foreign])
AC_CONFIG_HEADERS(config.h)
AC_CONFIG_MACRO_DIR([m4])

dnl +-------------------------
dnl | If the library source code has changed at all since the last update, 
dnl | then increment revision (c:r:a becomes c:r+1:a).  If any interfaces 
dnl | have been added, removed, or changed since the last update, increment
dnl | current, and set revision to 0.  If any interfaces have been added 
dnl | since the last public release, then increment age.  If any interfaces 
dnl | have been removed since the last public release, then set age to 0.
dnl +-------------------------
HEALPIX_LT_VERSION="1:0:0"
AC_SUBST(HEALPIX_LT_VERSION)

dnl +---------------------
dnl | Compiler features
dnl +---------------------
dnl Set default optimization to '-O3' instead of the default '-g -O2'
if test x"$CFLAGS" = x; then
   CFLAGS="-O3"
fi
if test x"$CXXFLAGS" = x; then
   CXXFLAGS="-O3"
fi
if test x"$FCFLAGS" = x; then
   FCFLAGS="-O3"
fi
AC_CANONICAL_HOST
AC_PROG_INSTALL
LT_INIT

dnl +-------------------------
dnl | Shared library extension
dnl +-------------------------
HEALPIX_SHARED_EXT=""
case $host_os in
  darwin* )
    HEALPIX_SHARED_EXT="dylib"
    ;;
  linux*)
    HEALPIX_SHARED_EXT="so"
    ;;
  *BSD*)
    HEALPIX_SHARED_EXT="so"
    ;;
  *)
    HEALPIX_SHARED_EXT="so"
    AC_MSG_WARN([Your platform was not detected- using Linux defaults for shared library suffix])
    ;;
esac
AC_SUBST(HEALPIX_SHARED_EXT)

dnl +-------------------------
dnl | C support
dnl +-------------------------
AC_PROG_CC

dnl +-------------------------
dnl | C++ support
dnl +-------------------------
AC_PROG_CXX

dnl +-------------------------
dnl | Fortran support
dnl +-------------------------
healpix_fortran=yes
FCMODEXT="mod"
AC_ARG_ENABLE(fortran, [AC_HELP_STRING([--disable-fortran], [Disable Fortran bindings])], [healpix_fortran=$enable_fortran], [healpix_fortran=yes])
if test $healpix_fortran = yes; then
  AC_PROG_FC
  AC_FC_LIBRARY_LDFLAGS
  AC_FC_WRAPPERS
  ACX_FC_PP_SRCEXT([f90])
  ACX_FC_PP_DEFINE
  AX_F90_MODULE_EXTENSION
  FCMODEXT="$ax_cv_f90_modext"
  if test x"$FDOPT" = x; then
    FDOPT="-D"
  fi
  AC_ARG_VAR(FDOPT,[Fortran flag for preprocessor variables (typically "-D" or "-WF,-D")])
  AC_SUBST(FDOPT)
fi
AC_SUBST(FCMODEXT)

dnl +-------------------------
dnl | IDL support
dnl +-------------------------
healpix_idl=yes
AC_ARG_ENABLE(idl, [AC_HELP_STRING([--disable-idl], [Do not install IDL tools])], [healpix_idl=$enable_idl], [healpix_idl=yes])
if test $healpix_idl = yes; then
  AC_ARG_VAR(IDL,[IDL executable to use])
  AC_CHECK_PROG([IDLEXEC], [idl])
  if test x"$IDL" = x; then
     IDL=$IDLEXEC
  fi
  AC_SUBST(IDL)
fi
AM_CONDITIONAL([HAVE_AM_IDL], [test $healpix_idl = yes])

dnl +------------------------------------------------
dnl | Make C++ the default here
dnl +------------------------------------------------
AC_LANG([C++])

dnl +------------------------------------------------
dnl | Check for CFITSIO
dnl +------------------------------------------------
AC_LANG_PUSH([C])
ACX_CFITSIO([], [AC_MSG_ERROR([Could not find the CFITSIO library!])])
if test "$acx_cfitsio_fortran" = no; then
  if test x"$healpix_fortran" != xno; then
    AC_MSG_WARN([This CFITSIO library is old and/or does not include Fortran support.])
    AC_MSG_WARN([    Disabling F90 HEALPix!])
    healpix_fortran=no
  fi
fi
AC_LANG_POP([C])
dnl Now we can set this, since it might have been disabled by the last check...
AM_CONDITIONAL([HAVE_AM_FC], [test $healpix_fortran = yes])

dnl +------------------------------------------------
dnl | Check for OpenMP
dnl +------------------------------------------------
ax_have_openmp=no
AC_LANG_PUSH([C])
AX_OPENMP([ax_have_openmp=yes AC_DEFINE(HAVE_OPENMP,1,[Define if OpenMP is enabled])])
AC_LANG_POP([C])
AM_CONDITIONAL([HAVE_AM_OPENMP], [test "$ax_have_openmp" = yes])

dnl +------------------------------------------------
dnl | Check for MPI (C, C++, and Fortran)
dnl +------------------------------------------------
healpix_mpi=yes
healpix_mpi_fortran=no
AC_ARG_ENABLE([mpi], [AC_HELP_STRING([--disable-mpi], [Disable all checks for MPI])], [healpix_mpi=$enable_mpi], [healpix_mpi=yes])
if test $healpix_mpi = yes; then
  ACX_MPI
  if test x"$MPICXX" = x; then
    healpix_mpi=no
  else
    AC_LANG_PUSH([C])
    ACX_MPI
    AC_LANG_POP([C])
    if test x"$MPICC" = x; then
      healpix_mpi=no
    fi
    if test $healpix_fortran = yes; then
      AC_LANG_PUSH([Fortran])
      ACX_MPI
      AC_LANG_POP([Fortran])
      if test x"$MPIFC" != x; then
        healpix_mpi_fortran=yes
      fi
    fi
  fi
fi
AM_CONDITIONAL([HAVE_AM_MPI], [test healpix_mpi = yes])
AM_CONDITIONAL([HAVE_AM_MPI_FC], [test healpix_mpi_fortran = yes])

dnl +-------------------------
dnl | Option to perform full static linking of executables, not just
dnl | building of static libraries.
dnl +-------------------------
healpix_static=no
AC_ARG_ENABLE([all-static], [AC_HELP_STRING([--enable-all-static], [force static linking of executables.])])
if test x"$enable_all_static" = x"yes"; then
  if test x"$enable_static" != x"yes"; then
    AC_MSG_ERROR([Cannot perform static linking of executables if static libraries are disabled!])
  fi
  healpix_static=yes
fi
AM_CONDITIONAL([USE_AM_ALLSTATIC], [test "$healpix_static" = "yes"])

dnl +------------------------------------------------
dnl | Check for Python
dnl +------------------------------------------------
AC_LANG_PUSH([C])
healpix_python=yes
AC_ARG_ENABLE(python, [AC_HELP_STRING([--disable-python], [Disable python (healpy) support])], [healpix_python=$enable_python])
if test $healpix_static = yes; then
  healpix_python=no
fi
if test $healpix_python = yes; then
  AM_PATH_PYTHON
  ACX_PYTHON_DEV
fi
AC_LANG_POP([C])
AM_CONDITIONAL([HAVE_AM_PYTHON], [test $healpix_python = yes])

dnl +----------------------------------------------
dnl | Check for helper applications
dnl +----------------------------------------------
acx_img_view=""
AC_ARG_WITH(image-viewer, [AC_HELP_STRING([--with-image-viewer], [Image viewing application to use])], [acx_img_view=$withval])
AC_CHECK_PROGS([IMGVIEW], [$acx_img_view open display gwenview eeyes xv])
dnl
acx_ps_view=""
AC_ARG_WITH(ps-viewer, [AC_HELP_STRING([--with-ps-viewer], [PostScript viewing application to use])], [acx_ps_view=$withval])
AC_CHECK_PROGS([PSVIEW], [$acx_ps_view open okular kghostview ghostview gv ggv gs])
dnl
acx_paper_size="a4"
AC_ARG_WITH(paper-size, [AC_HELP_STRING([--with-paper-size], [Paper size (a4, letter, etc) to use for printing from IDL])], [acx_paper_size=$withval])
IDLPAPER=$acx_paper_size
AC_SUBST([IDLPAPER])

dnl +------------------------------------------------
dnl | Makefiles to generate
dnl +------------------------------------------------
AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([data/Makefile])
dnl AC_CONFIG_FILES([test/Makefile])
AC_CONFIG_FILES([src/Makefile])
AC_CONFIG_FILES([src/C/Makefile])
dnl AC_CONFIG_FILES([src/f90/Makefile])
dnl AC_CONFIG_FILES([src/cxx/Makefile])

dnl AC_CONFIG_FILES([src/f90/libhealpix/Makefile])
dnl AC_CONFIG_FILES([src/f90/libhealpix-mpi/Makefile])
dnl AC_CONFIG_FILES([src/f90/libhpxgif/Makefile])
dnl AC_CONFIG_FILES([src/f90/alteralm/Makefile])
dnl AC_CONFIG_FILES([src/f90/anafast/Makefile])
dnl AC_CONFIG_FILES([src/f90/hotspot/Makefile])
dnl AC_CONFIG_FILES([src/f90/map2gif/Makefile])
dnl AC_CONFIG_FILES([src/f90/median_filter/Makefile])
dnl AC_CONFIG_FILES([src/f90/ngsims_full_sky/Makefile])
dnl AC_CONFIG_FILES([src/f90/plmgen/Makefile])
dnl AC_CONFIG_FILES([src/f90/smoothing/Makefile])
dnl AC_CONFIG_FILES([src/f90/synfast/Makefile])
dnl AC_CONFIG_FILES([src/f90/ud_grade/Makefile])
dnl AC_CONFIG_FILES([src/cxx/libfftpack/Makefile])
dnl AC_CONFIG_FILES([src/cxx/cxxsupport/Makefile])
dnl AC_CONFIG_FILES([src/cxx/Healpix_cxx/Makefile])
dnl AC_CONFIG_FILES([src/cxx/test/Makefile])
dnl AC_CONFIG_FILES([src/cxx/alice/Makefile])
dnl AC_CONFIG_FILES([src/idl/Makefile])
dnl AC_CONFIG_FILES([src/idl/examples/Makefile])
dnl AC_CONFIG_FILES([src/idl/fits/Makefile])
dnl AC_CONFIG_FILES([src/idl/interfaces/Makefile])
dnl AC_CONFIG_FILES([src/idl/misc/Makefile])
dnl AC_CONFIG_FILES([src/idl/toolkit/Makefile])
dnl AC_CONFIG_FILES([src/idl/visu/Makefile])
dnl AC_CONFIG_FILES([src/idl/ximview/Makefile])
dnl dnl AC_CONFIG_FILES([src/idl/ximview/gscroll/Makefile])
dnl AC_CONFIG_FILES([src/idl/ximview/docs/Makefile])
dnl AC_CONFIG_FILES([src/idl/ximview/hpx/Makefile])
dnl AC_CONFIG_FILES([src/idl/ximview/utilities/Makefile])
dnl AC_CONFIG_FILES([src/idl/zzz_external/Makefile])
dnl AC_CONFIG_FILES([src/idl/zzz_external/astron/Makefile])
dnl AC_CONFIG_FILES([src/idl/zzz_external/cgis/Makefile])
dnl AC_CONFIG_FILES([src/idl/zzz_external/obsolete_astron/Makefile])
AC_OUTPUT
dnl +------------------------------------------------
dnl | Print out detected build options
dnl +------------------------------------------------
AC_MSG_NOTICE([                                           ])
AC_MSG_NOTICE([============== Configuration ==============])
AC_MSG_NOTICE([                                           ])
if test x"$CC" = x; then
  AC_MSG_NOTICE([  C Compiler         : Not found])
else
  AC_MSG_NOTICE([  C Compiler         : $CC])
  AC_MSG_NOTICE([  C Compile flags    : $CFLAGS])
fi
if test x"$CXX" = x; then
  AC_MSG_NOTICE([  C++ Compiler       : Not found])
else
  AC_MSG_NOTICE([  C++ Compiler       : $CXX])
  AC_MSG_NOTICE([  C++ Compile flags  : $CXXFLAGS])
fi
if test x"$FC" = x; then
  AC_MSG_NOTICE([  F90 Compiler       : Not found])
else
  AC_MSG_NOTICE([  F90 Compiler       : $FC])
  AC_MSG_NOTICE([  F90 Compile flags  : $FCFLAGS])
fi
if test x"$MPICC" = x; then
  AC_MSG_NOTICE([  MPICC  Compiler    : Not found])
else
  AC_MSG_NOTICE([  MPICC Compiler     : $MPICC])
fi
if test x"$MPICXX" = x; then
  AC_MSG_NOTICE([  MPICXX Compiler    : Not found])
else
  AC_MSG_NOTICE([  MPICXX Compiler    : $MPICXX])
fi
if test x"$MPIFC" = x; then
  AC_MSG_NOTICE([  MPIF90 Compiler    : Not found])
else
  AC_MSG_NOTICE([  MPIF90 Compiler    : $MPIFC])
fi
if test x"$ax_have_openmp" = xyes; then
  AC_MSG_NOTICE([  OpenMP             : Detected ($OPENMP_CFLAGS)])
else
  AC_MSG_NOTICE([  OpenMP             : Disabled])
fi
AC_MSG_NOTICE([  CFITSIO include    : $CFITSIO_CPPFLAGS])
AC_MSG_NOTICE([  CFITSIO link       : $CFITSIO])
if test x"$IDL" = x; then
  AC_MSG_NOTICE([  IDL executable     : Not found])
else
  AC_MSG_NOTICE([  IDL executable     : $IDL])
fi
AC_MSG_NOTICE([  Image Viewer       : $IMGVIEW])
AC_MSG_NOTICE([  PostScript Viewer  : $PSVIEW])
AC_MSG_NOTICE([  IDL Paper Size     : $IDLPAPER])
AC_MSG_NOTICE([                                           ])
AC_MSG_NOTICE([========== Selected Build Targets =========])
AC_MSG_NOTICE([                                           ])
AC_MSG_NOTICE([  C Library          : Yes])
AC_MSG_NOTICE([  C++ Library        : Yes])
if test x"$healpix_fortran" = xyes; then
  AC_MSG_NOTICE([  F90 Library        : Yes])
else
  AC_MSG_NOTICE([  F90 Library        : No])
fi
if test x"$healpix_idl" = xyes; then
  AC_MSG_NOTICE([  IDL Tools          : Yes])
else
  AC_MSG_NOTICE([  IDL Tools          : No])
fi
if test x"$healpix_python" = xyes; then
  AC_MSG_NOTICE([  Python package     : Yes])
else
  AC_MSG_NOTICE([  Python package     : No])
fi
AC_MSG_NOTICE([                                           ])
AC_MSG_NOTICE([===========================================])
AC_MSG_NOTICE([                                           ])

