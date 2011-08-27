#===============================================================================
# UFconfig.mk:  common configuration file for all UF sparse matrix packages
#===============================================================================

# This file contains all configuration settings for all packages authored or
# co-authored by Tim Davis at the University of Florida:
#
# Package Version       Description
# ------- -------       -----------
# AMD	  1.2 or later  approximate minimum degree ordering
# COLAMD  2.4 or later  column approximate minimum degree ordering
# CCOLAMD 1.0 or later  constrained approximate minimum degree ordering
# UMFPACK 4.5 or later	sparse LU factorization, with the BLAS
# CHOLMOD any		sparse Cholesky factorization, update/downdate
# KLU	  1.0 or later  sparse LU factorization, BLAS-free
# BTF	  1.0 or later  permutation to block triangular form
# LDL	  1.2 or later	concise sparse LDL'
# LPDASA  any		linear program solve (dual active set algorithm)
#
# The UFconfig directory and the above packages should all appear in a single
# directory, in order for the Makefile's within each package to find this file.
#
# To enable an option of the form "# OPTION = ...", edit this file and
# delete the "#" in the first column of the option you wish to use.

#------------------------------------------------------------------------------
# Generic configuration
#------------------------------------------------------------------------------

# C compiler and compiler flags:  These will normally not give you optimal
# performance.  You should select the optimization parameters that are best
# for your system.  On Linux, use "CFLAGS = -O3 -fexceptions" for example.
CC = cc
CFLAGS = -O3 -fPIC

# ranlib, and ar, for generating libraries
RANLIB = ranlib
AR = ar cr

# delete and rename a file
RM = rm -f
MV = mv -f

# Fortran compiler (not normally required)
F77 = gfortran
F77FLAGS = -O3
F77LIB =

# C and Fortran libraries
LIB = -lm

# For compiling MATLAB mexFunctions
MEX = mex -O

# Which version of MAKE you are using (default is "make")
# MAKE = make
# MAKE = gmake

#------------------------------------------------------------------------------
# BLAS and LAPACK configuration:
#------------------------------------------------------------------------------

# UMFPACK and CHOLMOD both require the BLAS.  CHOLMOD also requires LAPACK.
# See Kazushige Goto's BLAS at http://www.cs.utexas.edu/users/flame/goto/ or
# http://www.tacc.utexas.edu/~kgoto/ for the best BLAS to use with CHOLMOD.
# LAPACK is at http://www.netlib.org/lapack/ .  You can use the standard
# Fortran LAPACK along with Goto's BLAS to obtain very good performance.
# CHOLMOD gets a peak numeric factorization rate of 3.6 Gflops on a 3.2 GHz
# Pentium 4 (512K cache, 4GB main memory) with the Goto BLAS, and 6 Gflops
# on a 2.5Ghz dual-core AMD Opteron.
#
# Don't use the Intel MKL BLAS, you may get NaNs!  (See
# http://www.mathworks.com/support/bugreports/details.html?rp=252103
# for more details.  I get NaN's on a Pentium 4 with the Intel MKL BLAS).

# These settings will probably not work, since there is no fixed convention for
# naming the BLAS and LAPACK library (*.a or *.so) files.
BLAS = -Lusr/lib -lblas -lgfortran -lgfortranbegin $(XERBLA)
LAPACK = -llapack -lgfortran

# The BLAS might not contain xerbla, an error-handling routine for LAPACK and
# the BLAS.  Also, the standard xerbla requires the Fortran I/O library, and
# stops the application program if an error occurs.  A C version of xerbla
# distributed with this software (UFconfig/xerbla/libcerbla.a) includes a
# Fortran-callable xerbla routine that prints nothing and does not stop the
# application program.
#XERBLA = ../../UFconfig/xerbla/libcerbla.a 
XERBLA =

# If you wish to use the XERBLA in LAPACK instead, use this option:
# XERBLA = 

# If you wish to use the Fortran UFconfig/xerbla/xerbla.f instead, use this:
# XERBLA = ../../UFconfig/xerbla/libxerbla.a 

#------------------------------------------------------------------------------
# METIS, optionally used by CHOLMOD
#------------------------------------------------------------------------------

# The path is relative to where it is used, in CHOLMOD/Lib, CHOLMOD/MATLAB, etc.
# You may wish to use an absolute path.  METIS is optional.  Compile
# CHOLMOD with -DNPARTITION if you do not wish to use METIS.
METIS_PATH = ../../metis-4.0
METIS = ../../metis-4.0/libmetis.a

# If you use CHOLMOD_CONFIG = -DNPARTITION then use the following options:
# METIS_PATH =
# METIS =

#------------------------------------------------------------------------------
# UMFPACK configuration:
#------------------------------------------------------------------------------

# Configuration flags for UMFPACK.  See UMFPACK/Source/umf_config.h for details.
#
# -DNBLAS	do not use the BLAS.  UMFPACK will be very slow.
# -DCBLAS	use the C-BLAS interface to the BLAS
# -DLP64	UMFPACK is being compiled in 64-bit mode
# -DLONGBLAS	use "long" integers for the BLAS
# -DNSUNPERF	do not use the Sun Perf. Library (default is use it on Solaris)
# -DNSCSL	do not use the SGI SCSL BLAS (default is to use it on SGI)
# -DNPOSIX	do not use POSIX routines sysconf and times.
# -DGETRUSAGE	use getrusage
# -DNO_TIMER	do not use any timing routines
# -DNRECIPROCAL	do not multiply by the reciprocal
# -DNO_DIVIDE_BY_ZERO	do not divide by zero

UMFPACK_CONFIG = 

#------------------------------------------------------------------------------
# CHOLMOD configuration
#------------------------------------------------------------------------------

# CHOLMOD Library Modules, which appear in libcholmod.a:
# Core		requires: none
# Check		requires: Core
# Cholesky	requires: Core, AMD, COLAMD.  optional: Partition, Supernodal
# MatrixOps	requires: Core
# Modify	requires: Core
# Partition	requires: Core, CCOLAMD, METIS.  optional: Cholesky
# Supernodal	requires: Core, BLAS, LAPACK
#
# CHOLMOD test/demo Modules (all are GNU GPL, do not appear in libcholmod.a):
# Tcov		requires: Core, Check, Cholesky, MatrixOps, Modify, Supernodal
#		optional: Partition
# Valgrind	same as Tcov
# Demo		requires: Core, Check, Cholesky, MatrixOps, Supernodal
#		optional: Partition
#
# Configuration flags:
# -DNCHECK	    do not include the Check module.	   License GNU LGPL
# -DNCHOLESKY	    do not include the Cholesky module.	   License GNU LGPL
# -DNPARTITION	    do not include the Partition module.   License GNU LGPL
# -DNGPL	    do not include any GNU GPL Modules in the CHOLMOD library:
# -DNMATRIXOPS	    do not include the MatrixOps module.   License GNU GPL
# -DNMODIFY	    do not include the Modify module.      License GNU GPL
# -DNSUPERNODAL     do not include the Supernodal module.  License GNU GPL
#
# -DNPRINT	    do not print anything.
# -D'LONGBLAS=long' or -DLONGBLAS='long long' defines the integers used by
#  		    	LAPACK and the BLAS (defaults to 'int')
# -DNSUNPERF	    for Solaris only.  If defined, do not use the Sun
#			Performance Library

CHOLMOD_CONFIG =

#------------------------------------------------------------------------------
# Linux
#------------------------------------------------------------------------------

# Using default compilers:
CC = gcc
CFLAGS = -O3 -fPIC -fexceptions -m64

# alternatives:
# CFLAGS = -g -fexceptions \
   	-Wall -W -Wshadow -Wmissing-prototypes -Wstrict-prototypes \
    	-Wredundant-decls -Wnested-externs -Wdisabled-optimization -ansi
# CFLAGS = -O3 -fexceptions \
   	-Wall -W -Werror -Wshadow -Wmissing-prototypes -Wstrict-prototypes \
    	-Wredundant-decls -Wnested-externs -Wdisabled-optimization -ansi
# CFLAGS = -g -fexceptions
# CFLAGS = -O3

# consider:
# -fforce-addr -fmove-all-movables -freduce-all-givs -ftsp-ordering
# -frename-registers -ffast-math -funroll-loops

# Using the Goto BLAS:
# BLAS = -lgoto -lfrtbegin -lgfortran $(XERBLA) -lpthread

# Using Intel's icc and ifc compilers:
#   (does not work for mexFunctions unless you add a mexopts.sh file)
# F77 = ifc
# CC = icc
# CFLAGS = -O2 -xN
# old (broken): CFLAGS = -ansi -O3 -ip -tpp7 -xW -vec_report0

# 64bit:
# F77FLAGS = -O -m64
# CFLAGS = -O3 -fexceptions -m64
# BLAS = -lgfortran -lpthread -Lusr/lib -lf77blas -latlas $(XERBLA)
# LAPACK = -llapack64 -lgfortran


#------------------------------------------------------------------------------
# Solaris
#------------------------------------------------------------------------------

# 32-bit
# CFLAGS = -KPIC -dalign -xc99=%none -Xc -xlibmieee -xO5 -xlibmil

# 64-bit
# CFLAGS = -KPIC -dalign -xc99=%none -Xc -xlibmieee -xO5 -xlibmil -xarch=v9

# BLAS = -xlic_lib=sunperf
# LAPACK =

#------------------------------------------------------------------------------
# Compaq Alpha
#------------------------------------------------------------------------------

# 64-bit mode only
# CFLAGS = -O2 -std1 -DLP64
# BLAS = -ldxml
# LAPACK =

#------------------------------------------------------------------------------
# Macintosh (untested)
#------------------------------------------------------------------------------

# CC = gcc-3.3
# CFLAGS = -O3 -fno-common -no-cpp-precomp -fexceptions
# LIB = -lstdc++

#------------------------------------------------------------------------------
# IBM RS 6000
#------------------------------------------------------------------------------

# BLAS = -lessl
# LAPACK =

# 32-bit mode:
# CFLAGS   = -O4 -qipa -qmaxmem=16384 -qproto
# F77FLAGS = -O4 -qipa -qmaxmem=16384

# 64-bit mode:
# CFLAGS   = -O4 -qipa -qmaxmem=16384 -q64 -DLP64 -qproto
# F77FLAGS = -O4 -qipa -qmaxmem=16384 -q64 -DLP64
# AR = ar -X64

#------------------------------------------------------------------------------
# SGI IRIX
#------------------------------------------------------------------------------

# BLAS = -lscsl
# LAPACK =

# 32-bit mode
# CFLAGS = -O

# 64-bit mode (32 bit int's and 64-bit long's):
# CFLAGS = -DLP64 -64
# F77FLAGS = -64

# SGI doesn't have ranlib
# RANLIB = echo

#------------------------------------------------------------------------------
# remove object files and profile output
#------------------------------------------------------------------------------

CLEAN = *.o *.obj *.ln *.bb *.bbg *.da *.tcov *.gcov gmon.out *.bak *.d
