#
# SYNOPSIS
#
#   ACX_CFITSIO([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])
#
# DESCRIPTION
#
#   This macro looks for a version of the CFITSIO library.  The CFITSIO_CPPFLAGS
#   and CFITSIO output variables hold the compile and link flags.
#
#   To link an application with CFITSIO, you should link with:
#
#   	$CFITSIO
#
#   The user may use:
# 
#       --with-cfitsio=<dir> 
#
#   to manually specify the CFITSIO include and linking flags.
#
#   ACTION-IF-FOUND is a list of shell commands to run if an CFITSIO library is
#   found, and ACTION-IF-NOT-FOUND is a list of commands to run it if it is
#   not found. If ACTION-IF-FOUND is not specified, the default action will
#   define HAVE_CFITSIO and set output variables above.
#
#   This macro requires autoconf 2.50 or later.
#
# LAST MODIFICATION
#
#   2016-02-05
#
# COPYLEFT
#
#   Copyright (c) 2009-2016 Theodore Kisner <work@theodorekisner.com>
#
#   This program is free software: you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation, either version 3 of the License, or (at your
#   option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
#   Public License for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program. If not, see <http://www.gnu.org/licenses/>.
#
#   As a special exception, the respective Autoconf Macro's copyright owner
#   gives unlimited permission to copy, distribute and modify the configure
#   scripts that are the output of Autoconf when processing the Macro. You
#   need not follow the terms of the GNU General Public License when using
#   or distributing such scripts, even though portions of the text of the
#   Macro appear in them. The GNU General Public License (GPL) does govern
#   all other use of the material that constitutes the Autoconf Macro.
#
#   This special exception to the GPL applies to versions of the Autoconf
#   Macro released by the Autoconf Macro Archive. When you make and
#   distribute a modified version of the Autoconf Macro, you may extend this
#   special exception to the GPL to apply to your modified version as well.

AC_DEFUN([ACX_CFITSIO], [
AC_PREREQ(2.50)
AC_REQUIRE([AC_FC_LIBRARY_LDFLAGS])

acx_cfitsio_ok=no
acx_cfitsio_fortran=no
acx_cfitsio_default="-lcfitsio"

CFITSIO_DIR=""
CFITSIO_CPPFLAGS=""
CFITSIO=""

AC_ARG_WITH(cfitsio, [AC_HELP_STRING([--with-cfitsio=<prefix>], [use CFITSIO installed to this prefix])])

if test x"$with_cfitsio" != x; then
   if test x"$with_cfitsio" != xno; then
      CFITSIO_DIR="$with_cfitsio"
      CFITSIO_CPPFLAGS="-I$with_cfitsio/include"
      CFITSIO="-L$with_cfitsio/lib -lcfitsio"
   else
      acx_cfitsio_ok=disable
   fi
fi

if test $acx_cfitsio_ok = disable; then
   echo "**** CFITSIO explicitly disabled by configure."
else

   # Save environment

   acx_cfitsio_save_CC="$CC"
   acx_cfitsio_save_CPP="$CPP"
   acx_cfitsio_save_CPPFLAGS="$CPPFLAGS"
   acx_cfitsio_save_LIBS="$LIBS"

   # Test serial compile and linking

   CPPFLAGS="$CPPFLAGS $CFITSIO_CPPFLAGS"
   LIBS="$CFITSIO $acx_cfitsio_save_LIBS -lm"

   AC_CHECK_HEADERS([fitsio.h])

   AC_MSG_CHECKING([for ffopen in user specified location])
   AC_TRY_LINK_FUNC(ffopen, [acx_cfitsio_ok=yes;AC_DEFINE(HAVE_CFITSIO,1,[Define if you have the CFITSIO library.])], [])
   AC_MSG_RESULT($acx_cfitsio_ok)

   if test $acx_cfitsio_ok = no; then
      CFITSIO="$acx_cfitsio_default"
      LIBS="$acx_cfitsio_default $acx_cfitsio_save_LIBS -lm"
      AC_MSG_CHECKING([for ffopen in default location])
      AC_TRY_LINK_FUNC(ffopen, [acx_cfitsio_ok=yes;AC_DEFINE(HAVE_CFITSIO,1,[Define if you have the CFITSIO library.])], [])
      AC_MSG_RESULT($acx_cfitsio_ok)
   fi

   if test $acx_cfitsio_ok = no; then
      CFITSIO=""
   fi

   # Get fortran linker names of function to check for.
   AC_FC_FUNC(ftgcvj)

   if test $acx_cfitsio_ok = yes; then
      AC_MSG_CHECKING([for $ftgcvj in CFITSIO])
      AC_TRY_LINK_FUNC($ftgcvj, [acx_cfitsio_fortran=yes;AC_DEFINE(HAVE_CFITSIO_FORTRAN,1,[Define if you have Fortran support in CFITSIO.])], [])
      AC_MSG_RESULT($acx_cfitsio_fortran)
   fi

   # Restore environment

   CC="$acx_cfitsio_save_CC"
   CPP="$acx_cfitsio_save_CPP"
   LIBS="$acx_cfitsio_save_LIBS"
   CPPFLAGS="$acx_cfitsio_save_CPPFLAGS"

fi

# Define exported variables

AC_SUBST(CFITSIO_CPPFLAGS)
AC_SUBST(CFITSIO)
AC_SUBST(CFITSIO_DIR)

# Execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
   
if test x"$acx_cfitsio_ok" = xyes; then
   ifelse([$1],,[echo "**** Enabling support for CFITSIO."],[$1])
else
   ifelse([$2],,[echo "**** CFITSIO not found - disabling support."],[$2])
fi

])
