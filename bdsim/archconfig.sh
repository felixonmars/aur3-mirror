#!/bin/sh -e

USE_ROOT=''
_G4ver=9
_G4minver=3
_CLHEPver=2.0
_CLHEPweirdver=9


# Determine if libxml exist...
# we will uyse at the end of the file
#For linear collider detector description format LCDD (in development)
#xmltest=`which xml2-config`
#if [ ! -z "$xmltest" ]; then
#printf "You have libxml installed:\n"
#printf "Do you want to enable the GDML geometry description format ?\n"
#read -p "[y/n]" value
#if test "$value" == "y"; then
#    USE_LCDD="-DUSE_LCDD"
#    USE_LCDD_CFLAGS=`xml2-config --cflags`
#	         echo "           BDSIM is able to read LCDD format...."
#fi
#fi

#     USE_GDML="-DUSE_GDML" # not working at the moment :(

# copy from configure script...
  Makefile='Makefile'
  echo > $Makefile 
  #echo " ###########################################  " > $Makefile
  echo "#   Makefile for BDSIM                       " >> $Makefile
  echo "#   Generated automatically                  " >> $Makefile
  echo "#   by  ${USER}                             " >> $Makefile
  echo "#   on $(date)                               " >> $Makefile
  #echo "#                                            " >> $Makefile
  #echo " ###########################################  " >> $Makefile
  echo >> $Makefile
  echo >> $Makefile
  cat Makefile.in  | sed "   
		s%@G4INSTALL@%$G4INSTALL%g;  
      s%@G4LIBDIR@%$G4LIBDIR%g;  
		s%@ROOTSYS@%$ROOT_sys%g;  
		s%@BINDIR@%`pwd`%g;  
		s%@G4VERSION@%$_G4ver%g;  
		s%@G4MINORVERSION@%$_G4minver%g;  
		s%@CLHEP_VERSION@%$_CLHEPweirdver%g;  
		s%@USE_ROOT@%$USE_ROOT%g;
		s%@USE_GDML@%$USE_GDML%g;
		s%@USE_LCDD@%$USE_LCDD%g;
		s%@LCDD_CFLAGS@%$LCDD_CFLAGS%g;
		s%@LCDD_LIBS@%$LCDD_LIBSS%g;
		s%@OGLLIBS@%$opengllib%g;  " >> $Makefile